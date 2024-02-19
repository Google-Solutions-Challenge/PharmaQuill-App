import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Controllers to capture user input
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: _buildTextField(
                        "DOB", Icons.calendar_month, _dobController),
                  ),
                  Expanded(
                    child: _buildTextField(
                        "Gender", Icons.family_restroom, _genderController),
                  ),
                  Expanded(
                    child:
                        _buildTextField("Email", Icons.email, _emailController),
                  ),
                  Expanded(
                    child: _buildTextField(
                        "Password", Icons.password, _passwordController),
                  ),
                  SizedBox(
                      height: 20), // Add some space between fields and button
                  ElevatedButton(
                    onPressed: () {
                      // Collect user input data
                      String username = _usernameController.text;
                      String dob = _dobController.text;
                      String gender = _genderController.text;
                      String email = _emailController.text;
                      String password = _passwordController.text;

                      // Print user inputs to the console
                      print('\x1B[33mUsername: \x1B[0m$username');
                      print('\x1B[33mDOB: \x1B[0m$dob');
                      print('\x1B[33mGender: \x1B[0m$gender');
                      print('\x1B[33mEmail: \x1B[0m$email');
                      print('\x1B[33mPassword: \x1B[0m$password');
                      print('\x1B[32mSending data to MongoDB...\x1B[0m');
                      print('------------------------');
                      // Pass the data to another function
                      sendDataToMongoDB(username, dob, gender, email, password);

                      // Navigate to SignUp state
                      Navigator.pushReplacementNamed(context, '/signup');
                    },
                    child: Text('Submit'),
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
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
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
    // Here you can perform any operation with the collected data before storing it in MongoDB
    // For demonstration, let's just print the data in a readable format
    print('Username: $username');
    print('DOB: $dob');
    print('Gender: $gender');
    print('Email: $email');
    print('Password: $password');
    print('------------------------');
  }
}
