import 'dart:math';

import 'package:http/http.dart';
import 'dart:convert';

class Weather {
  static Future<Map> currentWeather(String location) async {
    final String uriString =
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/{$location}?unitGroup=metric&include=current&key=HEQ5H2LH62MFBESCKMQWMR2QB&contentType=json';
    final response = await get(Uri.parse(uriString));
    // final response = await get(Uri.parse(uriStringKalpitya));
    final weather = jsonDecode(response.body);

    // final List names = users.map((e) => e['name']).toList();
    // final List names
    print(weather['currentConditions']);

    //int conditions = weather['current']['weather_code'];
    // print(conditions);
    return weather['currentConditions'];
  }
}
