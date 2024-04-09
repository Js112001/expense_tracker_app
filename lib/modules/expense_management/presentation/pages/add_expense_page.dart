import 'package:expense_tracker_app/modules/expense_management/presentation/controllers/expense_controller.dart';
import 'package:expense_tracker_app/modules/expense_management/presentation/widgets/required_field_note.dart';
import 'package:expense_tracker_app/utils/widgets/custom_appbar.dart';
import 'package:expense_tracker_app/utils/widgets/required_form_field_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExpensePage extends GetView<ExpenseController> {
  const AddExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Expense'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const RequiredFieldNote(),
              Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        suffixIcon: RequiredFormFieldIcon(),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name for expense';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        controller.name = value!;
                      },
                    ),
                    DropdownButtonFormField<String>(
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                      decoration: const InputDecoration(
                        labelText: 'Category',
                        suffixIcon: RequiredFormFieldIcon(),
                      ),
                      value: controller.selectedCategory,
                      onChanged: (value) {
                        controller.selectedCategory = value!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a category';
                        }
                        return null;
                      },
                      items: controller.categories
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                        suffixIcon: RequiredFormFieldIcon(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || double.tryParse(value) == null) {
                          return 'Please enter a valid amount';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        controller.amount = double.parse(value!);
                      },
                    ),
                    TextFormField(
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                      decoration: const InputDecoration(
                        labelText: 'Date',
                        suffixIcon: RequiredFormFieldIcon(),
                      ),
                      readOnly: true,
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: controller.date ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          controller.date = pickedDate;
                          controller.dateController.text =
                              controller.date.toString().substring(0, 10);
                        }
                      },
                      validator: (value) {
                        if (controller.date == null) {
                          return 'Please select a date';
                        }
                        return null;
                      },
                      controller: controller.dateController,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Notes'),
                      maxLines: 3,
                      onSaved: (value) {
                        controller.notes = value!;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.formKey.currentState!.save();
                          controller.addExpense();
                        }
                      },
                      child: const Text('Add Expense'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
