import 'package:expense_tracker_app/modules/expense_management/domain/entities/expense_entity.dart';
import 'package:expense_tracker_app/modules/expense_management/presentation/controllers/expense_controller.dart';
import 'package:expense_tracker_app/utils/constants/app_constants.dart';
import 'package:expense_tracker_app/utils/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllExpensesPage extends GetView<ExpenseController> {
  const AllExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'All Expenses'),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              controller.allExpenses.isNotEmpty
                  ? SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      child: ListView.builder(
                        itemCount: controller.allExpenses.length,
                        itemBuilder: (context, index) {
                          index = controller.allExpenses.length - index - 1;
                          final expense =
                              controller.allExpenses[index] as ExpenseEntity;
                          return ListTile(
                            onLongPress: () => controller.showDeleteDialog(
                                expense, context),
                            leading: AppConstants.allCategories
                                .where((element) =>
                                    element['name'] == expense.category)
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
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
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
          ),
        ),
      ),
    );
  }
}
