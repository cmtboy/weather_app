import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayForcast extends StatelessWidget {
  const TodayForcast({super.key, required this.forcast});
  final List<dynamic> forcast;

  String formatTime(String timeString) {
    // Create a DateTime object from the string
    DateTime dateTime = DateTime.parse(timeString);

    // Create a DateFormat object for the desired format
    DateFormat format = DateFormat("hh:mm a");

    // Format the DateTime object using the DateFormat object
    String formattedTime = format.format(dateTime);

    // Return the formatted time
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        itemCount: forcast[0]['hour'].length ?? 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(children: [
              Text(forcast[0]['hour'][index]['temp_c'].toString()),
              Image.network(
                  'http:${forcast[0]['hour'][index]['condition']['icon']}'),
              Text(forcast[0]['hour'][index]['condition']['text']),
              Text(formatTime(forcast[0]['hour'][index]['time'])),
            ]),
          );
        },
      ),
    );
  }
}
