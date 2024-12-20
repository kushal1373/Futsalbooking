import 'package:flutter/material.dart';
import 'package:futsal_booking/core/app_theme/app_theme.dart';
import 'package:futsal_booking/screens/onboarding_screen.dart';

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({super.key, this.isDark = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: getApplicationTheme(),
      routes: {
        "/": (context) => const OnboardingScreen(),
      },
    );
  }
}
