import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:iassos_management/screens/home/home_page.dart';
import 'package:iassos_management/screens/login/login_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const IassosManagement());
}

class IassosManagement extends StatelessWidget {
  const IassosManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
