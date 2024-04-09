import 'package:expense_tracker_app/modules/expense_management/domain/entities/expense_entity.dart';

class ExpenseModel extends ExpenseEntity {
  ExpenseModel({
    String? id,
    required double amount,
    required String category,
    required DateTime date,
    String? notes,
  }) : super(
          id: id,
          amount: amount,
          category: category,
          date: date,
          notes: notes,
        );

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      id: json['id'] as String?,
      amount: json['amount'] as double,
      category: json['category'] as String,
      date: DateTime.parse(json['date'] as String),
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? '',
      'amount': amount,
      'category': category,
      'date': date.toIso8601String(),
      'notes': notes ?? '',
    };
  }
}
