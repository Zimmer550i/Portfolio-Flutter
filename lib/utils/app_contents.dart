import 'package:flutter/material.dart';
import 'package:portfolio_flutter/pages/profile_page.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';

class AppContents {
  static const List<String> tabs = [
    "Profile",
    "Projects",
    "Education",
  ];
  static List<Widget Function({bool isMobile})> pages = [
    ({bool? isMobile}) => ProfilePage(isMobile: isMobile ?? false,),
    ({bool? isMobile}) => const FlutterLogo(size: AppSizes.mediumText),
    ({bool? isMobile}) => const FlutterLogo(size: AppSizes.largeText),
  ];
  static const List<Map<String, String>> social = [
    {
      "icon": "assets/icons/github.png",
      "link": "https://github.com/Zimmer550i",
    },
    // {
    //   "icon": "assets/icons/facebook.png",
    //   "link": "https://www.facebook.com/sakif049/",
    // },
    {
      "icon": "assets/icons/linkedin.png",
      "link": "https://www.linkedin.com/in/wasiul-islam-398a71189/",
    },
    {
      "icon": "assets/icons/codeforces.png",
      "link": "https://codeforces.com/profile/Zimmer550i",
    },
  ];
}
