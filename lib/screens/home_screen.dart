import 'dart:async';

import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int totalSeconds = (25*60); // 25분
  late Timer timer;
  bool isTimer = false;

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

  void onTick(Timer timer) {
    setState(() {
      totalSeconds = totalSeconds-1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex:1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text('$totalSeconds', style: TextStyle(
                color: Theme.of(context).cardColor,
                fontSize: 80,
                fontWeight: FontWeight.w600,
              )),
            ),
          ),
          Flexible(
            flex:3,
            child: Center(
             child: IconButton(
              onPressed: isTimer ? onPausePressed : onStartPressed, 
              icon: isTimer ? const Icon(Icons.pause_circle_filled_outlined) : const Icon(Icons.play_circle_fill_outlined),
              iconSize: 120,
              color: Theme.of(context).cardColor,
             ),
            ),
          ),
          Flexible(
            flex:1,
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
                          color: Theme.of(context).textTheme.displayLarge!.color,
                        ),
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 58,
                          color: Theme.of(context).textTheme.displayLarge!.color,
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