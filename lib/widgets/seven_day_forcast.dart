import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SevenDayForcast extends StatelessWidget {
  const SevenDayForcast({super.key, required this.forcast});
  final List<dynamic> forcast;

  String getDayName(String date) {
    final DateFormat format = DateFormat('yyyy-MM-dd');
    final DateTime parsedDate = format.parse(date);
    final DateFormat dayNameFormat = DateFormat('EEEE');
    return dayNameFormat.format(parsedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: forcast.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Text(getDayName(forcast[index]['date'])),
              const Spacer(),
              SizedBox(
                height: 50,
                child: Image.network(
                  'http:${forcast[index]['day']['condition']['icon']}',
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Text('${forcast[index]['day']['maxtemp_c'].toStringAsFixed(0)}°',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${forcast[index]['day']['mintemp_c'].toStringAsFixed(0)}°',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}
