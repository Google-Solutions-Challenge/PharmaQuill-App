import "package:flutter/material.dart";
import "package:pharmaquill/components/signup.dart";
import "package:pharmaquill/components/splash.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashPage(),
      routes: {
        '/signup': (context) => const SignUp(),
      },
    );
  }
}
