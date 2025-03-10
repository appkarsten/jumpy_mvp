import 'dart:math';

import 'package:http/http.dart';
import 'dart:convert';

class Weather {
  static Future<Map> currentWeather() async {
    const List<String> uriString = [
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/kalpitiya?unitGroup=metric&key=HEQ5H2LH62MFBESCKMQWMR2QB&contentType=json',
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/leipzig?unitGroup=metric&key=HEQ5H2LH62MFBESCKMQWMR2QB&contentType=json',
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/berlin?unitGroup=metric&key=HEQ5H2LH62MFBESCKMQWMR2QB&contentType=json',
    ];
    final response =
        await get(Uri.parse(uriString[Random().nextInt(uriString.length)]));
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
