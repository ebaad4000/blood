import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'UI/constants.dart';
import 'UI/splash_screen.dart';
import 'package:blood_donation_app/firebase_options.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Blood donation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: darkRed()),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}