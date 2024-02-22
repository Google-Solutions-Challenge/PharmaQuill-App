import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.white),
          backgroundColor: const Color.fromRGBO(3, 4, 94, 1),
          title: const Text(
            "Appointment",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromRGBO(3, 4, 94, 1),
        body: Column(
          children: [
            Row(
              children: [
                Text(
                  "Find Your Specialist",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        color: Colors.blue, letterSpacing: .5, fontSize: 30),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 70)),
                const Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.white,
                )
              ],
            ),
            const SearchBar(
              padding: MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
            )
          ],
        ));
  }
}
