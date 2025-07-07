import 'package:flutter/material.dart';

import 'Screens/splash_screen.dart';

void main(){
  runApp(Taskly());
}
class Taskly extends StatelessWidget {
  const Taskly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Takly',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
