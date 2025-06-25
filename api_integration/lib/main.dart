import 'package:flutter/material.dart';
import 'package:api_integration/Presentation/api_home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ScreenApiHome());
  }
}
