import 'package:flutter/material.dart';
import 'package:flutter_api_intrgration/screens/surgery/landing_screen.dart';
import '../Controller/login_page_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  LoginPageController _loginController = LoginPageController();

  String tenantName =
      "Select Tenant"; // Initial placeholder for tenant selection

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  void _showTenantDialog() {
    String inputText = ""; // Temp variable to hold user input

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Tenant"),
          content: TextField(
            onChanged: (value) {
              inputText = value;
            },
            decoration: const InputDecoration(
              hintText: "Enter Tenant Name",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  tenantName = inputText; // Update the displayed tenant name
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Submit"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Welcome'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Login successfull.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Card(
            shadowColor: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Aligns to the start
                children: [
                  Center(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Display Tenant Name aligned to the start
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: _showTenantDialog,
                      child: Row(
                        children: [
                          const Text(
                            'Tenant : ',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            tenantName,
                            style: const TextStyle(
                              color:
                                  const Color.fromARGB(0xFF, 0x28, 0x60, 0xDF),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Email TextField
                  TextField(
                    controller: usernameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(0xFF, 0x28, 0x60, 0xDF)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.email,
                          color: Color.fromARGB(0xFF, 0x28, 0x60, 0xDF),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Password TextField
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(0xFF, 0x28, 0x60, 0xDF)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.lock,
                          color: const Color.fromARGB(0xFF, 0x28, 0x60, 0xDF),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        bool check = await _loginController.authenticateUser(
                            tenantName,
                            usernameController.text,
                            passwordController.text);
                        if (check) {
                          //redirect to the home screen
                          Navigator.pushNamed(context, '/home_screen');
                          print('Success');
                          _showAlertDialog();
                        } else {
                          print('fail');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(0xFF, 0x28, 0x60, 0xDF),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
