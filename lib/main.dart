import 'package:flutter/material.dart';
import 'package:weather_app/choose_location.dart';
import 'package:weather_app/home.dart';
// import 'package:weather_app/choose_location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/choose': (context) => ChooseLocation()
      },
    );

    // is not restarted.

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
