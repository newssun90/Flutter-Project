import 'package:flutter/material.dart';
import 'package:toonflix/main_simple.dart';
import 'package:toonflix/screens/home_screen.dart';

void main() {
  runApp(const MaterialApp(title: 'Pro', home: App(),));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xFFE7626C),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor:const Color(0xFFF4EDDB),
      ),
      home: Scaffold(
        body: const Center(
          child: MyWidget(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MySimpleWidget()));
          }, 
          child: const Icon(Icons.add_box_rounded),
        ),
        floatingActionButtonLocation:FloatingActionButtonLocation.endFloat,
      )
    );
  }
}
