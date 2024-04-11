import 'package:expense_tracker_app/core/background_service/background_service.dart';
import 'package:expense_tracker_app/core/local_notification/local_notification.dart';
import 'package:expense_tracker_app/core/routes/app_pages.dart';
import 'package:expense_tracker_app/core/routes/app_routes.dart';
import 'package:expense_tracker_app/core/themes/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  await BackgroundService.initialize();
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
