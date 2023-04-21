import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(0, 40, 145, 201);
List<Color> _colorsTheme = [
  _customColor,
  Colors.pink.shade300,
  Colors.green.shade300,
  Colors.cyan.shade300,
  Colors.teal.shade300
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorsTheme.length - 1,
            'Colors must be between 0 and ${_colorsTheme.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorsTheme[selectedColor],
        brightness: Brightness.light);
  }
}
