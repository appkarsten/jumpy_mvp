import 'package:http/http.dart';
import 'dart:convert';

class Weather {
  static Future<int> currentWeather() async {
    // const uriString =
    //     'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/leipzig?unitGroup=metric&include=current&key=HEQ5H2LH62MFBESCKMQWMR2QB&contentType=json';
    const uriStringKalpitya =
        'https://api.open-meteo.com/v1/forecast?latitude=8.2287&longitude=79.7599&current=temperature_2m,weather_code&hourly=temperature_2m,weather_code';
    const uriStringIslaTrinidad =
        'https://api.open-meteo.com/v1/forecast?latitude=-53.9992&longitude=-38.1756&current=temperature_2m,weather_code&hourly=temperature_2m,weather_code';
    final response = await get(Uri.parse(uriStringIslaTrinidad));
    // final response = await get(Uri.parse(uriStringKalpitya));
    final weather = jsonDecode(response.body);

    // final List names = users.map((e) => e['name']).toList();
    // final List names
    int conditions = weather['current']['weather_code'];
    // print(conditions);
    return conditions;
  }
}
