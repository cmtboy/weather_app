import 'package:flutter/material.dart';
import 'package:weather_app/constant/colors.dart';
import 'package:weather_app/screens/search_sereen.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({
    Key? key,
    required this.cityName,
    required this.temperature,
    required this.weatherCondition,
    required this.image,
  }) : super(key: key);

  final String cityName;
  final String temperature;
  final String weatherCondition;
  final String image;

  @override
  CurrentWeatherState createState() => CurrentWeatherState();
}

class CurrentWeatherState extends State<CurrentWeather> {
  bool showSearch = false;
  TextEditingController textController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.cityName,
                        style: const TextStyle(fontSize: 25),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            showSearch = true;
                          });
                        },
                        icon: const Icon(Icons.location_on),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${widget.temperature}°',
                    style: const TextStyle(fontSize: 40),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Chip(
                    backgroundColor: ThemeColor.shadowColor,
                    label: Text(widget.weatherCondition),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 106, 7, 104),
                    offset: Offset(0, 5),
                    blurRadius: 40,
                  ),
                ],
              ),
              width: 130,
              height: 130,
              child: Image.network(
                widget.image.isNotEmpty
                    ? 'http:${widget.image}'
                    : 'https://icons-for-free.com/iconfiles/png/512/cloud+day+forecast+lightning+shine+storm+sun+weather+icon-1320183295537909806.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
        if (showSearch)
          Positioned(
            top: 50,
            left: 40,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 106, 7, 104),
              ),
              height: 50,
              width: 100,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        fillColor: Colors.white24,
                        hintText: 'Search...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchPage(location: textController.text),
                        ),
                      );
                      setState(() {
                        showSearch = false;
                      });
                    },
                    icon: const Icon(Icons.send),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        showSearch = false;
                      });
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
