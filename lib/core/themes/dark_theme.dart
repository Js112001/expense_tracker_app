import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.dark(
    // Define primary color
    primary: Colors.pink[400]!,

    // Define surface color
    surface: Colors.grey[850]!,

    // Define background color
    background: Colors.black45,
  ),
  hintColor: Colors.blueAccent,

  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontFamily: 'NotoSans',
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'NotoSans'),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blueAccent,
    textTheme: ButtonTextTheme.primary,
  ),
);