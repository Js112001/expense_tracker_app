import 'package:flutter/material.dart';

class AddExpenseButton extends StatelessWidget {
  const AddExpenseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 22,
          horizontal: 20,
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Theme.of(context).colorScheme.primary,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15,),
            child: Text(
              "Add Expense",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 20,
                fontFamily: 'NotoSans',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
