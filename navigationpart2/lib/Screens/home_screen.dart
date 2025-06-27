import 'package:flutter/material.dart';

import 'about_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
              title: Text('Push worked with MaterialPageRoute'),
              onTap:()=>Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_)=>AboutScreen(
                      data: 'This is data passed to the About Screen',
                    )
                ),
              )
          ),
          ListTile(
              title: Text('Push worked with Named Route'),
              onTap:()=>Navigator.pushNamed(
                context,
                '/about',
                arguments: 'This is data passed to the About Screen by routes name',
              )
          )
        ],
      ),
    );
  }
}