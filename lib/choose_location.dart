import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton.icon(
            icon: Icon(Icons.add),
            label: Text("Increment Counter"),
            onPressed: () {
              setState(() {
                counter++;
              });
            },
          ),

          SizedBox(height: 20,),

          Text(
            'Counter value is $counter'
          )
        ],
      ),
    );
  }
}
