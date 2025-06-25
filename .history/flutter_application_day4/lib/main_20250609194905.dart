import 'package:flutter/material.dart';
import 'package:flutter_application_day4/presentation/splash_screen.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(mainAxisAlignment: MainAxisAlignment.,
        children: [
          const ScreenSplash(),
        ],
      ),
    );
  }
}
