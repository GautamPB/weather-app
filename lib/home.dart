import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _FetchState createState() => _FetchState();
}

class _FetchState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // Map data = {};
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments as Map;

    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 200,
              ),
              Text(
                "${data['name']}",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "${data['mainWeather']}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "${data['temp']}°C",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 70, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              Text(
                "${data['description']}",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              Text(
                'Humidity: ${data["humidity"]}',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              Text(
                "${data['coord']}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              )
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/choose');
        },
        child: IconButton(
          icon: Icon(Icons.edit_location),
        ),
      ),
    );
    // return Scaffold(
    //   body: Text("${data['city']}"),
    // );
  }
}
