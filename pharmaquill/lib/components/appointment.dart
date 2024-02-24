import 'package:flutter/material.dart';

void main() => runApp(const Appointment());

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 4, 94, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(3, 4, 94, 1),
        title: const Text(
          'Appointments',
          style: TextStyle(color: Colors.white),
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                  controller: controller,
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (_) {
                    controller.openView();
                  },
                  leading: const Icon(Icons.search),
                  trailing: const <Widget>[Icon(Icons.filter_alt_outlined)]);
            }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'Doctor $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            }),
          ),
          Row(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Top Doctors",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  child: const Text(
                    "See All",
                    style: TextStyle(color: Colors.lightGreen, fontSize: 20),
                  ),
                  onTap: () => print("Hello World"),
                ),
              )
            ],
          ),
          DoctorList()
        ],
      ),
    );
  }
}

class DoctorList extends StatelessWidget {
  final List<Map<String, String>> doctors = [
    {
      'name': 'Dr. Jane Doe',
      'specialty': 'Anonymous Pharmacy, Majhitar',
      'time': '10:30 AM - 3:00 PM',
      'fee': '800INR'
    },
    {
      'name': 'Dr. Jane Doe',
      'specialty': 'Anonymous Pharmacy, Majhitar',
      'time': '10:30 AM - 3:00 PM',
      'fee': '800INR'
    },
    {
      'name': 'Dr. Jane Doe',
      'specialty': 'Anonymous Pharmacy, Majhitar',
      'time': '10:30 AM - 5:00 PM',
      'fee': '600INR'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        var doctor = doctors[index];
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Card(
            child: ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              tileColor: Colors.blueAccent,
              leading: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                doctor['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctor['specialty']!),
                  Text(doctor['time']!),
                  Text('Fee: ${doctor['fee']}'),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/visit', arguments: doctor);
                },
                child: const Text('Appointment'),
              ),
            ),
          ),
        );
      },
    );
  }
}
