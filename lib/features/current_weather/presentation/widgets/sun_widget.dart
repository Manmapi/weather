import 'dart:math';

import 'package:flutter/material.dart';

class SunWidget extends StatelessWidget {
  final int currentTime;
  final int sunsetTime;
  final int sunriseTime;
  const SunWidget(
      {Key? key,
      required this.currentTime,
      required this.sunriseTime,
      required this.sunsetTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secondNow = currentTime ~/ 1000;
    double percent = (secondNow - sunriseTime) / (sunsetTime - sunriseTime);
    if (percent > 1 || percent < 0) {
      percent = 1;
    }
    return CustomPaint(
      painter: CurvePaint(percent),
    );
  }
}

class CurvePaint extends CustomPainter {
  final double percent;
  CurvePaint(this.percent);
  @override
  void paint(Canvas canvas, Size size) {
    final List<Offset> fullPath = [
      Offset(0, size.height * 1),
      Offset(size.width * 0.5, 0),
      Offset(size.width, size.height * 1)
    ];
    final percentPath = [
      fullPath[0],
      Offset(fullPath[0].dx * (1 - percent) + percent * fullPath[1].dx,
          fullPath[0].dy * (1 - percent) + percent * fullPath[1].dy),
      Offset(
        fullPath[0].dx * pow(1 - percent, 2) +
            2 * (1 - percent) * percent * fullPath[1].dx +
            fullPath[2].dx * pow(percent, 2),
        fullPath[0].dy * pow(1 - percent, 2) +
            2 * (1 - percent) * percent * fullPath[1].dy +
            fullPath[2].dy * pow(percent, 2),
      )
    ];
    final paint = Paint()
      ..color = const Color.fromARGB(85, 92, 64, 62)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;
    final paint_2 = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;
    final circlePaint = Paint()
      ..color = Colors.amberAccent
      ..strokeWidth = 4
      ..style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(fullPath[0].dx, fullPath[0].dy);
    path.quadraticBezierTo(
        fullPath[1].dx, fullPath[1].dy, fullPath[2].dx, fullPath[2].dy);

    var path_2 = Path();

    path_2.moveTo(percentPath[0].dx, percentPath[0].dy);
    path_2.quadraticBezierTo(percentPath[1].dx, percentPath[1].dy,
        percentPath[2].dx, percentPath[2].dy);
    canvas.drawPath(path, paint);
    canvas.drawPath(path_2, paint_2);
    canvas.drawCircle(percentPath[2], 7, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
