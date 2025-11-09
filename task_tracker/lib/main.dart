import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task_tracker/presentation/splash_screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase first
  await Supabase.initialize(
    url: 'https://cjdfmqxccxnhgcisifei.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNqZGZtcXhjY3huaGdjaXNpZmVpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjI0NDk5NzQsImV4cCI6MjA3ODAyNTk3NH0.n_UnWOzPigzgxDXtu3ItAuCio8hJHH8DxNeEzx4xFQM',
  );

  // --- OneSignal Initialization (Following the official v5.x guide) ---
  // Enable verbose logging for debugging (remove in production)
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  // Initialize with your OneSignal App ID
  OneSignal.initialize("db0ee442-1b04-4fbb-a7e2-e15668674bac");
  // Use this method to prompt for push notifications.
  // We recommend removing this method after testing and instead use In-App Messages to prompt for notification permission.
  await OneSignal.Notifications.requestPermission(false);

  // --- Event Listeners (Following the official documentation) ---
  // Listen for notification clicked (if available)
  OneSignal.Notifications.addClickListener((result) {
    print('Notification opened: ${result.notification.title}');
    // Handle notification click (e.g., navigate to a specific screen)
    // Note: Navigating here requires access to the BuildContext or a global navigation key
  });

  // Listen for permission changes (if needed)
  // Use the correct parameter type as per documentation
  OneSignal.Notifications.addPermissionObserver((bool granted) {
  print('Push notification permission granted: $granted');
  if (granted) {
    // Call this only if user is logged in, otherwise wait until login
    if (Supabase.instance.client.auth.currentUser != null) {
      setupNotificationDevice();
    }
  }
});

  

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Task Tracker',
      debugShowCheckedModeBanner: false,
      // Replace Center(child: Text("Replace this with your app's home screen")) with your actual home screen
      home: SplashScreen(), // Or your actual initial screen
    );
  }
}

// Function to update device ID in your database (call this after user login/auth)
void setupNotificationDevice() async {
  try {
    await Future.delayed(const Duration(seconds: 2)); // Ensure OneSignal ready

    final subscriptionId = OneSignal.User.pushSubscription.id;

    final user = Supabase.instance.client.auth.currentUser;
    if (subscriptionId != null && user != null) {
      await Supabase.instance.client
          .from('profiles') // Your user profile table
          .update({'player_id': subscriptionId})
          .eq('id', user.id);

      print('✅ Successfully updated player_id: $subscriptionId for user: ${user.id}');
    } else {
      print('⚠️ Subscription ID ($subscriptionId) or current user (${user?.id}) is null');
    }
  } catch (e) {
    print('❌ Error in setupNotificationDevice: $e');
  }
}


// Optional: Function to identify the user with an External ID (call after login)
void identifyUser(String externalId) {
  OneSignal.login(externalId); // Use your backend user ID (e.g., Supabase user ID)
  print('User identified with external ID: $externalId');
}

// Optional: Function to log out the user (call on logout)
void logoutUser() async {
  final user = Supabase.instance.client.auth.currentUser;
  if (user != null) {
    await Supabase.instance.client
        .from('profiles')
        .update({'player_id': null})
        .eq('id', user.id);
  }
  OneSignal.logout();
  print('User logged out from OneSignal and player_id cleared.');
}
