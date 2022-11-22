import 'dart:math';

import 'package:flutter/material.dart';

class ClockSecondTickMarker extends StatelessWidget {
  const ClockSecondTickMarker(
      {super.key, required this.radius, required this.seconds});

  final double radius;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    final Color color = seconds % 5 == 0 ? Colors.white : Colors.grey.shade700;
    const double width = 2;
    const double height = 12;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0)
        ..rotateZ(2 * pi * (seconds / 60))
        ..translate(0.0, radius - height / 2, 0.0),
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}

class ClockTextMarker extends StatelessWidget {
  const ClockTextMarker(
      {super.key,
      required this.value,
      required this.maxValue,
      required this.radius});

  final int value;
  final int maxValue;
  final double radius;

  @override
  Widget build(BuildContext context) {
    const double width = 40;
    const double height = 30;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0)
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        ..translate(0.0, radius - 35, 0.0)
        ..rotateZ(pi - 2 * pi * (value / maxValue)),
      child: SizedBox(
        width: width,
        height: height,
        child: Text(
          value.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
