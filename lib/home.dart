import 'package:flutter/material.dart';
import './choose_location.dart';

class Home extends StatefulWidget {
  @override
  _FetchState createState() => _FetchState();
}

class _FetchState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context).settings.arguments as Map;

    String bgImage = data['mainWeather'];

    return Scaffold(
      appBar: AppBar(
        title: Text("${data['url']}"),
        centerTitle: true,
      ),
      // backgroundColor: Colors.blue[200],
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('../images/$bgImage.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${data['temp']}°C',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${data['mainWeather']}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${data['description']}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Humidity: ${data['humidity']}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Wind: ${data['wind']}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Pressure: ${data['pressure']}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            dynamic result = await Navigator.pushNamed(context, '/choose');
            // print(result);
            setState(() {
              data = {
                'name': result['name'],
                'temp': result['temp'],
                'url': result['url'],
                'city': result['city'],
                'mainWeather': result['mainWeather'],
                'description': result['description'],
                'humidity': result['humidity'],
                'wind': result['wind'],
                'pressure': result['pressure']
              };
            });
          } catch (e) {
            data = {};
          }
        },
        child: IconButton(
          icon: Icon(Icons.edit_location),
        ),
      ),
    );
  }
}
