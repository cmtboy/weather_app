import 'package:flutter/material.dart';
import 'package:weather_app/constant/colors.dart';
import 'package:weather_app/services/api.dart';
import 'package:weather_app/widgets/astro_section.dart';
import 'package:weather_app/widgets/current_weather.dart';
import 'package:weather_app/widgets/seven_day_forcast.dart';
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
  late Weather weather;
//
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    api.getWeather(widget.location!).then((value) {
      setState(() {
        weather = value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: isLoading
              ? Column(
                  children: const [Center(child: CircularProgressIndicator())],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CurrentWeather(
                        image: weather.weatherIcon,
                        weatherCondition: weather.weatherDescription,
                        cityName: weather.city,
                        temperature: weather.temperature.toStringAsFixed(1)),
                    AstroSection(
                        sunrise: weather.forcast[0]['astro']['sunrise'],
                        sunset: weather.forcast[0]['astro']['sunset']),
                    const Padding(
                      padding: EdgeInsets.only(left: 25.0, bottom: 20),
                      child: Text(
                        'Today',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TodayForcast(forcast: weather.forcast),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: SevenDayForcast(forcast: weather.forcast)),
                  ],
                ),
        ),
      ),
    );
  }
}
