import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AppTheme = ThemeData(
  colorSchemeSeed: Colors.teal,
  brightness: Brightness.light, // Puedes cambiar a Brightness.dark para un tema oscuro
  primaryColor: Colors.teal,
  primaryColorLight: Colors.teal[300],
  primaryColorDark: Colors.teal[700],
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.white,
  dividerColor: Colors.grey,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.teal,
    textTheme: ButtonTextTheme.primary,
  ),
  iconTheme: const IconThemeData(
    color: Colors.teal,
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.teal,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.teal),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    labelStyle: TextStyle(color: Colors.teal),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: Colors.teal,
    inactiveTrackColor: Colors.teal.withOpacity(0.5),
    thumbColor: Colors.teal,
    overlayColor: Colors.teal.withOpacity(0.2),
  ),
);



final themeNotifier = StateProvider((ref) => AppTheme);