import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';

class AppContents {
  static const List<String> tabs = [
    "Profile",
    "Projects",
    "Education",
  ];
  static const List<Widget> pages = [
    FlutterLogo(size: AppSizes.smallText,),
    FlutterLogo(size: AppSizes.mediumText,),
    FlutterLogo(size: AppSizes.largeText,),
  ];
}
