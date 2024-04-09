import 'package:expense_tracker_app/core/usecase/usecase.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/repository/expense_repository.dart';

class DeleteExpense extends UseCase<void, String> {
  final ExpenseRepository _expenseRepository;

  DeleteExpense(this._expenseRepository);

  @override
  Future<void> call({String? params}) async {
    await _expenseRepository.deleteExpense(params!);
  }
}
