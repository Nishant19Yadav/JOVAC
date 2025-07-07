import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taskly/Screens/task_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), (){
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) =>const TaskScreen())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.note_alt, size: 100,color: Colors.grey),
            Text(
                'Taskly',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 30,
                   fontWeight: FontWeight.bold,
                   letterSpacing: 2
                 ),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(
              color: Colors.white,
            )
          ]
        )
      )
    );
  }
}
