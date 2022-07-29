import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
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
            },
            child: const Text('Get Location'),
          ),
        ),
      ),
    );
  }
}
