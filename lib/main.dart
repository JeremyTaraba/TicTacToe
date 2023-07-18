import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          textTheme: const TextTheme(
            // displayMedium: TextStyle(fontSize: 34),
            // displaySmall: TextStyle(fontSize: 34),
            bodyMedium:
                TextStyle(fontSize: 144, color: Colors.white, height: 0.8),
          )),
      home: const HomePage(),
    );
  }
}
