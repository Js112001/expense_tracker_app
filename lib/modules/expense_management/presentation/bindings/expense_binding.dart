import 'package:expense_tracker_app/modules/expense_management/data/data_sources/local/expense_data_source.dart';
import 'package:expense_tracker_app/modules/expense_management/data/repository_impl/expense_repo_impl.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/usecases/add_expense.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/usecases/delete_expense.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/usecases/get_expenses.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/usecases/update_expense.dart';
import 'package:expense_tracker_app/modules/expense_management/presentation/controllers/expense_controller.dart';
import 'package:get/get.dart';

class ExpenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExpenseDataSource());
    Get.lazyPut(() => ExpenseRepoImpl(Get.find<ExpenseDataSource>()));
    Get.lazyPut(() => GetExpensesUseCase(Get.find<ExpenseRepoImpl>()));
    Get.lazyPut(() => AddExpenseUseCase(Get.find<ExpenseRepoImpl>()));
    Get.lazyPut(() => UpdateExpenseUseCase(Get.find<ExpenseRepoImpl>()));
    Get.lazyPut(() => DeleteExpenseUseCase(Get.find<ExpenseRepoImpl>()));
    Get.lazyPut(() => ExpenseController(
          Get.find<GetExpensesUseCase>(),
          Get.find<AddExpenseUseCase>(),
          Get.find<UpdateExpenseUseCase>(),
          Get.find<DeleteExpenseUseCase>(),
        ));
  }
}
