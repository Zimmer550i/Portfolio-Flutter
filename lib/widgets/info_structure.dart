import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:portfolio_flutter/utils/app_texts.dart';

class InfoStructure extends StatelessWidget {
  final String title;
  final Widget child;
  final bool isSubTitle;
  const InfoStructure({super.key, required this.title, required this.child, this.isSubTitle = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "$title:",
          style: isSubTitle ? AppTexts.bodyTextLarge : AppTexts.heading,
        ),
        const SizedBox(
          height: AppSizes.mediumPadding,
        ),
        Padding(
          padding: const EdgeInsets.only(left: AppSizes.largePadding),
          child: child,
        ),
      ],
    );
  }
}
