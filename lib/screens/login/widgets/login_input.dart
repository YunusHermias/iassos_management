import 'package:flutter/material.dart';

class LoginInput extends StatelessWidget {
  const LoginInput(
      {super.key,
      this.obscure = false,
      required this.iconData,
      required this.labelText,
      required this.textEditingController});

  final TextEditingController textEditingController;
  final String labelText;
  final IconData iconData;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50.0,
        width: 300.0,
        child: TextFormField(
          controller: textEditingController,
          obscureText: obscure,
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: Icon(iconData),
          ),
        ),
      ),
    );
  }
}
