import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          fontFamily: 'NotoSans',
        ),
      ),
      // ignore: deprecated_member_use
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);


}
