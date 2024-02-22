import 'package:flutter/material.dart';

class Item {
  final IconData icon;
  final String text;

  Item(this.icon, this.text);
}

final List<Item> items = [
  Item(Icons.medical_services_outlined, "Appoitment"),
  Item(Icons.medication_rounded, "Buy Medicine"),
  Item(Icons.mail, "Placeholder"),
  Item(Icons.person_2_outlined, "Profile"),
  Item(Icons.notifications, "Notifications"),
  Item(Icons.settings_accessibility_outlined, "Settings"),
];

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
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 5)),
          const Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 20)),
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
          ),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemCount: 6,
                  itemBuilder: (BuildContext ctx, index) {
                    Item item = items[index];
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item.icon,
                            size: 40,
                            color: Colors.white,
                          ),
                          Text(
                            item.text,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          ElevatedButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/appointment'),
                            child: const Text("Lets Go!"),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
