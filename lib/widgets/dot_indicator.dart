import 'package:flutter/material.dart';
import 'package:portfolio_flutter/config/app_theme.dart';

/// Custom animated dot indicator replacing the page_view_dot_indicator package.
class DotIndicator extends StatelessWidget {
  final int currentIndex;
  final int count;

  const DotIndicator({
    super.key,
    required this.currentIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<PortfolioTheme>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final isActive = i == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: isActive ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive
                ? theme.dotIndicatorActive
                : theme.dotIndicatorInactive,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
