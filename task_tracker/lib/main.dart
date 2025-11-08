import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_tracker/presentation/splash_screen.dart';
import 'dart:developer';
void main() async{
  await Supabase.initialize(
    url: 'https://cjdfmqxccxnhgcisifei.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNqZGZtcXhjY3huaGdjaXNpZmVpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjI0NDk5NzQsImV4cCI6MjA3ODAyNTk3NH0.n_UnWOzPigzgxDXtu3ItAuCio8hJHH8DxNeEzx4xFQM',
  );
// Waits for debugger to attach before continuing
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super .key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(child: SplashScreen()),
    );
  }
}
