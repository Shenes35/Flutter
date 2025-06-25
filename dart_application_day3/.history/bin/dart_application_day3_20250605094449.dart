import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink, // Fixed: `Colours` → `Colors`, `background` → `backgroundColor`
          title: const Text('My App'), // Optional: a title so the app bar isn’t empty
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
