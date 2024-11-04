import 'package:flutter/material.dart';
import 'package:portfolio_flutter/project_model.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:portfolio_flutter/widgets/project_details_section.dart';
import 'package:portfolio_flutter/widgets/project_image_section.dart';

class RightProjectWindow extends StatelessWidget {
  final Project project;
  const RightProjectWindow({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: ProjectDetailsSection(project: project)),
        Expanded(
          flex: 2,
          child: ProjectImageSection(project: project, i: 0),
        ),
      ],
    );
  }
}
