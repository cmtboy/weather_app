import 'package:flutter/material.dart';
import 'package:weather_app/constant/colors.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather(
      {super.key,
      required this.cityName,
      required this.temperature,
      required this.weatherCondition,
      required this.image});
  final String cityName;
  final String temperature;
  final String weatherCondition;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cityName,
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${temperature}°',
                    style: TextStyle(fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Chip(
                    backgroundColor: ThemeColor.shadowColor,
                    label: Text(weatherCondition),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                // borderRadius: BorderRadius.all(Radius.circular(8)),
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
                image != ''
                    ? 'http:$image'
                    : 'https://icons-for-free.com/iconfiles/png/512/cloud+day+forecast+lightning+shine+storm+sun+weather+icon-1320183295537909806.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ]),
    );
  }
}
