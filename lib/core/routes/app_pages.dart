import 'package:expense_tracker_app/core/routes/app_routes.dart';
import 'package:expense_tracker_app/modules/expense_management/presentation/bindings/expense_binding.dart';
import 'package:expense_tracker_app/modules/expense_management/presentation/bindings/home_binding.dart';
import 'package:expense_tracker_app/modules/expense_management/presentation/pages/add_expense_page.dart';
import 'package:expense_tracker_app/modules/expense_management/presentation/pages/all_expenses_page.dart';
import 'package:expense_tracker_app/modules/expense_management/presentation/pages/home_page.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: ExpenseBinding(),
    ),
    GetPage(
      name: AppRoutes.allExpenses,
      page: () => const AllExpensesPage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.addExpense,
      page: () => const AddExpensePage(),
      binding: ExpenseBinding(),
    ),
  ];
}
