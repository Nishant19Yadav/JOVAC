
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  static final _auth=FirebaseAuth.instance;
  static User ? get CurrentUser=> _auth.currentUser;



  static Future<UserCredential>signUp(String email,String password)async{
    return await _auth.createUserWithEmailAndPassword(email:email,password:password);
  }

  static Future<UserCredential>signIn(String email,String password)async{
    return await _auth.signInWithEmailAndPassword(email: email, password: password);
  }






}
