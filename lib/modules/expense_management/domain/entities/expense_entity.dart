class ExpenseEntity {
  final String? id;
  final double amount;
  final String category;
  final DateTime date;
  final String? notes;

  ExpenseEntity({
    this.id,
    required this.amount,
    required this.category,
    required this.date,
    this.notes,
  });
}
