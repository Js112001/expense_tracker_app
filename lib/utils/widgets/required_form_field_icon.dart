import 'package:flutter/material.dart';

class RequiredFormFieldIcon extends StatelessWidget {
  const RequiredFormFieldIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Text(
        '*', // Asterisk symbol
        style: TextStyle(
          color: Colors.red, // Customize color as needed
          fontSize: 20,
        ),
      ),
    );
  }
}
