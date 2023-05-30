import 'package:flutter/material.dart';
import 'package:weather_app/services/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.location});
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weather?.city ?? ''),
            Text(weather?.country ?? ''),
            Text(weather?.temperature.toStringAsFixed(1) ?? ''),
            Text(weather?.humidity.toStringAsFixed(1) ?? ''),
            Text(weather?.windSpeed.toStringAsFixed(1) ?? ''),
            Text(weather?.weatherDescription ?? ''),
          ],
        ),
      ),
    );
  }
}
