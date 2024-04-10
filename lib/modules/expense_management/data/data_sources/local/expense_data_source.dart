import 'package:expense_tracker_app/core/database/database_helper.dart';
import 'package:expense_tracker_app/modules/expense_management/data/models/expense_model.dart';

class ExpenseDataSource {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<ExpenseModel>> getExpenses() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('expenses');
    return List.generate(maps.length, (i) {
      return ExpenseModel.fromJson(maps[i]);
    });
  }

  Future<int> addExpense(ExpenseModel expense) async {
    final db = await _databaseHelper.database;
    return await db.insert('expenses', expense.toJson());
  }

  Future<int> updateExpense(ExpenseModel expense) async {
    final db = await _databaseHelper.database;
    return await db.update(
      'expenses',
      expense.toJson(),
      where: 'id = ?',
      whereArgs: [expense.id],
    );
  }

  Future<int> deleteExpense(int expenseId) async {
    final db = await _databaseHelper.database;
    return await db.delete(
      'expenses',
      where: 'id = ?',
      whereArgs: [expenseId],
    );
  }
}
