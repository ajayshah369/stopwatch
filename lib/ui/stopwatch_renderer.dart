import 'dart:math';
import 'package:flutter/material.dart';

import './elapsed_time_text.dart';
import './clock_hand.dart';
import 'clock_markers.dart';

class StopwatchRenderer extends StatelessWidget {
  const StopwatchRenderer(
      {super.key, required this.elapsed, required this.radius});

  final Duration elapsed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int i = 0; i < 60; i++)
          Positioned(
            left: radius,
            top: radius,
            child: ClockSecondTickMarker(
              radius: radius,
              seconds: i,
            ),
          ),
        for (int i = 5; i <= 60; i += 5)
          Positioned(
            top: radius,
            left: radius,
            child: ClockTextMarker(
              value: i,
              maxValue: 60,
              radius: radius,
            ),
          ),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
              rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
              handleThickness: 2,
              handleLength: radius,
              color: Colors.orange),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(
            elapsed: elapsed,
          ),
        )
      ],
    );
  }
}
