import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Weather {
  final String name;
  final double temp;

  Weather({this.name, this.temp});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['name'],
      temp: json['main']['temp'],
    );
  }
}

class Home extends StatefulWidget {
  @override
  _FetchState createState() => _FetchState();
}

class _FetchState extends State<Home> {
  Future<Weather> fetchPerson;

  Future<Weather> getData() async {
    String myUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=Mangalore&appid=63af7a75c9468e6bb0834f0e2932e1c0";

    var response = await http.get(myUrl);

    Map<String, dynamic> responseJson = jsonDecode(response.body);
    return Weather.fromJson(responseJson);
  }

  @override
  void initState() {
    fetchPerson = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchPerson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Place: ${snapshot.data.name}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'temp is: ${snapshot.data.temp}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            Text(
              snapshot.error.toString(),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
