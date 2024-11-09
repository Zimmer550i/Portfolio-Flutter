import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:portfolio_flutter/project_model.dart';
import 'package:portfolio_flutter/utils/app_contents.dart';
import 'package:portfolio_flutter/utils/app_texts.dart';
import 'package:portfolio_flutter/utils/log_event.dart';
import 'package:portfolio_flutter/widgets/left_project_window.dart';
import 'package:portfolio_flutter/widgets/mobile_project_window.dart';
import 'package:portfolio_flutter/widgets/page_view_index.dart';
import 'package:portfolio_flutter/widgets/project_image_section.dart';
import 'package:portfolio_flutter/widgets/right_project_window.dart';
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
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    logScreenEvent();
  }

  void logScreenEvent() async {
    await FirebaseAnalyticsWeb().setCurrentScreen(screenName: "Project Screen");
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxHeight > constraints.maxWidth * 0.8) {
        return mobileLayout(AppContents.projects[index]);
      } else {
        return webLayout(AppContents.projects[index]);
      }
    });
  }

  Row webLayout(Project project) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (index > 0) {
              logCustomEvent("Project Page Browsed");
              setState(() {
                index--;
                _controller.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.decelerate);
              });
            }
          },
          child: SvgPicture.asset(
            "assets/icons/arrow_backward.svg",
            width: AppSizes.iconSizeMedium,
            // ignore: deprecated_member_use
            color:
                index != 0 ? const Color.fromARGB(255, 8, 1, 1) : Colors.grey,
          ),
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
                child: PageView.builder(
                    controller: _controller,
                    itemCount: AppContents.projects.length,
                    itemBuilder: (context, idx) {
                      return getProjectWindow(AppContents.projects[idx]);
                    }),
              ),
              PageViewIndex(index: index),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < AppContents.projects.length - 1) {
              logCustomEvent("Project Page Browsed");
              setState(() {
                index++;
                _controller.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.decelerate);
              });
            }
          },
          child: SvgPicture.asset(
            "assets/icons/arrow_forward.svg",
            width: AppSizes.iconSizeMedium,
            // ignore: deprecated_member_use
            color: index < AppContents.projects.length - 1
                ? AppColors.black
                : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget mobileLayout(Project project) {
    return Column(
      children: [
        Text(
          project.title,
          style: AppTexts.tabText.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Expanded(child: MobileProjectWindow(project: project)),
        // Container(
        //   decoration: BoxDecoration(
        //     color: AppColors.black,
        //     borderRadius: BorderRadius.circular(AppSizes.smallPadding / 2),
        //   ),
        //   height: AppSizes.smallPadding,
        //   width: double.infinity,
        // ),
        // const SizedBox(
        //   height: AppSizes.mediumPadding,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                if (index > 0) {
              logCustomEvent("Project Page Browsed");
                  setState(() {
                    index--;
                  });
                  // _controller.animateToPage(index,
                  //     duration: const Duration(milliseconds: 300),
                  //     curve: Curves.decelerate);
                }
              },
              child: SvgPicture.asset(
                "assets/icons/arrow_backward.svg",
                width: AppSizes.iconSizeSmall,
                // ignore: deprecated_member_use
                color: index != 0
                    ? const Color.fromARGB(255, 8, 1, 1)
                    : Colors.grey,
              ),
            ),
            Expanded(
              child: PageViewDotIndicator(
                currentItem: index,
                count: AppContents.projects.length,
                unselectedColor: Colors.black.withOpacity(0.3),
                selectedColor: AppColors.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (index < AppContents.projects.length - 1) {
              logCustomEvent("Project Page Browsed");
                  setState(() {
                    index++;
                  });
                  // _controller.animateToPage(index,
                  //     duration: const Duration(milliseconds: 300),
                  //     curve: Curves.decelerate);
                }
              },
              child: SvgPicture.asset(
                "assets/icons/arrow_forward.svg",
                width: AppSizes.iconSizeSmall,
                // ignore: deprecated_member_use
                color: index < AppContents.projects.length - 1
                    ? AppColors.black
                    : Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: AppSizes.mediumPadding,
        ),
      ],
    );
  }

  Widget getProjectWindow(Project project) {
    switch (project.type) {
      case DisplayType.split:
        return SplitProjectWindow(project: project);
      case DisplayType.left:
        return LeftProjectWindow(project: project);
      case DisplayType.full:
        return ProjectImageSection(project: project, i: 0);
      case DisplayType.right:
        return RightProjectWindow(project: project);
      default:
        return SplitProjectWindow(project: project);
    }
  }
}
