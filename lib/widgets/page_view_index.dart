import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/app_contents.dart';

class PageViewIndex extends StatelessWidget {
  final int index;
  const PageViewIndex({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return PageViewDotIndicator(
      currentItem: index,
      count: AppContents.projects.length,
      unselectedColor: Colors.black.withOpacity(0.3),
      selectedColor: AppColors.black,
    );
  }
}
