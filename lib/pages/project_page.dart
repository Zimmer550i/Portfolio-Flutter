import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_flutter/models/project_model.dart';
import 'package:portfolio_flutter/config/app_contents.dart';
import 'package:portfolio_flutter/config/app_sizes.dart';
import 'package:portfolio_flutter/config/app_texts.dart';
import 'package:portfolio_flutter/config/app_theme.dart';
import 'package:portfolio_flutter/services/analytics_service.dart';
import 'package:portfolio_flutter/utils/responsive.dart';
import 'package:portfolio_flutter/widgets/dot_indicator.dart';
import 'package:portfolio_flutter/widgets/project_layout.dart';
import 'package:portfolio_flutter/widgets/project_image_section.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  int index = 0;
  late PageController _controller;
  bool _isPageAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    AnalyticsService.logScreenView("Project Screen");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _goToPage(int newIndex) async {
    if (_isPageAnimating ||
        newIndex < 0 ||
        newIndex >= AppContents.projects.length) {
      return;
    }

    AnalyticsService.logCustomEvent("Project Page Browsed");
    setState(() {
      index = newIndex;
      _isPageAnimating = true;
    });

    await _controller.animateToPage(
      newIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );

    if (mounted) {
      setState(() {
        _isPageAnimating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (isMobile(context)) {
        return _mobileLayout(AppContents.projects[index]);
      } else {
        return _webLayout(AppContents.projects[index]);
      }
    });
  }

  Widget _webLayout(Project project) {
    final theme = Theme.of(context).extension<PortfolioTheme>()!;

    return Row(
      children: [
        GestureDetector(
          onTap: () => _goToPage(index - 1),
          child: SvgPicture.asset(
            "assets/icons/arrow_backward.svg",
            width: MediaQuery.of(context).size.width > 1000
                ? AppSizes.iconSizeMedium
                : AppSizes.iconSizeSmall,
            colorFilter: ColorFilter.mode(
              index != 0 ? theme.iconColor : theme.dotIndicatorInactive,
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(width: AppSizes.smallPadding),
        Expanded(
          child: Column(
            children: [
              FittedBox(
                child: Text(project.title, style: AppTexts.heading(context)),
              ),
              Expanded(
                child: Listener(
                  onPointerSignal: (event) {
                    if (event is PointerScrollEvent) {
                      if (event.scrollDelta.dy > 0) {
                        _goToPage(index + 1);
                      } else if (event.scrollDelta.dy < 0) {
                        _goToPage(index - 1);
                      }
                    }
                  },
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.trackpad,
                        PointerDeviceKind.stylus,
                        PointerDeviceKind.unknown,
                      },
                    ),
                    child: PageView.builder(
                      controller: _controller,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (value) {
                        if (value != index) {
                          setState(() => index = value);
                        }
                      },
                      itemCount: AppContents.projects.length,
                      itemBuilder: (context, idx) {
                        return _getProjectWindow(AppContents.projects[idx]);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSizes.smallPadding),
        GestureDetector(
          onTap: () => _goToPage(index + 1),
          child: SvgPicture.asset(
            "assets/icons/arrow_forward.svg",
            width: MediaQuery.of(context).size.width > 1000
                ? AppSizes.iconSizeMedium
                : AppSizes.iconSizeSmall,
            colorFilter: ColorFilter.mode(
              index < AppContents.projects.length - 1
                  ? theme.iconColor
                  : theme.dotIndicatorInactive,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }

  Widget _mobileLayout(Project project) {
    final theme = Theme.of(context).extension<PortfolioTheme>()!;

    return Column(
      children: [
        Text(
          project.title,
          style:
              AppTexts.tabText(context).copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: ProjectLayout(project: project, isMobile: true),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                if (index > 0) {
                  AnalyticsService.logCustomEvent("Project Page Browsed");
                  setState(() => index--);
                }
              },
              child: SvgPicture.asset(
                "assets/icons/arrow_backward.svg",
                width: AppSizes.iconSizeSmall,
                colorFilter: ColorFilter.mode(
                  index != 0 ? theme.iconColor : theme.dotIndicatorInactive,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Expanded(
              child: DotIndicator(
                currentIndex: index,
                count: AppContents.projects.length,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (index < AppContents.projects.length - 1) {
                  AnalyticsService.logCustomEvent("Project Page Browsed");
                  setState(() => index++);
                }
              },
              child: SvgPicture.asset(
                "assets/icons/arrow_forward.svg",
                width: AppSizes.iconSizeSmall,
                colorFilter: ColorFilter.mode(
                  index < AppContents.projects.length - 1
                      ? theme.iconColor
                      : theme.dotIndicatorInactive,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.mediumPadding),
      ],
    );
  }

  Widget _getProjectWindow(Project project) {
    switch (project.type) {
      case DisplayType.split:
      case DisplayType.left:
      case DisplayType.right:
        return ProjectLayout(project: project);
      case DisplayType.full:
        return ProjectImageSection(project: project, i: 0);
    }
  }
}
