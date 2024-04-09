import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class LatestEntries extends StatelessWidget {
  const LatestEntries({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest Entries',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'NotoSans',
                    ),
              ),
              TextButton(
                onPressed: () => Get.toNamed('/all-entries'),
                child: Text(
                  'View all',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 3,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(
                  Icons.ac_unit_outlined,
                  size: 35,
                  color: Colors.cyan,
                ),
                title: Text(
                  'Breakfast',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  '02 Dec 2020',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                trailing: Text(
                  '\$ 10',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 18,
                      ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
