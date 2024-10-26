import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/app_contents.dart';
import 'package:portfolio_flutter/utils/app_texts.dart';
import 'package:portfolio_flutter/widgets/custom_button.dart';
import 'package:portfolio_flutter/widgets/profile_image_section.dart';
import 'package:portfolio_flutter/widgets/profile_details_section.dart';
import 'package:portfolio_flutter/widgets/social_button.dart';

import '../utils/app_sizes.dart';

class ProfilePage extends StatelessWidget {
  final bool isMobile;
  const ProfilePage({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ProfileImageSection(),
          ),
          Expanded(
            child: ProfileDetailsSection(),
          ),
        ],
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
  }
}
