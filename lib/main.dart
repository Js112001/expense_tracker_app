import 'package:expense_tracker_app/core/routes/app_pages.dart';
import 'package:expense_tracker_app/core/routes/app_routes.dart';
import 'package:expense_tracker_app/core/themes/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Expense Tracker',
      theme: darkTheme,
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
    );
  }
}
