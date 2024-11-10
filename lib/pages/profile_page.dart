import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/widgets/profile_image_section.dart';
import 'package:portfolio_flutter/widgets/profile_details_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static bool loggedOnce = false;
  void logScreenEvent() async {
    await FirebaseAnalyticsWeb().setCurrentScreen(screenName: "Project Screen");
  }

  @override
  Widget build(BuildContext context) {
    if (!loggedOnce) {
      logScreenEvent();
      loggedOnce = true;
    }

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxHeight >= constraints.maxWidth) {
        return Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileImageSection(
                  isMobile: (constraints.maxHeight >= constraints.maxWidth),
                ),
                const ProfileDetailsSection(),
              ],
            ),
          ),
        );
      }
      return const Row(
        children: [
          Expanded(
            child: ProfileImageSection(),
          ),
          Expanded(
            child: ProfileDetailsSection(),
          ),
        ],
      );
    });
  }
}
