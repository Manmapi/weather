import 'package:flutter/material.dart';

class CitiBanner extends StatelessWidget {
  const CitiBanner(
      {Key? key,
      required this.citiName,
      required this.maxTemp,
      required this.minTemp,
      required this.temp})
      : super(key: key);
  final String citiName;
  final double maxTemp;
  final double minTemp;
  final double temp;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 42, 88, 150),
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(top: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              citiName,
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
            Text(
              '$maxTemp\u00B0/$minTemp\u00B0',
              style: const TextStyle(fontSize: 15, color: Colors.white),
            )
          ],
        ),
        Text(
          '${temp.toInt().toString()}\u00B0',
          style: const TextStyle(fontSize: 35, color: Colors.white),
        )
      ]),
    );
  }
}
