import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedValue = 'Item 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('All about the buttons..',style: TextStyle(fontSize: 30),),
              ElevatedButton(
                  onPressed: ()=>{print('ElevatedButton pressed')}
                  , child: Text('ElevatedButton...!!')),
              SizedBox(height: 20,),
              TextButton(
                  onPressed:()=>{print("Text Button pressed")}
                  , child: Text('Text Button')
              ),
              SizedBox(height: 20,),
              OutlinedButton(
                onPressed: ()=>{print("OutlinedButton pressed")},
                child: Text('Outlined Button'),
              ),
              SizedBox(height: 20,),
              IconButton(
                onPressed:()=>{print("IconButton pressed")},
                icon: Icon(Icons.add),
              ),
              SizedBox(height: 20,),
              DropdownButton(
                value: _selectedValue,
                onChanged: (String? newValue){
                  setState(() {
                    _selectedValue = newValue!;
                  });
                },
                items: [
                  DropdownMenuItem(
                    child: Text('Item 1'),
                    value: 'Item 1',
                  ),
                  DropdownMenuItem(
                    child: Text('Item 2'),
                    value: 'Item 2',
                  ),
                  DropdownMenuItem(
                    child: Text('Item 3'),
                    value:'Item 3',
                  ),
                ],
              ),
              SizedBox(height: 20,),
              PopupMenuButton<String>(
                onSelected: (value)=>{print(value)},
                itemBuilder:(context)=>[
                  PopupMenuItem(
                      value: 'Item 1',
                      child: Text('Item 1')
                  ),
                  PopupMenuItem(
                      value: 'Item 2',
                      child: Text('Item 2')
                  ),
                  PopupMenuItem(
                      value: 'Item 3',
                      child: Text('Item 3')
                  ),
                ],
                child:ElevatedButton(
                  onPressed: null,
                  child: Text('Popup Button'),
                ),
              ),
              SizedBox(height: 40,),
              InkWell(
                onTap: (){print('InkWell pressed');},
                child: Text('InkWell'),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}