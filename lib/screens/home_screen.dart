import 'package:flutter/material.dart';
import 'package:weather_app/constant/colors.dart';
import 'package:weather_app/services/api.dart';
import 'package:weather_app/widgets/current_weather.dart';
import 'package:weather_app/widgets/today_forcast.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.location,
  });
  final String? location;

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Api api = Api(apiKey: '4eccdd27dfb8461c93f151206232305');
  Weather? weather;
//

  @override
  void initState() {
    super.initState();
    api.getWeather(widget.location!).then((value) {
      setState(() {
        weather = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(weather?.forcast ?? '---');
    return Scaffold(
      backgroundColor: ThemeColor.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CurrentWeather(
                  image: weather?.weatherIcon ?? '',
                  weatherCondition: weather?.weatherDescription ?? '_ _',
                  cityName: weather?.city ?? '_ _',
                  temperature:
                      weather?.temperature.toStringAsFixed(1) ?? '_ _'),

              TodayForcast(forcast: weather?.forcast ?? [])
              // Text(weather?.weatherIcon ?? '_ _'),
              // Text(weather?.city ?? '_ _'),
              // Text(weather?.country ?? '_ _'),
              // Text(weather?.temperature.toStringAsFixed(1) ?? '_ _'),
              // Text(weather?.humidity.toStringAsFixed(1) ?? '_ _'),
              // Text(weather?.windSpeed.toStringAsFixed(1) ?? '_ _'),
              // Text(weather?.weatherDescription ?? '_ _'),
            ],
          ),
        ),
      ),
    );
  }
}
