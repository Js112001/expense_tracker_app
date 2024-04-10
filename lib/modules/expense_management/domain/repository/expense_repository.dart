import 'package:expense_tracker_app/modules/expense_management/domain/entities/expense_entity.dart';

abstract class ExpenseRepository {
  Future<List<ExpenseEntity>> getExpenses();
  Future<int> addExpense(ExpenseEntity expense);
  Future<int> updateExpense(ExpenseEntity expense);
  Future<int> deleteExpense(int expenseId);
}
