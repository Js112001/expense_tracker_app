class ExpenseEntity {
  final int? id;
  final String name;
  final double amount;
  final String category;
  final DateTime date;
  final String? notes;

  ExpenseEntity({
    this.id,
    required this.name,
    required this.amount,
    required this.category,
    required this.date,
    this.notes,
  });

  @override
  String toString() {
    return 'Expense(id: $id, name: $name, amount: $amount, category: $category, date: $date, notes: $notes)';
  }
}
