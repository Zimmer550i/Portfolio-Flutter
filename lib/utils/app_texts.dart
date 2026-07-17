import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';

class AppTexts {
  static const TextStyle tabText = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
    shadows: [Shadow(color: Colors.black38, blurRadius: 5)],
  );

  static const TextStyle heading = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
    shadows: [Shadow(color: Colors.black38, blurRadius: 5)],
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16.0,
    color: AppColors.textColor,
    shadows: [Shadow(color: Colors.black38, blurRadius: 5)],
  );

  static const TextStyle bodyTextLarge = TextStyle(
    fontSize: 18.0,
    color: AppColors.textColor,
    shadows: [Shadow(color: Colors.black38, blurRadius: 5)],
  );

  static const TextStyle errorText = TextStyle(
    fontSize: 14.0,
    color: AppColors.textColor,
    shadows: [Shadow(color: Colors.black38, blurRadius: 5)],
  );
}
