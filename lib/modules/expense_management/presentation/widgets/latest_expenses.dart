import 'package:expense_tracker_app/core/routes/app_routes.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/entities/expense_entity.dart';
import 'package:expense_tracker_app/modules/expense_management/presentation/controllers/expense_controller.dart';
import 'package:expense_tracker_app/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LatestEntries extends GetView<ExpenseController> {
  const LatestEntries({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest Expenses',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'NotoSans',
                    ),
              ),
              TextButton(
                onPressed: () => Get.toNamed(AppRoutes.allExpenses),
                child: Text(
                  'View all',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
            ],
          ),
        ),
        controller.expenses.isNotEmpty
            ? SizedBox(
                height: MediaQuery.sizeOf(context).height / 4,
                child: ListView.builder(
                  itemCount: controller.expenses.length,
                  itemBuilder: (context, index) {
                    index = controller.expenses.length - index - 1;
                    final expense = controller.expenses[index] as ExpenseEntity;
                    return ListTile(
                      onLongPress: () =>
                          controller.showDeleteDialog(expense, context),
                      onTap: () => Get.toNamed(AppRoutes.updateExpense,
                          arguments: {'expense': expense}),
                      leading: AppConstants.allCategories
                          .where(
                              (element) => element['name'] == expense.category)
                          .toList()
                          .first['icon'] as Widget,
                      title: Text(
                        expense.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        expense.date.toString().substring(0, 10),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      trailing: Text(
                        '\$ ${expense.amount}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 18,
                            ),
                      ),
                    );
                  },
                ),
              )
            : Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'No Expenses Recorded Yet',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
      ],
    );
  }
}
