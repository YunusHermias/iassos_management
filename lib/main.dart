import 'package:flutter/material.dart';
import 'package:iassos_management/screens/home/home_page.dart';

void main() {
  runApp(const IassosManagement());
}

class IassosManagement extends StatelessWidget {
  const IassosManagement({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
