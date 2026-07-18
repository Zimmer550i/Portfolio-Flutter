import 'package:flutter/material.dart';
import 'package:portfolio_flutter/config/app_sizes.dart';
import 'package:portfolio_flutter/config/app_theme.dart';
import 'package:portfolio_flutter/services/analytics_service.dart';
import 'package:portfolio_flutter/utils/responsive.dart';
import 'package:portfolio_flutter/widgets/bug_flying_animation.dart';
import 'package:portfolio_flutter/widgets/custom_button.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  static bool _loggedOnce = false;

  @override
  Widget build(BuildContext context) {
    if (!_loggedOnce) {
      AnalyticsService.logScreenView("Experience Screen");
      _loggedOnce = true;
    }

    final theme = Theme.of(context).extension<PortfolioTheme>()!;

    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      "No Experiences",
                      style: TextStyle(
                        fontFamily: "Custom",
                        fontSize: 90,
                        color: theme.headingColor,
                        shadows: const [
                          Shadow(color: Colors.black38, blurRadius: 5),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "maybe you can help me get some",
                    style: TextStyle(
                      fontFamily: "Custom",
                      fontSize: 42,
                      color: theme.bodyTextColor,
                      shadows: const [
                        Shadow(color: Colors.black38, blurRadius: 5),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSizes.largePadding),
                  const CustomButton(
                    link: "mailto:sakif049@gmail.com",
                    icon: Icons.work_rounded,
                    text: "Hire Me",
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: isMobile(context)
                ? -AppSizes.mediumPadding
                : -AppSizes.largePadding,
            left: isMobile(context) ? -AppSizes.largePadding : 0,
            child: Image.asset(
              "assets/images/web_1.png",
              width: isMobile(context)
                  ? constraints.maxWidth / 2
                  : constraints.maxWidth / 5,
            ),
          ),
          Positioned(
            top: isMobile(context) ? 0 : -AppSizes.largePadding,
            right: isMobile(context) ? -AppSizes.smallPadding : 0,
            child: Transform.flip(
              flipX: true,
              child: Image.asset(
                "assets/images/web_2.png",
                width: isMobile(context)
                    ? constraints.maxWidth / 2
                    : constraints.maxWidth / 3,
              ),
            ),
          ),
          if (!isMobile(context))
            BugFlyingAnimation(
              size: Size(constraints.maxWidth, constraints.maxHeight),
            ),
        ],
      );
    });
  }
}
