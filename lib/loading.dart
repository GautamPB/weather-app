import 'package:flutter/material.dart';
import './home.dart';
import './utils/Weather.dart';

class Loading extends StatefulWidget {
  const Loading({key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Weather fetchWeather = new Weather('Mangalore', 'Mangalore');

  void setupWeatherData() async {
    await fetchWeather.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'city': fetchWeather.city,
      'name': fetchWeather.name,
      'url': fetchWeather.url,
      'temp': fetchWeather.temp,
      'mainWeather': fetchWeather.mainWeather,
      'description': fetchWeather.description,
      'humidity': fetchWeather.humidity,
      'coord': fetchWeather.coord,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Loading',
          style: TextStyle(
            fontSize: 40,
            letterSpacing: 2
          ),
        ),
      ),
    );
  }
}
