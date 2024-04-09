import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController {
  final formKey = GlobalKey<FormState>();
  String? name;
  String? selectedCategory;
  double? amount;
  DateTime? date;
  String? notes;
  final dateController = TextEditingController();

  final List<String> categories = [
    'Food',
    'Transportation',
    'Utilities',
    'Entertainment',
    'Shopping',
    // Add more categories as needed
  ];

  @override
  void onInit() {
    super.onInit();
    date = DateTime.now();
    dateController.text = date.toString().substring(0,10);
  }
  void addExpense() {
    // Perform add expense operation here
    print('Category: $selectedCategory, Amount: $amount, Date: $date');
  }
}