import 'package:expense_tracker_app/modules/expense_management/presentation/controllers/expense_controller.dart';
import 'package:get/get.dart';

class ExpenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExpenseController());
  }

}