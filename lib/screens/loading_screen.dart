import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  static const appidKey = "9e1f0e2cfca262ce8ad574425d8f993b";

  // Decimal latitude and longitude coordinates for Szombathely (Hungary):
  /*
    late double lat; // 47.23088
    late double lon; // 16.62155
  */

  late dynamic getLocation;

  @override
  void initState() {
    super.initState();
    getLocation = getWeatherData;
  }

  // Get the current location by accuracy
  Future<dynamic> getWeatherData() async {
    final Location location = Location();

    await location.getCurrentLocation();

    if (location.latitude != null && location.longitude != null) {
      NetworkHelper networkHelper = NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$appidKey&units=metric');

      return await networkHelper.getData();
    } else {
      throw Exception("No location!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder(
        future: getLocation(),
        builder: (context, snapshot) {
          if (snapshot.hasData) return LocationScreen(locationWeather: snapshot.data);
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SpinKitFadingCircle(
                  color: Colors.white,
                  duration: Duration(seconds: 3),
                ),
                SizedBox(height: 8.0),
                Text("Időjárás adatok betöltése...")
              ],
            );
          }
        },
      )),
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
