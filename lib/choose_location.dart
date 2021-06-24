import 'package:flutter/material.dart';
import './utils/Weather.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<Weather> locations = [
    Weather('Afghanistan', 'Afghanistan'),
    Weather('Bangladesh', 'Bangladesh'),
    Weather('Brazil', 'Brazil'),
    Weather('China', 'China'),
    Weather('Denmark', 'Denmark'),
    Weather('France', 'France'),
    Weather('Germany', 'Germany'),
    Weather('India', 'India'),
    Weather('Italy', 'Italy'),
    Weather('Japan', 'Japan'),
    Weather('Malaysia', 'Malaysia'),
    Weather('Nepal', 'Nepal'),
    Weather('North Korea', 'North Korea'),
    Weather('Pakistan', 'Pakistan'),
    Weather('Russia', 'Russia'),
    Weather('Saudi Arabia', 'Saudi Arabia'),
    Weather('Singapore', 'Singapore'),
    Weather('Thailand', 'Thailand'),
    Weather('Thailand', 'Thailand'),
    Weather('United States of America', 'United States of America'),
    Weather('Vietnam', 'Vietnam'),
    Weather('Zimbabwe', 'Zimbabwe'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            color: Colors.white,
            child: Card(
              elevation: 5,
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.height *0.01,
                top: MediaQuery.of(context).size.height * 0.015,
                right: MediaQuery.of(context).size.height * 0.01,
                bottom: MediaQuery.of(context).size.height * 0.013
              ),
              color: Colors.blue[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.03,
                  top: MediaQuery.of(context).size.height * 0.03,
                ),
                child: Text(
                  '${locations[index].city}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
