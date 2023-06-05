import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayForcast extends StatelessWidget {
  const TodayForcast({super.key, required this.forcast});
  final List<dynamic> forcast;

  String formatTime(String timeString) {
    // Create a DateTime object from the string
    DateTime dateTime = DateTime.parse(timeString);

    // Create a DateFormat object for the desired format
    DateFormat format = DateFormat("hh a");

    // Format the DateTime object using the DateFormat object
    String formattedTime = format.format(dateTime);

    // Return the formatted time
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: forcast[0]['hour'].length ?? 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(children: [
                Text(
                  formatTime(forcast[0]['hour'][index]['time']),
                  style: const TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 40,
                  child: Image.network(
                    'http:${forcast[0]['hour'][index]['condition']['icon']}',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Text(
                  '${forcast[0]['hour'][index]['temp_c'].toString()}°',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
