import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  double _sliderValue = 20.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('All the TextField here...',style: TextStyle(fontSize: 20),),
                // TextField(
                //
                //   decoration:InputDecoration(
                //     hintText: 'Enter your name',
                //   ) ,
                // )
                TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      prefixIcon: Icon(Icons.person),

                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';

                      }
                    }
                ),
                SizedBox(height: 10,),
                Text('Simple checkbox'),
                Checkbox(value: _isChecked,
                  onChanged: (value)=>setState(()=>_isChecked=value!),
                ),
                SizedBox(height: 20,),
                Text('Checkbox listtile'),
                CheckboxListTile(
                  title: Text("Accept Terms & conditions"),
                  subtitle: Text('You must accept before proceeding'),
                  value: _isChecked,
                  onChanged: (value)=>setState(()=>_isChecked=value!),
                  activeColor: Colors.redAccent,
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                SizedBox(height: 20,),
                Text('Switch'),
                Switch(value: _isChecked,
                  onChanged: (value)=>setState(()=>_isChecked=value),
                ),

                SizedBox(height: 20,),
                Text('SwitchListTile'),
                SwitchListTile(
                  title: Text("Accept Terms & conditions"),
                  subtitle: Text('You must accept before proceeding'),
                  value: _isChecked,
                  onChanged: (value)=>setState(()=>_isChecked=value),
                  activeColor: Colors.green,
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                SizedBox(height: 20,),
                Text('Switch.adaptive'),
                Switch.adaptive(value: _isChecked,
                  onChanged: (value)=>setState(()=>_isChecked=value),
                ),
                SizedBox(height: 20,),
                Text('Slider'),
                Text('Slider Value ${_sliderValue.toInt()}'),
                Slider(

                  value: _sliderValue,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: _sliderValue.round().toString(),
                  onChanged: (val)=>setState(()=>_sliderValue=val),
                ),
                SizedBox(height: 20,),
                Text('GestureDetector'),
                Text('GestureDetector'),
                Text('GestureDetector'),
                Text('GestureDetector'),
                Text('GestureDetector'),
                Text('GestureDetector'),
                Text('GestureDetector'),

                GestureDetector(
                  onTap: ()=>print('Tapped'),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    color: Colors.lightGreenAccent,
                    child: Text('Tap me'),
                  ),
                )

              ],
            )
        ),
      ),

    );
  }
}