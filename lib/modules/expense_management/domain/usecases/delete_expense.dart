import 'package:expense_tracker_app/core/usecase/usecase.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/repository/expense_repository.dart';

class DeleteExpenseUseCase extends UseCase<int, int> {
  final ExpenseRepository _expenseRepository;

  DeleteExpenseUseCase(this._expenseRepository);

  @override
  Future<int> call({int? params}) async {
    return await _expenseRepository.deleteExpense(params!);
  }
}
