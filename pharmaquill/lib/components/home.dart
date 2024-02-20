import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 4, 94, 1),
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color.fromRGBO(3, 4, 94, 1),
        title: const Text(
          "HOME",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: const Column(
        children: [
          Padding(padding: EdgeInsetsDirectional.only(top: 10)),
          Row(
            children: [
              Expanded(
                  child: Text(
                "Select service",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
              Icon(
                Icons.person,
                size: 40,
                color: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }
}
