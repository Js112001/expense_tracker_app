import 'package:expense_tracker_app/core/local_notification/local_notification.dart';
import 'package:expense_tracker_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExpenseButton extends StatelessWidget {
  const AddExpenseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .sizeOf(context)
          .width,
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
          onPressed: () {

            NotificationService().scheduleNotification();
            Get.toNamed(AppRoutes.addExpense);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Theme
                  .of(context)
                  .colorScheme
                  .primary,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15,),
            child: Text(
              "Add Expense",
              style: Theme
                  .of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(
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
