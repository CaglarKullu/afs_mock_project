import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeController extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;

  void toggle() {
    _mode = _mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  void set(ThemeMode mode) {
    _mode = mode;
    notifyListeners();
  }
}

final themeControllerProvider = ChangeNotifierProvider<ThemeController>((ref) {
  return ThemeController();
});
