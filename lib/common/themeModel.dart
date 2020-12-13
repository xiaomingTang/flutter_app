import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/common/global.dart';

// 显示模式(主题)
enum ThemeValues {
  // 浅色
  light,
  // 深色
  dark,
  // 跟随系统
  system,
}

class ThemeModel extends ChangeNotifier {
  static ThemeValues getThemeFromString(String modeString) {
    switch (modeString) {
      case "light":
        return ThemeValues.light;
      case "dark":
        return ThemeValues.dark;
      default:
        return ThemeValues.system;
    }
  }

  static String getStringFromTheme(ThemeValues themeValue) {
    switch (themeValue) {
      case ThemeValues.light:
        return "light";
      case ThemeValues.dark:
        return "dark";
      default:
        return "system";
    }
  }

  ThemeValues _mode = ThemeModel.getThemeFromString(Global.appConfigs.darkMode);

  ThemeValues get mode => _mode ?? ThemeValues.system;

  set mode(ThemeValues newMode) {
    if (_mode != newMode) {
      _mode = newMode;
      Global.appConfigs.darkMode = ThemeModel.getStringFromTheme(newMode);
      Global.saveAppConfigs();
      notifyListeners();
    }
  }

  void updateTheme() {
    notifyListeners();
  }

  bool get isDarkMode {
    return mode == ThemeValues.dark ||
        (mode == ThemeValues.system &&
            SchedulerBinding.instance.window.platformBrightness ==
                Brightness.dark);
  }
}
