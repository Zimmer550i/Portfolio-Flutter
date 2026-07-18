import 'package:flutter/material.dart';

/// Custom ThemeExtension providing semantic color tokens for the portfolio.
class PortfolioTheme extends ThemeExtension<PortfolioTheme> {
  final Color windowTint;
  final Color tabBackground;
  final Color tabSelectedBackground;
  final Color tabText;
  final Color tabSelectedText;
  final Color dividerColor;
  final Color cardBorder;
  final Color accentColor;
  final Color headingColor;
  final Color bodyTextColor;
  final Color buttonBackground;
  final Color buttonHoverBackground;
  final Color buttonText;
  final Color buttonHoverText;
  final Color chipBackground;
  final Color chipText;
  final Color iconColor;
  final Color dotIndicatorActive;
  final Color dotIndicatorInactive;

  const PortfolioTheme({
    required this.windowTint,
    required this.tabBackground,
    required this.tabSelectedBackground,
    required this.tabText,
    required this.tabSelectedText,
    required this.dividerColor,
    required this.cardBorder,
    required this.accentColor,
    required this.headingColor,
    required this.bodyTextColor,
    required this.buttonBackground,
    required this.buttonHoverBackground,
    required this.buttonText,
    required this.buttonHoverText,
    required this.chipBackground,
    required this.chipText,
    required this.iconColor,
    required this.dotIndicatorActive,
    required this.dotIndicatorInactive,
  });

  @override
  PortfolioTheme copyWith({
    Color? windowTint,
    Color? tabBackground,
    Color? tabSelectedBackground,
    Color? tabText,
    Color? tabSelectedText,
    Color? dividerColor,
    Color? cardBorder,
    Color? accentColor,
    Color? headingColor,
    Color? bodyTextColor,
    Color? buttonBackground,
    Color? buttonHoverBackground,
    Color? buttonText,
    Color? buttonHoverText,
    Color? chipBackground,
    Color? chipText,
    Color? iconColor,
    Color? dotIndicatorActive,
    Color? dotIndicatorInactive,
  }) {
    return PortfolioTheme(
      windowTint: windowTint ?? this.windowTint,
      tabBackground: tabBackground ?? this.tabBackground,
      tabSelectedBackground:
          tabSelectedBackground ?? this.tabSelectedBackground,
      tabText: tabText ?? this.tabText,
      tabSelectedText: tabSelectedText ?? this.tabSelectedText,
      dividerColor: dividerColor ?? this.dividerColor,
      cardBorder: cardBorder ?? this.cardBorder,
      accentColor: accentColor ?? this.accentColor,
      headingColor: headingColor ?? this.headingColor,
      bodyTextColor: bodyTextColor ?? this.bodyTextColor,
      buttonBackground: buttonBackground ?? this.buttonBackground,
      buttonHoverBackground:
          buttonHoverBackground ?? this.buttonHoverBackground,
      buttonText: buttonText ?? this.buttonText,
      buttonHoverText: buttonHoverText ?? this.buttonHoverText,
      chipBackground: chipBackground ?? this.chipBackground,
      chipText: chipText ?? this.chipText,
      iconColor: iconColor ?? this.iconColor,
      dotIndicatorActive: dotIndicatorActive ?? this.dotIndicatorActive,
      dotIndicatorInactive: dotIndicatorInactive ?? this.dotIndicatorInactive,
    );
  }

  @override
  PortfolioTheme lerp(ThemeExtension<PortfolioTheme>? other, double t) {
    if (other is! PortfolioTheme) return this;
    return PortfolioTheme(
      windowTint: Color.lerp(windowTint, other.windowTint, t)!,
      tabBackground: Color.lerp(tabBackground, other.tabBackground, t)!,
      tabSelectedBackground:
          Color.lerp(tabSelectedBackground, other.tabSelectedBackground, t)!,
      tabText: Color.lerp(tabText, other.tabText, t)!,
      tabSelectedText: Color.lerp(tabSelectedText, other.tabSelectedText, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      cardBorder: Color.lerp(cardBorder, other.cardBorder, t)!,
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
      headingColor: Color.lerp(headingColor, other.headingColor, t)!,
      bodyTextColor: Color.lerp(bodyTextColor, other.bodyTextColor, t)!,
      buttonBackground:
          Color.lerp(buttonBackground, other.buttonBackground, t)!,
      buttonHoverBackground:
          Color.lerp(buttonHoverBackground, other.buttonHoverBackground, t)!,
      buttonText: Color.lerp(buttonText, other.buttonText, t)!,
      buttonHoverText: Color.lerp(buttonHoverText, other.buttonHoverText, t)!,
      chipBackground: Color.lerp(chipBackground, other.chipBackground, t)!,
      chipText: Color.lerp(chipText, other.chipText, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      dotIndicatorActive:
          Color.lerp(dotIndicatorActive, other.dotIndicatorActive, t)!,
      dotIndicatorInactive:
          Color.lerp(dotIndicatorInactive, other.dotIndicatorInactive, t)!,
    );
  }
}

/// Build a light ThemeData with the given accent color.
ThemeData buildLightTheme(Color accent) {
  return ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: accent,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFD9D9D9),
    extensions: [
      PortfolioTheme(
        windowTint: Colors.white.withValues(alpha: 0.05),
        tabBackground: const Color(0xFFD9D9D9),
        tabSelectedBackground: Colors.black,
        tabText: Colors.black,
        tabSelectedText: const Color(0xFFD9D9D9),
        dividerColor: Colors.black,
        cardBorder: Colors.black,
        accentColor: accent,
        headingColor: Colors.white,
        bodyTextColor: Colors.white,
        buttonBackground: Colors.transparent,
        buttonHoverBackground: Colors.black,
        buttonText: Colors.black,
        buttonHoverText: const Color(0xFFD9D9D9),
        chipBackground: Colors.black,
        chipText: const Color(0xFFD9D9D9),
        iconColor: Colors.black,
        dotIndicatorActive: Colors.black,
        dotIndicatorInactive: Colors.black.withValues(alpha: 0.3),
      ),
    ],
  );
}

/// Build a dark ThemeData with the given accent color.
ThemeData buildDarkTheme(Color accent) {
  return ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: accent,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFF1A1A2E),
    extensions: [
      PortfolioTheme(
        windowTint: Colors.black.withValues(alpha: 0.3),
        tabBackground: const Color(0xFF2A2A3E),
        tabSelectedBackground: Colors.white,
        tabText: Colors.white70,
        tabSelectedText: const Color(0xFF1A1A2E),
        dividerColor: Colors.white70,
        cardBorder: Colors.white70,
        accentColor: accent,
        headingColor: Colors.white,
        bodyTextColor: Colors.white,
        buttonBackground: Colors.transparent,
        buttonHoverBackground: Colors.white,
        buttonText: Colors.white,
        buttonHoverText: const Color(0xFF1A1A2E),
        chipBackground: Colors.white,
        chipText: const Color(0xFF1A1A2E),
        iconColor: Colors.white,
        dotIndicatorActive: Colors.white,
        dotIndicatorInactive: Colors.white.withValues(alpha: 0.3),
      ),
    ],
  );
}
