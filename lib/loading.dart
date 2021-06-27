import 'package:flutter/material.dart';
import './home.dart';
import './utils/Weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loading extends StatefulWidget {
  const Loading({key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Position position;
  Placemark place;
  String sublocalityGlobal = 'Mangalore';

  void getPosition() async {
    // position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    // print(position);
    // List<Placemark> placemarks =
    //     await placemarkFromCoordinates(position.latitude, position.longitude);
    // place = placemarks[1];
    // sublocality = place.locality;

    // print(placemarks);
    // print(sublocality);
  }

  void setupWeatherData() async {
    String sublocality = sublocalityGlobal;
    Weather fetchWeather = new Weather(sublocality, sublocality);
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
      'wind': fetchWeather.wind,
      'pressure': fetchWeather.pressure
    });
  }

  @override
  void initState() {
    super.initState();
    getPosition();
    setupWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Loading',
          style: TextStyle(fontSize: 40, letterSpacing: 2),
        ),
      ),
    );
  }
}
