import 'package:flutter/material.dart';

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
                ],
              ),
            ),
          ),
          TimeBuilder(
            time: time_doctor,
          ),
        ],
      ),
    );
  }
}

class TimeBuilder extends StatelessWidget {
  final String time;

  const TimeBuilder({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    final List<int> startTimeStr =
        time.split(":").map((String part) => int.parse(part)).toList();
    int startTime = startTimeStr[0] * 60 + startTimeStr[1];

    List<int> endTimeStr = time
        .split("-")[1]
        .split(":")
        .map((String part) => int.parse(part))
        .toList();
    int endTime = endTimeStr[0] * 60 + endTimeStr[1];

    int interval = 20;
    List<int> timeList = [];
    for (int time = startTime; time <= endTime; time += interval) {
      timeList.add(time);
    }

    return ListView.builder(
      itemCount: timeList.length,
      itemBuilder: (context, index) {
        final timespl = timeList[index];

        return ListTile(
          title: Text(timespl.toString()),
        );
      },
    );
  }
}
