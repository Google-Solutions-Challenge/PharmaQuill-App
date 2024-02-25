import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Visit extends StatelessWidget {
  const Visit({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> doctor_data =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final String time_doctor = doctor_data['time'] as String;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(3, 4, 94, 1),
        title: const Text(
          'Book Your Appointment',
          style: TextStyle(color: Colors.white),
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80)),
                    color: Color.fromRGBO(3, 4, 94, 1),
                  )),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/images/Sample_Doctor.png',
                      height: 200,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Name: ${doctor_data['name']}',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              )),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'About Doctor',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in at',
                      style: TextStyle(
                        color: Colors.white,
                        wordSpacing: 4,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Available Schedule',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TimeBuilder(
                      time: time_doctor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeBuilder extends StatelessWidget {
  final String time;
  TimeBuilder({super.key, required this.time});

  final List<String> time_interval = [
    "10:30",
    "10:45",
    "11:00",
    "11:15",
    "12:00"
  ];

  @override
  Widget build(BuildContext context) {
    final TextEditingController _PaymentControl = TextEditingController();
    return ListView.builder(
      itemCount: time_interval.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text(
                    time_interval[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  child: const Text("Book!"),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Booking Confirmation'),
                      content: SizedBox(
                        height: 100,
                        child: Column(
                          children: [
                            const Text(
                                "Pay at https://payments.com/payment and input reference number"),
                            TextFormField(
                              controller: _PaymentControl,
                              decoration: const InputDecoration(
                                hintText: "Enter Here: ",
                              ),
                            )
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Done'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
