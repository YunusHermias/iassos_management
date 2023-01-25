import 'package:flutter/material.dart';
import 'package:iassos_management/screens/login/widgets/login_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Iassos Management",
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          height: 500.0,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                const LoginInput(iconData: Icons.person, labelText: "Username"),
                const LoginInput(iconData: Icons.lock, labelText: "Password"),
                const SizedBox(height: 35.0),
                SizedBox(
                  height: 35.00,
                  width: 300.0,
                  child: ElevatedButton(
                    onPressed: () {
                      print("object");
                    },
                    child: const Text("LOGIN"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
