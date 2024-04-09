import 'package:flutter/material.dart';

class ExpenseSummaryCard extends StatelessWidget {
  const ExpenseSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.deepOrange[400]!,
              Colors.orange,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Expenses',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '\$ 4,231',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: DropdownButton<String>(
                    value: 'Weekly',
                    onChanged: (String? newValue) {
                      //
                    },
                    items: <String>['Weekly', 'Monthly']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                            fontSize: 22,
                            fontFamily: 'NotoSans',
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
