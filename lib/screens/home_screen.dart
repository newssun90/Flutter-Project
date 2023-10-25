import 'dart:async';

import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  static const resetSeconds = (1 * 60);
  int totalSeconds = resetSeconds;
  late Timer timer;
  bool isTimer = false;
  int totalPromodoros = 0;

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isTimer = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isTimer = false;
    });
  }

  void onResetPressed() {
    setState(() {
      totalSeconds = resetSeconds;
      isTimer ? onPausePressed() : '';
    });
  }

  void onTick(Timer timer) {
    setState(() {
      if (totalSeconds == 0) {
        totalPromodoros++;
        totalSeconds = resetSeconds;
        onPausePressed();
      } else {
        totalSeconds = totalSeconds - 1;
      }
    });
  }

  String timeFormat(int sec) {
    var duration = Duration(seconds: sec);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(timeFormat(totalSeconds),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 80,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: isTimer ? onPausePressed : onStartPressed,
                    icon: isTimer
                        ? const Icon(Icons.pause_circle_filled_outlined)
                        : const Icon(Icons.play_circle_fill_outlined),
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                  ),
                  IconButton(
                    onPressed: onResetPressed,
                    icon: const Icon(Icons.restore_rounded),
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                        Text(
                          '$totalPromodoros',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 58,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
