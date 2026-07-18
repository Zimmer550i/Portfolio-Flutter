import 'package:flutter/material.dart';
import 'package:portfolio_flutter/config/app_colors.dart';
import 'package:portfolio_flutter/config/app_sizes.dart';
import 'package:portfolio_flutter/config/app_theme.dart';
import 'package:portfolio_flutter/services/settings_provider.dart';

/// Floating gear-icon settings overlay for theme, accent color, and background.
class SettingsOverlay extends StatefulWidget {
  const SettingsOverlay({super.key});

  @override
  State<SettingsOverlay> createState() => _SettingsOverlayState();
}

class _SettingsOverlayState extends State<SettingsOverlay> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<PortfolioTheme>()!;
    final settings = SettingsScope.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (_isOpen) _panel(settings, theme),
        const SizedBox(height: AppSizes.smallPadding),
        GestureDetector(
          onTap: () => setState(() => _isOpen = !_isOpen),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(AppSizes.smallPadding),
            decoration: BoxDecoration(
              color: theme.tabSelectedBackground.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(AppSizes.smallPadding),
            ),
            child: Icon(
              _isOpen ? Icons.close : Icons.settings,
              color: theme.tabSelectedText,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _panel(SettingsProvider settings, PortfolioTheme theme) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(AppSizes.mediumPadding),
      decoration: BoxDecoration(
        color: theme.tabSelectedBackground.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(AppSizes.mediumPadding),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Theme mode
          Text("Theme", style: TextStyle(
            color: theme.tabSelectedText,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          )),
          const SizedBox(height: AppSizes.smallPadding),
          Row(
            children: [
              _themeBtn(settings, theme, ThemeMode.light, Icons.light_mode),
              const SizedBox(width: AppSizes.smallPadding),
              _themeBtn(settings, theme, ThemeMode.dark, Icons.dark_mode),
            ],
          ),
          const SizedBox(height: AppSizes.mediumPadding),

          // Accent color
          Text("Accent Color", style: TextStyle(
            color: theme.tabSelectedText,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          )),
          const SizedBox(height: AppSizes.smallPadding),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: AccentPresets.options.map((opt) {
              final isSelected = settings.accentColor == opt.color;
              return GestureDetector(
                onTap: () => settings.setAccentColor(opt.color),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: opt.color,
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(color: theme.tabSelectedText, width: 2)
                        : null,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _themeBtn(
    SettingsProvider settings,
    PortfolioTheme theme,
    ThemeMode mode,
    IconData icon,
  ) {
    final isActive = settings.themeMode == mode;
    return GestureDetector(
      onTap: () => settings.setThemeMode(mode),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: isActive
              ? theme.tabSelectedText.withValues(alpha: 0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          icon,
          color: theme.tabSelectedText,
          size: 18,
        ),
      ),
    );
  }
}
