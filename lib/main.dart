import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const FutsalBookingApp());
}

class FutsalBookingApp extends StatelessWidget {
  const FutsalBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Futsal Booking System',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const OnboardingScreen(), // Starting screen
    );
  }
}
