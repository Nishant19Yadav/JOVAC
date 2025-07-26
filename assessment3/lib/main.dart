import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfilePage(),
  ));
}

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  final picker = ImagePicker();

  Future<void> _pickAndUploadImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;

    File file = File(picked.path);
    final ref = FirebaseStorage.instance
        .ref()
        .child('profile_images')
        .child('${user!.uid}.jpg');
    await ref.putFile(file);
    final url = await ref.getDownloadURL();

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .update({'imageUrl': url});
  }

  Stream<DocumentSnapshot> get userStream => FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid)
      .snapshots();

  Stream<QuerySnapshot> get postsStream => FirebaseFirestore.instance
      .collection('posts')
      .where('userId', isEqualTo: user!.uid)
      .orderBy('timestamp', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Scaffold(
        body: Center(child: Text("User not logged in")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Profile Page")),
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
          stream: userStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return Column(
              children: [
                SizedBox(height: 20),
                GestureDetector(
                  onTap: _pickAndUploadImage,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: userData['imageUrl'] != null &&
                        userData['imageUrl'] != ''
                        ? NetworkImage(userData['imageUrl'])
                        : AssetImage('assets/default_user.png') as ImageProvider,
                  ),
                ),
                SizedBox(height: 10),
                Text(userData['name'] ?? 'No Name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(userData['email'] ?? 'No Email',
                    style: TextStyle(color: Colors.grey[700])),
                Divider(height: 30),
                Text("My Posts",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                StreamBuilder<QuerySnapshot>(
                  stream: postsStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(child: CircularProgressIndicator());

                    final posts = snapshot.data!.docs;
                    if (posts.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("No posts found."),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post =
                        posts[index].data() as Map<String, dynamic>;
                        final timestamp =
                        (post['timestamp'] as Timestamp).toDate();
                        return Card(
                          margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          child: ListTile(
                            leading: post['imageUrl'] != null &&
                                post['imageUrl'] != ''
                                ? Image.network(
                              post['imageUrl'],
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )
                                : null,
                            title: Text(post['content'] ?? ''),
                            subtitle: Text(
                                DateFormat.yMMMd().add_jm().format(timestamp)),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
