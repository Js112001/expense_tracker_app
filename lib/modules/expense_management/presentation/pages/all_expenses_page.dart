import 'package:expense_tracker_app/modules/expense_management/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllExpensesPage extends GetView<HomeController> {
  const AllExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Latest Entries',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                fontFamily: 'NotoSans',
              ),
        ),
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: ListView.builder(
                itemCount: 20,
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
            ),
          ],
        ),
      ),
    );
  }
}
