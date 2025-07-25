import 'package:flutter/material.dart';

import '../theme/theme_styles.dart';
import 'shared_manager.dart';

enum ThemeType { dark, light, system }

class ThemeManager with ChangeNotifier {
  BuildContext context;
  ThemeManager(this.context) {
    _currentTheme =
        getTheme(SharedManager.instance.getIntValue(SharedKeys.theme));
  }

  ThemeType _currentTheme = ThemeType.dark;

  ThemeType get themeEnums => _currentTheme;
  ThemeData get currentTheme => _currentTheme == ThemeType.dark
      ? ThemeStyles.darkTheme(context)
      : ThemeStyles.lightTheme(context);

  Future<void> changeTheme(ThemeType theme) async {
    _currentTheme = theme;

    await _saveLocalValue(_currentTheme.index);
    notifyListeners();
  }

  Future<void> _saveLocalValue(int themeIndex) async {
    await SharedManager.instance.setIntValue(SharedKeys.theme, themeIndex);
  }

  ThemeType getTheme(int? themeIndex) {
    if (themeIndex != null) {
      return ThemeType.values[themeIndex];
    } else {
      return ThemeType.dark;
    }
  }
}
