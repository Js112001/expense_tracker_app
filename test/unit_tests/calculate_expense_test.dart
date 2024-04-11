import 'package:expense_tracker_app/modules/expense_management/domain/entities/expense_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var totalExpense = 0.0;
  var categoryExpenses = [];
  void calculateExpenses(
    List<String> categories,
    List<ExpenseEntity> expenses,
  ) {
    int index = 0;
    totalExpense = 0.0;
    categoryExpenses = [0.0, 0.0, 0.0, 0.0];
    final categoryPrices = [0.0, 0.0, 0.0, 0.0];
    // Calculate total expense
    for (var category in categories) {
      var categoryPrice = 0.0;
      for (ExpenseEntity expense in expenses) {
        if (index == 0 && categories.contains(expense.category)) {
          totalExpense += expense.amount;
        }
        if (expense.category == category) {
          categoryPrice += expense.amount;
        }
      }
      categoryPrices[index++] = categoryPrice;
    }

    categoryExpenses = categoryPrices;
  }

  test('calculateExpenses should calculate total expense and category expenses',
      () {
    DateTime now = DateTime.now();
    // Prepare test data
    final categories = ['Category 1', 'Category 2', 'Category 3', 'Category 4'];
    final expenses = [
      ExpenseEntity(
        category: 'Category 1',
        amount: 100.0,
        name: 'expense 1',
        date: now,
      ),
      ExpenseEntity(
        category: 'Category 1',
        amount: 200.0,
        name: 'expense 2',
        date: DateTime(
          now.year,
          now.month,
          now.day - 1,
        ),
      ),
      ExpenseEntity(
        category: 'Category 2',
        amount: 150.0,
        name: 'expense 3',
        date: DateTime(
          now.year,
          now.month,
          now.day - 1,
        ),
      ),
      ExpenseEntity(
          category: 'Category 3',
          amount: 50.0,
          name: 'expense 4',
          date: DateTime(
            now.year,
            now.month,
            now.day - 2,
          )),
      ExpenseEntity(
        category: 'Category 3',
        amount: 100.0,
        name: 'expense 5',
        date: DateTime(
          now.year,
          now.month,
          now.day - 2,
        ),
      ),
      ExpenseEntity(
          category: 'Category 4',
          amount: 75.0,
          name: 'expense 6',
          date: DateTime(
            now.year,
            now.month - 1,
          )),
    ];

    // Execute the function
    calculateExpenses(categories, expenses);

    // Assert total expense
    expect(totalExpense, 675.0);

    // Assert category expenses
    expect(categoryExpenses[0], 300.0); // Category 1
    expect(categoryExpenses[1], 150.0); // Category 2
    expect(categoryExpenses[2], 150.0); // Category 3
    expect(categoryExpenses[3], 75.0); // Category 4
  });
  test('calculateExpenses should handle edge cases', () {
    // Test with empty categories and expenses
    calculateExpenses([], []);
    expect(totalExpense, 0.0);
    expect(categoryExpenses, [0.0, 0.0, 0.0, 0.0]); // All categories should have 0 expense


    // Test with empty expenses
    calculateExpenses(['Category 1', 'Category 2', 'Category 3', 'Category 4'], []);
    expect(totalExpense, 0.0);
    expect(categoryExpenses, [0.0, 0.0, 0.0, 0.0]); // All categories should have 0 expense

    // Test with expenses but no categories
    calculateExpenses([], [
      ExpenseEntity(
        category: 'Category 1',
        amount: 100.0,
        name: 'expense 1',
        date: DateTime.now(),
      ),
      ExpenseEntity(
        category: 'Category 1',
        amount: 100.0,
        name: 'expense 1',
        date: DateTime.now(),
      ),
    ]);
    expect(totalExpense, 0.0);
    expect(categoryExpenses, [0.0, 0.0, 0.0, 0.0]); // All categories should have 0 expense

    // Test with expenses but no matching categories
    calculateExpenses(['Category 1', 'Category 2'], [
      ExpenseEntity(
        category: 'Category 3',
        amount: 100.0,
        name: 'expense 1',
        date: DateTime.now(),
      ),
      ExpenseEntity(
        category: 'Category 3',
        amount: 100.0,
        name: 'expense 1',
        date: DateTime.now(),
      ),
    ]);
    expect(totalExpense, 0.0);
    expect(categoryExpenses, [0.0, 0.0, 0.0, 0.0]); // All categories should have 0 expense
  });

}
