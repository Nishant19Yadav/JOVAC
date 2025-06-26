import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator or Pages',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/about': (context) => AboutPage(),
        '/contact':(context)=>ContactPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Push worked with MaterialPageRoute'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AboutPage()),
            ),
          ),
          ListTile(
            title:Text('PushNamed worked with route!..'),
            onTap: ()=> Navigator.pushNamed(
                context,
                '/about'
            ),
          ),
          ListTile(
            title:Text('PushReplacement worked with materialpageroute!..'),
            onTap: ()=> Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => ContactPage()),
            ),
          ),
          ListTile(
              title:Text('PushReplacementNamed worked with route!..'),
              onTap: ()=> Navigator.pushReplacementNamed(
                  context,
                  '/contact')
          ),
          ListTile(
            title: Text('PushAndRemoveUntil worked with materialpageroute!..'),
            onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => AboutPage()),
                  (route) => false,
            ),
          ),
          ListTile(
            title: Text('PushNamedAndRemoveUntil worked with route!..'),
            onTap: () => Navigator.pushNamedAndRemoveUntil(
              context,
              '/about',
                  (route) => false,
            ),
          )
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Page'), centerTitle: true),
      body: Center(child: Column(children: [Text('Hello!..')])),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Page'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            children: [
              Text('Contact'),
              ElevatedButton(onPressed: ()=>Navigator.pop(context), child: Text('Back'))
            ],

          )
      ),
    );
  }
}