import 'package:contact_list/model/contact_model.dart';
import 'package:contact_list/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ContactsModelAdapter().typeId)){
    Hive.registerAdapter(ContactsModelAdapter());
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Center(child: const SplashScreen()),
    );
  }
}
