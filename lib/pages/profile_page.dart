import 'package:flutter/material.dart';
import 'package:portfolio_flutter/widgets/profile_image_section.dart';
import 'package:portfolio_flutter/widgets/profile_details_section.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxHeight >= constraints.maxWidth) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ProfileImageSection(isMobile: (constraints.maxHeight >= constraints.maxWidth),),
          ),
          const Expanded(
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
    );});
  }
}
