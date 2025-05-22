import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:portfolio_flutter/utils/is_mobile.dart';
import 'package:portfolio_flutter/widgets/bug_flying_animation.dart';
import 'package:portfolio_flutter/widgets/custom_button.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  static bool loggedOnce = false;
  void logScreenEvent() async {
    await FirebaseAnalytics.instance
        .logScreenView(screenName: "Project Screen");
  }

  @override
  Widget build(BuildContext context) {
    if (!loggedOnce) {
      logScreenEvent();
      loggedOnce = true;
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          const Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      "No Experiences",
                      style: TextStyle(fontFamily: "Custom", fontSize: 90),
                    ),
                  ),
                  Text(
                    "maybe you can help me get some",
                    style: TextStyle(fontFamily: "Custom", fontSize: 42),
                  ),
                  SizedBox(
                    height: AppSizes.largePadding,
                  ),
                  CustomButton(
                    link: "mailto:sakif049@gmail.com",
                    icon: Icons.work_rounded,
                    text: "Hire Me",
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: isMobile(context) ? -AppSizes.mediumPadding : -AppSizes.largePadding,
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
          isMobile(context)
              ? Container()
              : BugFlyingAnimation(
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                ),
        ],
      );
    });
  }
}
