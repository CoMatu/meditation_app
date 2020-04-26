import 'dart:math';

import 'package:flutter/material.dart';

class CircleProgress extends CustomPainter {
  double currentProgress;
  double currentInnerProgress;

  CircleProgress(this.currentProgress, this.currentInnerProgress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCircle = Paint()
      ..strokeWidth = 2
      ..color = Colors.white
      ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

    Paint completeArc = Paint()
      ..strokeWidth = 2
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 7;

//    canvas.drawCircle(center, radius, outerCircle);

    double angle = 2 * pi * (currentProgress / 100);
    double angleInner = 2 * pi * (currentInnerProgress / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angleInner, false, outerCircle);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}