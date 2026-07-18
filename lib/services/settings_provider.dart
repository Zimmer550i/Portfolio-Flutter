import 'package:flutter/material.dart';
import 'package:portfolio_flutter/config/app_colors.dart';

/// Manages app-wide settings: theme mode, accent color, background image.
/// State is in-memory only (resets on refresh).
class SettingsProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  Color _accentColor = AccentPresets.options[0].color;
  String _backgroundImage = 'assets/images/bg.jpg';

  ThemeMode get themeMode => _themeMode;
  Color get accentColor => _accentColor;
  String get backgroundImage => _backgroundImage;

  void setThemeMode(ThemeMode mode) {
    if (_themeMode != mode) {
      _themeMode = mode;
      notifyListeners();
    }
  }

  void setAccentColor(Color color) {
    if (_accentColor != color) {
      _accentColor = color;
      notifyListeners();
    }
  }

  void setBackgroundImage(String path) {
    if (_backgroundImage != path) {
      _backgroundImage = path;
      notifyListeners();
    }
  }
}

/// InheritedWidget to provide SettingsProvider down the tree.
class SettingsScope extends InheritedWidget {
  final SettingsProvider settings;

  const SettingsScope({
    super.key,
    required this.settings,
    required super.child,
  });

  static SettingsProvider of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SettingsScope>()!
        .settings;
  }

  @override
  bool updateShouldNotify(SettingsScope oldWidget) {
    return settings != oldWidget.settings;
  }
}
