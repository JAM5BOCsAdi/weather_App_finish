import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  // Get the current location by accuracy
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    // Decimal latitude and longitude coordinates for Szombathely (Hungary):
    double lat = 47.23088;
    double lon = 16.62155;
    String appidCurrent = "9e1f0e2cfca262ce8ad574425d8f993b";
    String url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$appidCurrent';

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      var longitude = jsonDecode(data)["coord"]["lon"];
      print(longitude);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return const SafeArea(
      child: Scaffold(),
    );
/*
    TRY - CATCH

    String myMargin = "abc";
    double? myMarginAsADouble;
    try {
      myMarginAsADouble = double.parse(myMargin);
    } catch (e) {
      print(e);
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(myMarginAsADouble ?? 30.0),
          // To RUN " Default: 30.0 " you need to add "?" to double? myMarginAsADouble
          // IF the " String myMargin = "15"; ", the myMarginAsADouble will (run) be the value.
          // IF the " String myMargin = "abc"; ", the 30.0 will (run) be the value.
          color: Colors.red,
        ),
      ),
    );
*/
  }
}
