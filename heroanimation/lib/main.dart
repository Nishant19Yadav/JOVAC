import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Showing Different Widgets',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  final String imageUrl =
      'https://cdn.pixabay.com/photo/2015/04/23/22/00/new-year-background-736885_1280.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card Widget'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 4,
              shadowColor: Colors.blueGrey,
              color: Colors.white,
              margin: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.purple, width: 2),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Image.network(imageUrl),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Beautiful Card',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(
              height: 50,
              thickness: 10,
              radius: BorderRadius.circular(20),
              endIndent: 10,
              indent: 10,
              color: Colors.purple,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Are you sure!'),
                      content: Text('Do you want to delete your data....'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Show Alert Dialog'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        Icon(Icons.thumb_up, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Saved Successfully'),
                      ],
                    ),
                    duration: Duration(seconds: 5),
                    backgroundColor: Colors.green,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(16),
                    action: SnackBarAction(
                      label: "Undo",
                      textColor: Colors.yellow,
                      onPressed: () {
                        print('Undo pressed');
                      },
                    ),
                    onVisible: () {
                      print('Snackbar is visible');
                    },
                  ),
                );
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(imageUrl),
            ),
            SizedBox(height: 20),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAlias,
                child: Image.network(imageUrl, height: 200, fit: BoxFit.cover),
              ),
            ),

            SizedBox(height: 20),
            ClipOval(
              child: Image.network(
                imageUrl,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            ClipPath(
              clipper: TriangleCliper(),
              child: Container(color: Colors.teal, width: 200, height: 200),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage(imageUrl: imageUrl)));
                Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 1500),
                      pageBuilder: (_, __, ___) => SecondPage(imageUrl: imageUrl),
                      transitionsBuilder: (_,animation,__,child)=>FadeTransition(
                          opacity: animation,
                          child: child
                      )
                    // transitionsBuilder: (_, animation, __, child) {
                    //   return SlideTransition(
                    //     position: Tween<Offset>(
                    //       begin: Offset(1, 0),
                    //       end: Offset.zero,
                    //     ).animate(animation),
                    //     child: child,
                    //   );
                    // },
                  ),
                );
              },
              child: Hero(
                tag: 'myHeroImage',
                flightShuttleBuilder:
                    (
                    flightContext,
                    animation,
                    flightDirection,
                    fromHeroContext,
                    toHeroContext,
                    ) {
                  return AnimatedBuilder(
                      animation: animation,
                      builder: (context,child){
                        return Transform.scale(
                          scale:Tween(
                              begin: 0.2,
                              end: 1.5
                          ).evaluate(animation),
                        );
                      }
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(imageUrl, width: 400),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String imageUrl;
  const SecondPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page'), centerTitle: true),
      body: Center(
        child: Hero(
          tag: 'myHeroImage',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(imageUrl, width: 400),
          ),
        ),
      ),
    );
  }
}

class TriangleCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}