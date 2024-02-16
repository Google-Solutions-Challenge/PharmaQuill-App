import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            flex: 1,
            child: Stack(alignment: Alignment.center, children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.1, 0.5, 0.9],
                    colors: [
                      Color(0xFFffe9bf),
                      Color(0xFFffd280),
                      Color(0xFFffb020),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(0.1, -0.7),
                child: const Text(
                  "Profile",
                ),
              )
            ])),
      ]),
    );
  }
}
