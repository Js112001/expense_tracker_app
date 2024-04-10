import 'package:expense_tracker_app/modules/expense_management/data/data_sources/local/expense_data_source.dart';
import 'package:expense_tracker_app/modules/expense_management/data/models/expense_model.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/entities/expense_entity.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/repository/expense_repository.dart';
import 'package:flutter/cupertino.dart';

class ExpenseRepoImpl extends ExpenseRepository {
  final ExpenseDataSource _expenseDataSource;

  ExpenseRepoImpl(this._expenseDataSource);

  @override
  Future<int> addExpense(ExpenseEntity expense) async {
    final expenseModel = ExpenseModel(
      name: expense.name,
      amount: expense.amount,
      category: expense.category,
      date: expense.date,
      notes: expense.notes,
    );
    try {
      return await _expenseDataSource.addExpense(expenseModel);
    } catch (e) {
      debugPrint('Error:: $e');
      return 0;
    }
  }

  @override
  Future<int> deleteExpense(String expenseId) async {
    return await _expenseDataSource.deleteExpense(expenseId);
  }

  @override
  Future<List<ExpenseEntity>> getExpenses() async {
    final List<ExpenseEntity> expenses = await _expenseDataSource.getExpenses();
    return expenses;
  }

  @override
  Future<int> updateExpense(ExpenseEntity expense) async {
    final expenseModel = ExpenseModel(
      id: expense.id,
      name: expense.name,
      amount: expense.amount,
      category: expense.category,
      date: expense.date,
      notes: expense.notes,
    );
    try {
      return await _expenseDataSource.updateExpense(expenseModel);
    } catch (e) {
      debugPrint('Error: $e');
      return 0;
    }
  }
}
