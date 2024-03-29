import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to show date picker when "DOB" field is clicked
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color.fromRGBO(3, 4, 94, 1),
        title: const Text(
          "Profile",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, color: Colors.white),
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
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 0.5, 0.9],
                      colors: [
                        Color.fromRGBO(3, 4, 94, 1),
                        Color.fromRGBO(0, 180, 216, 1),
                        Color.fromRGBO(144, 224, 239, 1),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: _buildTextField(
                        "Username", Icons.person, _usernameController),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextFormField(
                        controller: _dobController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "DOB",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: Colors.blue,
                          ),
                          border: GradientOutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            width: 3,
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 11, 30, 110),
                              Color.fromARGB(255, 63, 88, 176),
                              Color.fromARGB(255, 95, 128, 236),
                            ]),
                          ),
                        ),
                        onTap: () {
                          // Show date picker when "DOB" field is tapped
                          _selectDate(context);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: _buildTextField(
                        "Gender", Icons.family_restroom, _genderController),
                  ),
                  Expanded(
                    child:
                        _buildTextField("Email", Icons.email, _emailController),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: FancyPasswordField(
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.password,
                            color: Colors.blue,
                          ),
                          border: GradientOutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            width: 3,
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 11, 30, 110),
                              Color.fromARGB(255, 63, 88, 176),
                              Color.fromARGB(255, 95, 128, 236),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 20), // Add some space between fields and button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(204, 49, 61, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),

                    onPressed: () => Navigator.pushNamed(context, '/home'),
                    // onPressed: () {

                    //   // Collect user input data
                    //   String username = _usernameController.text;
                    //   String dob = _dobController.text;
                    //   String gender = _genderController.text;
                    //   String email = _emailController.text;
                    //   String password = _passwordController.text;

                    //   sendDataToMongoDB(username, dob, gender, email, password);

                    //   // Navigate to SignUp state
                    //   Navigator.pushReplacementNamed(context, '/signup');
                    // },
                    child: const Text('Submit',
                        style: TextStyle(fontSize: 14, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build a customized TextField
  Widget _buildTextField(
      String hintText, IconData icon, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          prefixIcon: Icon(
            icon,
            color: Colors.blue,
          ),
          border: const GradientOutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            width: 3,
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 11, 30, 110),
              Color.fromARGB(255, 63, 88, 176),
              Color.fromARGB(255, 95, 128, 236),
            ]),
          ),
        ),
      ),
    );
  }

  // Function to handle data before storing in MongoDB
  void sendDataToMongoDB(String username, String dob, String gender,
      String email, String password) {
    print('Username: $username');
    print('DOB: $dob');
    print('Gender: $gender');
    print('Email: $email');
    print('Password: $password');
    print('------------------------');
  }
}
