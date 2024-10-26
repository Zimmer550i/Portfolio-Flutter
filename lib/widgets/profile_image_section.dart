import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/app_contents.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:portfolio_flutter/widgets/social_button.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: AppSizes.smallPadding),
              borderRadius: BorderRadius.circular(AppSizes.mediumPadding),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.smallPadding),
              child: Image.asset(
                // "assets/icons/facebook.png",
                "assets/images/sakif.jpg",
                height: constraint.maxWidth < constraint.maxHeight / 1.5 ? constraint.maxWidth / 1.5 : constraint.maxHeight /2,
                width: constraint.maxWidth < constraint.maxHeight / 1.5 ? constraint.maxWidth / 1.5 : constraint.maxHeight /2,
              ),
            ),
          ),
          const SizedBox(
            height: AppSizes.mediumPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...AppContents.social.map((e) {
                return Padding(
                  padding:
                      const EdgeInsets.only(right: AppSizes.mediumPadding),
                  child: SocialButton(
                    imgAsset: e["icon"]!,
                    url: e["link"]!,
                    // size: constraint.maxWidth < constraint.maxHeight / 1.5 ? constraint.maxWidth / 10.5 : constraint.maxHeight /20,
                  ),
                );
              })
            ],
          ),
        ],
      );
    });
  }
}
