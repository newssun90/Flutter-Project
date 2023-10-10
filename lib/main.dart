import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const fWhiteStyle = TextStyle(
        color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600);
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromARGB(23, 92, 92, 92),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hey, Selena',
                          style: fWhiteStyle,
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 18),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
