import 'package:flutter/material.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            'Categories',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'NotoSans',
                ),
          ),
        ),
        SizedBox(
          height: MediaQuery.orientationOf(context) == Orientation.portrait
              ? MediaQuery.sizeOf(context).height / 2.2
              : MediaQuery.sizeOf(context).height / 1.65,
          child: GridView.count(
            crossAxisCount:
                MediaQuery.orientationOf(context) == Orientation.portrait
                    ? 2
                    : 4,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) {
              return Center(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [
                            Colors.black26,
                            Colors.white10,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.ac_unit_rounded,
                              size: 50,
                            ),
                            Text(
                              'Item $index',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontSize: 20,
                                  ),
                            ),
                            Text(
                              '\$ 500',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontSize: 22,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
