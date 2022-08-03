import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({required this.url});

  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;

      dynamic decodedJSONData = jsonDecode(data);

/*
      double temperature = decodedJSONData["main"]["temp"];
      print(temperature);
      int weatherID = decodedJSONData["weather"][0]["id"]; // Because inside "weather" there is a List of 1 item, that contains properties
      print(weatherID);
      String name = decodedJSONData["name"]; // City Name
      print(name);
*/

      return decodedJSONData;
    } else {
      print(response.statusCode);
    }
  }
}
