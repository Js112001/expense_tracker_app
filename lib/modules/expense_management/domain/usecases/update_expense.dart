import 'package:expense_tracker_app/core/usecase/usecase.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/entities/expense_entity.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/repository/expense_repository.dart';

class UpdateExpenseUseCase extends UseCase<int, ExpenseEntity> {
  final ExpenseRepository _expenseRepository;

  UpdateExpenseUseCase(this._expenseRepository);

  @override
  Future<int> call({ExpenseEntity? params}) async {
    return await _expenseRepository.updateExpense(params!);
  }
}
