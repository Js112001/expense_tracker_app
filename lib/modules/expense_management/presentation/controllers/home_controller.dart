import 'package:expense_tracker_app/modules/expense_management/domain/entities/expense_entity.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/usecases/get_expenses.dart';
import 'package:expense_tracker_app/utils/constants/app_constants.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final GetExpensesUseCase _getExpensesUseCase;

  HomeController(this._getExpensesUseCase);

  List<ExpenseEntity> expenses = [];
  final totalExpense = 0.0.obs;
  var orderBy = AppConstants.orderBy[0].obs;

  @override
  void onInit() async {
    super.onInit();
    expenses = await _getExpensesUseCase();
    for (var expense in expenses) {
      totalExpense.value += expense.amount;
    }
  }

  @override
  void onReady() async {
    super.onReady();
    expenses = await _getExpensesUseCase();
  }
}