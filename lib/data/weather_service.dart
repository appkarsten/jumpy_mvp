import 'dart:math';

import 'package:http/http.dart';
import 'dart:convert';

class Weather {
  static Future<Map> currentWeather(String location) async {
    location = location.replaceAll(' ', '%20');
    Map weather = {};
    final String uriString =
        // 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/leipzig?unitGroup=metric&include=current&key=HEQ5H2LH62MFBESCKMQWMR2QB&contentType=json';
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/{$location}?unitGroup=metric&key=HEQ5H2LH62MFBESCKMQWMR2QB&contentType=json';
    final String uriFallback =
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/leipzig?unitGroup=metric&include=current&key=HEQ5H2LH62MFBESCKMQWMR2QB&contentType=json';
    final response = await get(Uri.parse(uriString));
    try {
      weather = jsonDecode(response.body);
    } catch (error) {
      final response = await get(Uri.parse(uriFallback));
      weather = jsonDecode(response.body);
    }
    // final response = await get(Uri.parse(uriStringKalpitya));

    // final List names = users.map((e) => e['name']).toList();
    // final List names
    // print(weather['currentConditions']);

    //int conditions = weather['current']['weather_code'];
    // print(conditions);
    return weather['currentConditions'];
  }
}
