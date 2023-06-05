import 'package:flutter/material.dart';

class AstroSection extends StatelessWidget {
  const AstroSection({super.key, required this.sunrise, required this.sunset});
  final String sunrise;
  final String sunset;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Row(children: [
          const Icon(
            Icons.sunny,
            color: Color.fromARGB(255, 221, 112, 11),
          ),
          const SizedBox(width: 5),
          Text(sunrise),
          const Spacer(),
          const Icon(
            Icons.sunny_snowing,
            color: Colors.red,
          ),
          const SizedBox(width: 5),
          Text(sunset),
        ]),
      ),
    );
  }
}
