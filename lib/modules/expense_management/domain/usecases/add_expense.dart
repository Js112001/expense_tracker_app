import 'package:expense_tracker_app/core/usecase/usecase.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/entities/expense_entity.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/repository/expense_repository.dart';

class AddExpenseUseCase extends UseCase<void, ExpenseEntity> {
  final ExpenseRepository _expenseRepository;

  AddExpenseUseCase(this._expenseRepository);

  @override
  Future<void> call({ExpenseEntity? params}) async {
    await _expenseRepository.addExpense(params!);
  }
}
