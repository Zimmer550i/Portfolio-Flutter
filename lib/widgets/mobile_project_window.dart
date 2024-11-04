import 'package:flutter/material.dart';
import 'package:portfolio_flutter/project_model.dart';
import 'package:portfolio_flutter/widgets/profile_details_section.dart';
import 'package:portfolio_flutter/widgets/project_details_section.dart';
import 'package:portfolio_flutter/widgets/project_image_section.dart';

class MobileProjectWindow extends StatelessWidget {
  final Project project;
  const MobileProjectWindow({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < project.assets.length; i++)
            ProjectImageSection(project: project, i: i),
          ProjectDetailsSection(project: project,),
        ],
      ),
    );
  }
}
