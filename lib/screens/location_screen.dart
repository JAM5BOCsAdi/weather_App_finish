import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, this.locationWeather}) : super(key: key);

  final dynamic locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temperature;
  late int weatherID;
  late String name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    double temp = weatherData["main"]["temp"];
    temperature = temp.toInt();
    weatherID = weatherData["weather"][0]["id"]; // Because inside "weather" there is a List of 1 item, that contains properties
    name = weatherData["name"]; // City Name
    print(temperature);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('images/location_background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RawMaterialButton(
                      //fillColor: Colors.blue,
                      onPressed: () {},
                      child: const Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                    RawMaterialButton(
                      //fillColor: Colors.red,
                      onPressed: () {},
                      child: const Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '$temperature°',
                        style: kTempTextStyle,
                      ),
                      const Text(
                        '☀️',
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    "It's 🍦 time in San Francisco!",
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
double temperature = decodedJSONData["main"]["temp"];
print(temperature);
int weatherID = decodedJSONData["weather"][0]["id"]; // Because inside "weather" there is a List of 1 item, that contains properties
print(weatherID);
String name = decodedJSONData["name"]; // City Name
print(name);
*/
