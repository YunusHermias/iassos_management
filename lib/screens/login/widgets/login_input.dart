import 'package:flutter/material.dart';

class LoginInput extends StatelessWidget {
  const LoginInput(
      {super.key, required this.iconData, required this.labelText});

  final String labelText;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50.0,
        width: 300.0,
        child: TextFormField(
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: Icon(iconData),
          ),
        ),
      ),
    );
  }
}
