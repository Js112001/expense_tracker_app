import 'package:expense_tracker_app/core/routes/app_routes.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/entities/expense_entity.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/usecases/add_expense.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/usecases/delete_expense.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/usecases/get_expenses.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/usecases/update_expense.dart';
import 'package:expense_tracker_app/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController {
  final GetExpensesUseCase getExpensesUseCase;
  final AddExpenseUseCase _addExpenseUseCase;
  final UpdateExpenseUseCase _updateExpenseUseCase;
  final DeleteExpenseUseCase _deleteExpenseUseCase;

  ExpenseController(
    this.getExpensesUseCase,
    this._addExpenseUseCase,
    this._updateExpenseUseCase,
    this._deleteExpenseUseCase,
  );

  final formKey = GlobalKey<FormState>();
  String? name;
  String? selectedCategory;
  double? amount;
  DateTime? date;
  String? notes;
  final dateController = TextEditingController();

  final List<String> categories =
      AppConstants.allCategories.map((item) => item['name'] as String).toList();

  final categoryExpenses = [0.0, 0.0, 0.0, 0.0].obs;

  final expenses = [].obs;
  final allExpenses = [].obs;
  final totalExpense = 0.0.obs;
  var orderBy = AppConstants.orderBy[0].obs;

  @override
  void onInit() {
    super.onInit();
    date = DateTime.now();
    dateController.text = date.toString().substring(0, 10);
    getExpenses();
  }

  void getExpenses() async {
    expenses.value = await getExpensesUseCase();
    allExpenses.value = expenses.value;
    if (orderBy.value == AppConstants.orderBy[0]) {
      // Weekly
      final weekStart =
          DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
      final weekEnd = weekStart.add(const Duration(days: 6));

      expenses.value = expenses.where((element) {
        final expense = element as ExpenseEntity;
        return expense.date.isAfter(weekStart) &&
            expense.date.isBefore(weekEnd);
      }).toList();
    } else {
      // Monthly
      final now = DateTime.now();
      final monthStart = DateTime(now.year, now.month, 1);
      final monthEnd = DateTime(now.year, now.month + 1, 0);
      expenses.value = expenses.where((element) {
        final expense = element as ExpenseEntity;
        return expense.date.isAfter(monthStart) &&
            expense.date.isBefore(monthEnd);
      }).toList();
    }
    calculateExpenses();
  }

  void calculateExpenses() {
    int index = 0;
    final categoryPrices = [0.0,0.0,0.0,0.0].obs;
    // Calculate total expense
    for (var category in categories) {
      var categoryPrice = 0.0;
      if (index == 0) {
        totalExpense.value = 0.0;
      }
      for (ExpenseEntity expense in expenses) {
        if (index == 0) {
          totalExpense.value += expense.amount;
        }
        if (expense.category == category) {
          categoryPrice += expense.amount;
        }
      }
      categoryPrices[index++] = categoryPrice;
    }

    categoryExpenses.value = categoryPrices;
  }

  void addExpense() async {
    final expense = ExpenseEntity(
      name: name ?? '',
      amount: amount ?? 0,
      category: selectedCategory ?? '',
      date: date ?? DateTime.now(),
      notes: notes,
    );

    final response = await _addExpenseUseCase(params: expense);

    if (response != 0) {
      Get.snackbar(
        'Add Expense',
        'Expense Added Successfully',
        backgroundColor: Colors.lightGreenAccent,
        snackPosition: SnackPosition.BOTTOM,
      );
      getExpenses();
      Get.offNamed(AppRoutes.home);
    } else {
      Get.snackbar(
        'Add Expense',
        'Expense Add Failed',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    debugPrint('Expense object: $expense');
  }
}
