import 'package:flutter/material.dart';
import 'package:portfolio_flutter/project_model.dart';
import 'package:portfolio_flutter/widgets/project_details_section.dart';
import 'package:portfolio_flutter/widgets/project_image_section.dart';

class LeftProjectWindow extends StatelessWidget {
  final Project project;
  const LeftProjectWindow({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ProjectImageSection(project: project, i: 0),
        ),
        Expanded(child: ProjectDetailsSection(project: project)),
      ],
    );
  }
}
