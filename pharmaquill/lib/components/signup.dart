import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 63, 88, 176),
          title: const Center(
            child: Text(
              "Profile",
              style: TextStyle(fontSize: 35, color: Colors.white),
            ),
          ),
        ),
        body: Column(
          children: [
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
                          Color.fromARGB(255, 11, 30, 110),
                          Color.fromARGB(255, 63, 88, 176),
                          Color.fromARGB(255, 95, 128, 236),
                        ],
                      ),
                    ),
                  ),
                ])),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buildTextField("Username", Icons.person),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: _buildTextField("DOB", Icons.calendar_month),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: _buildTextField("Gender", Icons.family_restroom),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: _buildTextField("Email", Icons.email),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: _buildTextField("Password", Icons.password),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildTextField(String hintText, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon),
            border: const GradientOutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                width: 3,
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 11, 30, 110),
                  Color.fromARGB(255, 63, 88, 176),
                  Color.fromARGB(255, 95, 128, 236),
                ]))
            // filled: true,
            // fillColor: Colors.white.withOpacity(0.3),
            ),
      ),
    );
  }
}
