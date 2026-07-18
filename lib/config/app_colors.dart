import 'package:flutter/material.dart';

/// Accent color presets for the settings overlay.
class AccentPresets {
  static const List<AccentOption> options = [
    AccentOption('Deep Purple', Color(0xFF6C63FF)),
    AccentOption('Teal', Color(0xFF00BFA5)),
    AccentOption('Rose', Color(0xFFE91E63)),
    AccentOption('Amber', Color(0xFFFFB300)),
    AccentOption('Ocean', Color(0xFF0288D1)),
    AccentOption('Emerald', Color(0xFF2E7D32)),
    AccentOption('Coral', Color(0xFFFF6F61)),
    AccentOption('Slate', Color(0xFF546E7A)),
  ];
}

class AccentOption {
  final String name;
  final Color color;
  const AccentOption(this.name, this.color);
}
