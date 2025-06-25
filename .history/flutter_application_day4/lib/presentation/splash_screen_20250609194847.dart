import 'package:flutter/material.dart';
import 'package:flutter_application_day4/presentation/home_screen.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    waitSplash();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CircularProgressIndicator());
  }
  waitSplash()async{
    await Future.delayed(Duration(seconds: 5));
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) =>ScreenHome()));
  }
}