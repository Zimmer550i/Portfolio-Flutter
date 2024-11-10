import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:portfolio_flutter/utils/is_mobile.dart';
import 'package:portfolio_flutter/widgets/profile_image_section.dart';
import 'package:portfolio_flutter/widgets/profile_details_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
      if (isMobile(context)) {
        return const Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: AppSizes.largePadding,),
                ProfileImageSection(),
                ProfileDetailsSection(),
                SizedBox(height: AppSizes.largePadding,),
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
