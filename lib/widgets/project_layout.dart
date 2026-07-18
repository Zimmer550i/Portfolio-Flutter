import 'package:flutter/material.dart';
import 'package:portfolio_flutter/models/project_model.dart';
import 'package:portfolio_flutter/widgets/project_details_section.dart';
import 'package:portfolio_flutter/widgets/project_image_section.dart';

/// Consolidated project layout replacing left/right/split/mobile project windows.
class ProjectLayout extends StatelessWidget {
  final Project project;
  final bool isMobile;

  const ProjectLayout({
    super.key,
    required this.project,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobile) return _mobileLayout();

    switch (project.type) {
      case DisplayType.split:
        return _splitLayout(context);
      case DisplayType.left:
        return _leftLayout(context);
      case DisplayType.right:
        return _rightLayout(context);
      case DisplayType.full:
        return ProjectImageSection(project: project, i: 0);
    }
  }

  Widget _mobileLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < project.assets.length; i++)
            ProjectImageSection(project: project, i: i),
          ProjectDetailsSection(project: project),
        ],
      ),
    );
  }

  Widget _leftLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ProjectImageSection(project: project, i: 0),
        ),
        Expanded(
          flex: MediaQuery.of(context).size.width > 1200 ? 1 : 2,
          child: ProjectDetailsSection(project: project),
        ),
      ],
    );
  }

  Widget _rightLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: MediaQuery.of(context).size.width > 1200 ? 1 : 2,
          child: ProjectDetailsSection(project: project),
        ),
        Expanded(
          flex: 2,
          child: ProjectImageSection(project: project, i: 0),
        ),
      ],
    );
  }

  Widget _splitLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(child: ProjectImageSection(project: project, i: 0)),
        Expanded(child: ProjectDetailsSection(project: project)),
        if (project.assets.length > 1)
          Expanded(child: ProjectImageSection(project: project, i: 1)),
      ],
    );
  }
}
