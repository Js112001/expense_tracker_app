import 'package:flutter/material.dart';

class RequiredFieldNote extends StatelessWidget {
  const RequiredFieldNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '*',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.red,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Marked fields are required',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
