import 'package:flutter/material.dart';

class Item {
  final IconData icon;
  final String text;
  final String routes;

  Item(this.icon, this.text, this.routes);
}

final List<Item> items = [
  Item(Icons.medical_services_outlined, "Appoitment", "/appointment"),
  Item(Icons.medication_rounded, "Buy Medicine", "/appointment"),
  Item(Icons.mail, "Placeholder", "/appointment"),
  Item(Icons.person_2_outlined, "Profile", "/appointment"),
  Item(Icons.notifications, "Notifications", "/appointment"),
  Item(Icons.settings_accessibility_outlined, "Settings", "/appointment"),
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
          style: TextStyle(
              fontSize: 30, color: Color.fromARGB(255, 253, 228, 228)),
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
                                Navigator.pushNamed(context, item.routes),
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
