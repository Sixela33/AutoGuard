import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AppTheme = ThemeData(
  colorSchemeSeed: Colors.teal,
  
);

final themeNotifier = StateProvider((ref) => AppTheme);