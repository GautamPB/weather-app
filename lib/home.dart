import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './utils/Weather.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _FetchState createState() => _FetchState();
}

class _FetchState extends State<Home> {
  Future<Weather> fetchPerson;

  Future<Weather> getData() async {
    String myUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=Mangalore&appid=63af7a75c9468e6bb0834f0e2932e1c0";

    var response = await http.get(Uri.parse(myUrl));

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
      backgroundColor: Colors.blue[200],
      body: FutureBuilder(
        future: fetchPerson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    '${snapshot.data.name}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${snapshot.data.mainWeather}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${snapshot.data.temp} °C',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${snapshot.data.description}',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Humidity: ${snapshot.data.humidity}',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${snapshot.data.coord}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  )
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/choose');
        },
        child: IconButton(
          icon: Icon(Icons.edit_location),
        ),
      ),
    );
  }
}
