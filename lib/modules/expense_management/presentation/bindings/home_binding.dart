import 'package:expense_tracker_app/modules/expense_management/data/data_sources/local/expense_data_source.dart';
import 'package:expense_tracker_app/modules/expense_management/data/repository_impl/expense_repo_impl.dart';
import 'package:expense_tracker_app/modules/expense_management/domain/usecases/get_expenses.dart';
import 'package:expense_tracker_app/modules/expense_management/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExpenseDataSource());
    Get.lazyPut(() => ExpenseRepoImpl(Get.find<ExpenseDataSource>()));
    Get.lazyPut(() => GetExpensesUseCase(Get.find<ExpenseRepoImpl>()));
    Get.lazyPut(() => HomeController());

  }
}
