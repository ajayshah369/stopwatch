import 'package:flutter/material.dart';

class ClockHand extends StatelessWidget {
  const ClockHand(
      {super.key,
      required this.rotationZAngle,
      required this.handleThickness,
      required this.handleLength,
      required this.color});

  final double rotationZAngle;
  final double handleThickness;
  final double handleLength;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(-handleThickness / 2, 0.0, 0.0)
        ..rotateZ(rotationZAngle),
      alignment: Alignment.topCenter,
      child: Container(
        height: handleLength,
        width: handleThickness,
        color: color,
      ),
    );
  }
}
