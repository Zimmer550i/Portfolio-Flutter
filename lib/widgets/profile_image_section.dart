import 'package:flutter/material.dart';
import 'package:portfolio_flutter/config/app_contents.dart';
import 'package:portfolio_flutter/config/app_sizes.dart';
import 'package:portfolio_flutter/config/app_theme.dart';
import 'package:portfolio_flutter/utils/responsive.dart';
import 'package:portfolio_flutter/widgets/social_button.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<PortfolioTheme>()!;

    return LayoutBuilder(builder: (context, constraint) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: _getSize(context, constraint),
            width: _getSize(context, constraint),
            decoration: BoxDecoration(
              border: Border.all(
                width: AppSizes.smallPadding,
                color: theme.cardBorder,
              ),
              borderRadius: BorderRadius.circular(AppSizes.mediumPadding),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.smallPadding),
              child: Image.asset(
                AppContents.profileImgAsset,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) return child;
                  return frame == null
                      ? Center(
                          child: CircularProgressIndicator(
                            color: theme.accentColor,
                            strokeCap: StrokeCap.round,
                            strokeWidth: 8,
                          ),
                        )
                      : child;
                },
              ),
            ),
          ),
          const SizedBox(height: AppSizes.mediumPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: AppContents.social.map((e) {
              return Padding(
                padding: const EdgeInsets.only(right: AppSizes.mediumPadding),
                child: SocialButton(
                  imgAsset: e["icon"]!,
                  url: e["link"]!,
                ),
              );
            }).toList(),
          ),
        ],
      );
    });
  }

  double _getSize(BuildContext context, BoxConstraints constraint) {
    if (isMobile(context)) {
      return constraint.maxWidth / 1.5;
    }
    return constraint.maxWidth < constraint.maxHeight / 1.5
        ? constraint.maxWidth / 1.5
        : constraint.maxHeight / 2;
  }
}
