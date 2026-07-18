import 'package:flutter/material.dart';
import 'package:portfolio_flutter/models/project_model.dart';
import 'package:portfolio_flutter/config/app_sizes.dart';
import 'package:portfolio_flutter/config/app_theme.dart';

class ProjectImageSection extends StatelessWidget {
  const ProjectImageSection({
    super.key,
    required this.project,
    required this.i,
  });

  final Project project;
  final int i;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<PortfolioTheme>()!;

    return Padding(
      padding: const EdgeInsets.all(AppSizes.mediumPadding),
      child: Image.asset(
        project.assets[i],
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) return child;
          return frame == null
              ? Center(
                  child: CircularProgressIndicator(
                    color: theme.accentColor,
                    strokeCap: StrokeCap.round,
                    strokeWidth: 8,
                  ),
                )
              : child;
        },
      ),
    );
  }
}
