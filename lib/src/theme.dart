import 'package:flutter/material.dart';

class ProjectTheme {
  static const Color backgroundColor = Colors.black;
  static const Color primaryColor = Colors.blue;
  static const Color textColor = Colors.white;

  static const Color eventColor = Color(0xFFE4935D);
  static const Color eventAccentColor = Color(0xFFBEABA1);
}

ThemeData getTheme() => ThemeData(
      useMaterial3: false,
      fontFamily: 'Cinzel',
      textTheme: const TextTheme(),
      brightness: Brightness.dark,
    );
