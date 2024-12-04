import 'package:flutter/material.dart';
const Color _colorPersonal = Color(0xff5c11d4);
const List<Color> _coloresTemas = [
  _colorPersonal,
  Colors.black,
  Colors.white,
  Colors.redAccent,
  Colors.yellowAccent,
  Colors.greenAccent,
  Colors.orangeAccent,
  Colors.purpleAccent,
  Colors.brown,
  Colors.pinkAccent,
];

class AppTema {
  // Atributos
  final int selectorColor;

  // Constructor
  AppTema({this.selectorColor = 0})
      : assert(selectorColor >= 0 && selectorColor < _coloresTemas.length,
            'selectorColor debe estar entre 0 y ${_coloresTemas.length - 1}');

  // Método para obtener el tema
  ThemeData tema() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _coloresTemas[selectorColor],
      // brightness: Brightness.dark
    );
  }
}
