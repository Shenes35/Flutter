import 'package:flutter/material.dart';
import 'package:contact_list/presentation/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      });
    });

    return Scaffold(
      body: Center(
        child: ClipOval(
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              'assets/loading.gif',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
