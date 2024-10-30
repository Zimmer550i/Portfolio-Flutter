import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:portfolio_flutter/project_model.dart';
import 'package:portfolio_flutter/utils/app_contents.dart';
import 'package:portfolio_flutter/utils/app_texts.dart';
import 'package:portfolio_flutter/widgets/page_view_index.dart';
import 'package:portfolio_flutter/widgets/split_project_window.dart';

import '../utils/app_colors.dart';
import '../utils/app_sizes.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Project project = AppContents.projects[index];
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxHeight > constraints.maxWidth) {
        return mobileLayout(project);
      } else {
        return webLayout(project);
      }
    });
  }

  Row webLayout(Project project) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (index > 0) {
              setState(() {
                index--;
              });
            }
          },
          mouseCursor: SystemMouseCursors.none,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        Expanded(
          child: Column(
            children: [
              FittedBox(
                child: Text(
                  project.title,
                  style: AppTexts.heading,
                ),
              ),
              Expanded(
                  child: SplitProjectWindow(
                project: project,
              )),
              PageViewIndex(index: index),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            if (index < AppContents.projects.length - 1) {
              setState(() {
                index++;
              });
            }
          },
          mouseCursor: SystemMouseCursors.none,
          icon: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ],
    );
  }

  Widget mobileLayout(Project project) {
    return Column(
      children: [
        Text(
          project.title,
          style: AppTexts.heading,
        ),
        Expanded(child: SplitProjectWindow(project: project)),
        Container(
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(AppSizes.smallPadding / 2),
          ),
          height: AppSizes.smallPadding,
          width: double.infinity,
        ),
        PageViewDotIndicator(
            currentItem: index,
            count: AppContents.projects.length,
            unselectedColor: Colors.black.withOpacity(0.3),
            selectedColor: AppColors.black),
      ],
    );
  }
}
