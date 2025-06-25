import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  // ✅ ValueNotifier to hold the selected color
  final ValueNotifier<Color> colorNotifier = ValueNotifier<Color>(Colors.red);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 100, width: 500),

              // 🔴🟢🔵 Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      colorNotifier.value = Colors.red;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('RED'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      colorNotifier.value = Colors.green;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('GREEN'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      colorNotifier.value = Colors.blue;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('BLUE'),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              // 👇 Dynamic Color Text
              ValueListenableBuilder(
                valueListenable: colorNotifier,
                builder: (context, newColor, _) {
                  return Text(
                    'HELLO WORLD',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: newColor, // ✅ Use the current color here
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}