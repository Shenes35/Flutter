import 'package:flutter/material.dart';
import 'package:tracker/presentation/tracker_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    waitSplash();
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ClipOval(child: SizedBox(width: 100,height: 100,child: Image.asset('assets/loading.gif',fit: BoxFit.cover,))),)
    );
  }
  waitSplash() async{
    await Future.delayed(Duration(seconds: 5));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainScreen()));
  }
}