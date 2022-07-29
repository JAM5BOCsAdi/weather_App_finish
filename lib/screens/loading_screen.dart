import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print("------ getCurrentPosition ------");
    print(position);
/*
    LocationPermission permission = await Geolocator.checkPermission();
    print("------ CHECK PERMISSION ------");
    print(permission);
    permission = await Geolocator.requestPermission();
    print("------ REQUEST PERMISSION ------");
    print(permission);
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    print("------ LOCATION SERVICE ------");
    print(isLocationServiceEnabled);
*/
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: RawMaterialButton(
            // Size of the Button:
            //constraints: BoxConstraints.tightFor(height: 100.0, width: 100.0),
            fillColor: Colors.blue,
            onPressed: () {
              //Get the current location
              getLocation();
            },
            child: const Text('Get Location'),
          ),
        ),
      ),
    );
  }
}
