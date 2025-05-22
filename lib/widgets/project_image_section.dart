import 'package:flutter/material.dart';
import 'package:portfolio_flutter/project_model.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';

class ProjectImageSection extends StatelessWidget {
  const ProjectImageSection({
    super.key,
    required this.project,
    required this.i,
  });

  final Project project;
  final int i;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(AppSizes.mediumPadding),
        child: Image.asset(
          project.assets[i],
          frameBuilder: (BuildContext context, Widget child, int? frame,
              bool wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) {
              return child;
            }
            return frame == null
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.black,
                      strokeCap: StrokeCap.round,
                      strokeWidth: 8,
                    ),
                  )
                : child;
          },
        ),
      );
}
