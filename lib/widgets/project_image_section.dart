import 'package:flutter/material.dart';
import 'package:portfolio_flutter/project_model.dart';
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
    child: Image.asset(project.assets[i]),
  );
}
