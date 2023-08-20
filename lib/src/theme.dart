import 'package:flutter/material.dart';

class ProjectTheme {
  static const Color backgroundColor = Colors.black;
  static const Color primaryColor = Colors.blue;
  static const Color textColor = Colors.white;
}

ThemeData getTheme() => ThemeData(
      useMaterial3: false,
      fontFamily: 'Cinzel',
      textTheme: const TextTheme(),
      brightness: Brightness.dark,
    );
