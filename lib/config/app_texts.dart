import 'package:flutter/material.dart';

/// Theme-aware text styles. Methods take BuildContext so styles
/// automatically adapt to light/dark mode via the theme's text color.
class AppTexts {
  static TextStyle tabText(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.white;
    return TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: color,
      shadows: const [Shadow(color: Colors.black38, blurRadius: 5)],
    );
  }

  static TextStyle heading(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.white;
    return TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: color,
      shadows: const [Shadow(color: Colors.black38, blurRadius: 5)],
    );
  }

  static TextStyle bodyText(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.white;
    return TextStyle(
      fontSize: 16.0,
      color: color,
      shadows: const [Shadow(color: Colors.black38, blurRadius: 5)],
    );
  }

  static TextStyle bodyTextLarge(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.white;
    return TextStyle(
      fontSize: 18.0,
      color: color,
      shadows: const [Shadow(color: Colors.black38, blurRadius: 5)],
    );
  }
}
