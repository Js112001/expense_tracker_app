import 'package:expense_tracker_app/modules/expense_management/data/data_sources/local/expense_data_source.dart';
import 'package:expense_tracker_app/modules/expense_management/data/repository_impl/expense_repo_impl.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/repository/expense_repository.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/usecases/add_expense.dart';
import 'package:expense_tracker_app/modules/expense_management/presentation/controllers/expense_controller.dart';
import 'package:get/get.dart';

class ExpenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExpenseDataSource());
    Get.lazyPut(() => ExpenseRepoImpl(Get.find<ExpenseDataSource>()));
    Get.lazyPut(() => AddExpenseUseCase(Get.find<ExpenseRepository>()));
    Get.lazyPut(() => ExpenseController());
  }

}