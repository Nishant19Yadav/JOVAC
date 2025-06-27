import 'package:flutter/material.dart';

class AcceptAnydata extends StatelessWidget {
  final dynamic data;
  const AcceptAnydata({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final dynamic receivedData = data ?? ModalRoute.of(context)?.settings.arguments ?? 'No data passed';

    Widget showReceivedData;
    if (receivedData is String) {
      showReceivedData = Text(receivedData);
    } else if (receivedData is int) {
      showReceivedData = Text('Received Integer: $receivedData');
    }else if(receivedData is List){
      showReceivedData = Column(
          children:receivedData.map((item)=>Text(item.toString())).toList()
      );
    }
    else{
      showReceivedData = Text('There is no data');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Screen for accept anytype of data'),
        centerTitle: true,
      ),
      body: Center(
        child:showReceivedData,
      ),
    );
  }
}