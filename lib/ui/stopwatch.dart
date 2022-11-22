import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import './stopwatch_renderer.dart';
import './reset_button.dart';
import './start_stop_button.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  StopwatchState createState() => StopwatchState();
}

class StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  Duration _previousElapsed = Duration.zero;
  Duration _currentlyElapsed = Duration.zero;
  Duration get _elapsedTime => _previousElapsed + _currentlyElapsed;
  bool isRunning = false;
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      setState(() {
        _currentlyElapsed = elapsed;
      });
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void toggleRunning() {
    setState(() {
      isRunning = !isRunning;
      if (isRunning) {
        _ticker.start();
      } else {
        _previousElapsed += _currentlyElapsed;
        _currentlyElapsed = Duration.zero;
        _ticker.stop();
      }
    });
  }

  void reset() {
    _ticker.stop();
    setState(() {
      isRunning = false;
      _previousElapsed = Duration.zero;
      _currentlyElapsed = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double radius = constraints.maxWidth / 2;
      return Stack(
        children: [
          StopwatchRenderer(elapsed: _elapsedTime, radius: radius),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: 80,
              height: 80,
              child: ResetButton(
                onPressed: reset,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 80,
              height: 80,
              child: StartStopButton(
                isRunning: isRunning,
                onPressed: toggleRunning,
              ),
            ),
          )
        ],
      );
    });
  }
}
