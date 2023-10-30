import 'package:flutter/material.dart';

class ApplicationTheme {


  static const Color primaryColor = Color(0xFF39A552);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 75,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )
      )
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    )
  );
}