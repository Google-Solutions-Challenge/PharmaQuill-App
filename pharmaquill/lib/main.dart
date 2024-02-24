import "package:flutter/material.dart";
import "package:pharmaquill/components/appointment.dart";
import "package:pharmaquill/components/home.dart";
import "package:pharmaquill/components/signup.dart";
import "package:pharmaquill/components/splash.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const SplashPage(),
      routes: {
        '/splash': (context) => const SplashPage(),
        '/home': (context) => const Home(),
        '/signup': (context) => const SignUp(),
        '/appointment': (context) => const Appointment(),
      },
    );
  }
}
