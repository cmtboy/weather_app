import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  final String apiKey;

  Api({required this.apiKey});

  Future<Weather> getWeather(String city) async {
    final url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city&aqi=no');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return Weather.fromJson(body);
    } else {
      throw Exception('df');
    }
  }
}

class Weather {
  final String city;
  final String country;
  final double temperature;
  final int humidity;
  final double windSpeed;
  final String weatherDescription;
  final String weatherIcon;

  Weather.fromJson(Map<String, dynamic> json)
      : city = json['location']['name'],
        country = json['location']['country'],
        temperature = json['current']['temp_c'],
        humidity = json['current']['humidity'],
        windSpeed = json['current']['wind_kph'],
        weatherDescription = json['current']['condition']['text'],
        weatherIcon = json['current']['condition']['icon'];
}
