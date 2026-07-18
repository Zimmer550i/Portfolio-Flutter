import 'package:flutter/material.dart';
import 'package:portfolio_flutter/config/app_sizes.dart';
import 'package:portfolio_flutter/services/analytics_service.dart';
import 'package:portfolio_flutter/utils/responsive.dart';
import 'package:portfolio_flutter/widgets/profile_image_section.dart';
import 'package:portfolio_flutter/widgets/profile_details_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static bool _loggedOnce = false;

  @override
  Widget build(BuildContext context) {
    if (!_loggedOnce) {
      AnalyticsService.logScreenView("Profile Screen");
      _loggedOnce = true;
    }

    return LayoutBuilder(builder: (context, constraints) {
      if (isMobile(context)) {
        return const Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: AppSizes.largePadding),
                ProfileImageSection(),
                ProfileDetailsSection(),
                SizedBox(height: AppSizes.largePadding),
              ],
            ),
          ),
        );
      }
      return const Row(
        children: [
          Expanded(child: ProfileImageSection()),
          Expanded(child: ProfileDetailsSection()),
        ],
      );
    });
  }
}
