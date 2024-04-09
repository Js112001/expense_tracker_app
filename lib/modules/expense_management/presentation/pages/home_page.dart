import 'package:expense_tracker_app/modules/expense_management/presentation/controllers/home_controller.dart';
import 'package:expense_tracker_app/modules/expense_management/presentation/widgets/add_expense_bottom_btn.dart';
import 'package:expense_tracker_app/modules/expense_management/presentation/widgets/categories_grid.dart';
import 'package:expense_tracker_app/modules/expense_management/presentation/widgets/expense_summary_card.dart';
import 'package:expense_tracker_app/modules/expense_management/presentation/widgets/latest_entries.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(radius: 25),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Hello Jabbar!',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_active_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const ExpenseSummaryCard(),
                const CategoriesGrid(),
                const LatestEntries(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const AddExpenseButton(),
    );
  }
}
