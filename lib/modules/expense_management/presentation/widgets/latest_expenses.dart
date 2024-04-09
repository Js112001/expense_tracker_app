import 'package:expense_tracker_app/core/routes/app_routes.dart';
import 'package:expense_tracker_app/modules/expense_management/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LatestEntries extends GetView<HomeController> {
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
                height: MediaQuery.sizeOf(context).height / 3,
                child: ListView.builder(
                  itemCount: controller.expenses.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(
                        Icons.ac_unit_outlined,
                        size: 35,
                        color: Colors.cyan,
                      ),
                      title: Text(
                        'Breakfast',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        '02 Dec 2020',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      trailing: Text(
                        '\$ 10',
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
