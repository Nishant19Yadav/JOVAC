import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;
    return MaterialApp(
       title: 'mediaquery',
       debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('MediaQuery App'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              width: size.width*0.6,
              height: orientation == Orientation.portrait ? 400:100 ,
              child: Center(child: Text('Hello')),
            ),
            SizedBox(height: 20,),
            FractionallySizedBox(

               widthFactor: 0.7,
              alignment: Alignment.center,
              child: Container(
                height: 40,
                color: Colors.yellow,
                child: Center(child: Text('Hello')),
              ),
            ),
            Row(
              children: [
                Expanded(child: Text('Hello'))
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                child: Text('A'),
              ),
            )
          ],
        )
      ),

    );
  }
}
