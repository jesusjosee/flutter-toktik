import 'package:flutter/material.dart';

class AppTheme {

  // metodo que retorna un ThemeData
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark
  );
}