import 'package:http/http.dart';
import 'dart:convert';

class Weather {
  static Future<Map> currentWeather(String location) async {
    location = location.replaceAll(' ', '%20');
    Map weather = {};
    final String uriString =
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
    return weather['currentConditions'];
  }
}
