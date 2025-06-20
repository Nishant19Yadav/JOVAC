import 'package:flutter/material.dart';
import 'package:projectday8/pages/counter_app_page.dart';
import 'package:projectday8/pages/my_counter.dart';



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNavigation Bar',
      home:MyCounter(),
    );
  }
}
class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int counter =0;

  void incrementCounter(){
    setState(() {
      counter++;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Numbers increasing',style: TextStyle(
              fontSize: 30,color: Colors.grey,
            ),),
            Text('$counter',style: TextStyle(fontSize: 25),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
