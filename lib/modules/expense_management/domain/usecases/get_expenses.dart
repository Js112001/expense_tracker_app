import 'package:expense_tracker_app/core/usecase/usecase.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/entities/expense_entity.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/repository/expense_repository.dart';

class GetExpensesUseCase extends UseCase<List<ExpenseEntity>, void> {

  final ExpenseRepository _expenseRepository;

  GetExpensesUseCase(this._expenseRepository);

  @override
  Future<List<ExpenseEntity>> call({void params}) async {
    return await _expenseRepository.getExpenses();
  }
  
}