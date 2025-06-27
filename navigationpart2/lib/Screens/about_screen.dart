import 'package:flutter/material.dart';
import 'accept_anydata.dart';
class AboutScreen extends StatelessWidget {
  final String? data;
  const AboutScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final receivedData = data?? ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('About Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('About Screen'),
            Text(data ?? ''),
            Text('$receivedData'),
            ElevatedButton(
              onPressed: ()=>Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_)=>AcceptAnydata(
                        data:['o','1','2'],)
                  )
              ),
              child: Text('show anytype of data'),
            )
          ],
        ),
      ),
    ) ;
  }
}