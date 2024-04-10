import 'package:expense_tracker_app/core/usecase/usecase.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/entities/expense_entity.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/repository/expense_repository.dart';

class AddExpenseUseCase extends UseCase<int, ExpenseEntity> {
  final ExpenseRepository _expenseRepository;

  AddExpenseUseCase(this._expenseRepository);

  @override
  Future<int> call({ExpenseEntity? params}) async {
    return await _expenseRepository.addExpense(params!);
  }
}
