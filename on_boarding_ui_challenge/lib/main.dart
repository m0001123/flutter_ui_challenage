import 'package:flutter/material.dart';
import 'package:on_boarding_ui_challenage/views/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'onBoarding challenage',
      home: OnboardingPage(),
    );
  }
}
