import 'package:animation_app/entry_point.dart';
import 'package:animation_app/screen/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const OnboardingScreen(),
      // home: EntryPoint(),
    );
  }
}
