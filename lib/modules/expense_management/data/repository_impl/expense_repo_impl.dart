import 'package:expense_tracker_app/modules/expense_management/data/data_sources/local/expense_data_source.dart';
import 'package:expense_tracker_app/modules/expense_management/data/models/expense_model.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/entities/expense_entity.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/repository/expense_repository.dart';

class ExpenseRepoImpl extends ExpenseRepository {
  final ExpenseDataSource _expenseDataSource;

  ExpenseRepoImpl(this._expenseDataSource);

  @override
  Future<void> addExpense(ExpenseEntity expense) async {
    await _expenseDataSource.addExpense(expense as ExpenseModel);
  }

  @override
  Future<void> deleteExpense(String expenseId) async {
    await _expenseDataSource.deleteExpense(expenseId);
  }

  @override
  Future<List<ExpenseEntity>> getExpenses() async {
    final List<ExpenseEntity> expenses = await _expenseDataSource.getExpenses();
    return expenses;
  }

  @override
  Future<void> updateExpense(ExpenseEntity expense) async {
    await _expenseDataSource.updateExpense(expense as ExpenseModel);
  }
  
}