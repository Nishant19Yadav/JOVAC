import 'package:flutter/material.dart';

import 'Screens/about_screen.dart';
import 'Screens/home_screen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation and Routes part 2',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>HomeScreen(),
        '/about':(context)=>AboutScreen(),
      },
    );
  }
}