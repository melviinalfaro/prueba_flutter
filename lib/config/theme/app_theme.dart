import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.indigo,
  Colors.blue,
  Colors.red,
  Colors.yellow,
  Colors.orange,
  Colors.teal,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  const AppTheme({
    this.selectedColor = 0,
    required this.isDarkMode,
  })  : assert(selectedColor >= 0, "Ingresa un valor mayor o igual a 0"),
        assert(selectedColor <= colorList.length,
            "Ingresa un valor menor o igual a ${colorList.length - 1}");

  ThemeData getTheme() => ThemeData(
        colorSchemeSeed: colorList[selectedColor],
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      );
}
