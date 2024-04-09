import 'package:expense_tracker_app/core/routes/app_routes.dart';
import 'package:expense_tracker_app/modules/expense_management/presentation/bindings/home_binding.dart';
import 'package:expense_tracker_app/modules/expense_management/presentation/pages/home_page.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(name: AppRoutes.home, page: () => const HomePage(), binding: HomeBinding()),
  ];
}