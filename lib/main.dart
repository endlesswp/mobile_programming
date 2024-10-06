import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp()); 
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyAL328ylR9GkiQkbUMrkCcKp8Nke7ESnbM",
  authDomain: "mobileprogram-3b259.firebaseapp.com",
  projectId: "mobileprogram-3b259",
  storageBucket: "mobileprogram-3b259.appspot.com",
  messagingSenderId: "799480225992",
  appId: "1:799480225992:web:956a6e0dd98372753d45fd",
  measurementId: "G-SWFJ6KZ39Y"));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: const OnboardingScreen(), 
      routes: {
        '/home': (context) => const HomeScreen(), 
      },
      debugShowCheckedModeBanner: false,
    );
  }
}