import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_tracker/presentation/splash_screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://cjdfmqxccxnhgcisifei.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNqZGZtcXhjY3huaGdjaXNpZmVpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjI0NDk5NzQsImV4cCI6MjA3ODAyNTk3NH0.n_UnWOzPigzgxDXtu3ItAuCio8hJHH8DxNeEzx4xFQM',
  );
//// Enable verbose logging for debugging (remove in production)
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  // Initialize with your OneSignal App ID
  OneSignal.initialize("db0ee442-1b04-4fbb-a7e2-e15668674bac");
  // Use this method to prompt for push notifications.
  // We recommend removing this method after testing and instead use In-App Messages to prompt for notification permission.
  OneSignal.Notifications.requestPermission(false);

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
