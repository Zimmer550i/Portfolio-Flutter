import 'package:flutter/material.dart';
import 'package:portfolio_flutter/pages/profile_page.dart';
import 'package:portfolio_flutter/pages/project_page.dart';
import 'package:portfolio_flutter/project_model.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';

class AppContents {
  static const List<String> tabs = [
    "Profile",
    "Projects",
    "Education",
  ];
  static List<Widget> pages = [
    const ProfilePage(),
    const ProjectPage(),
    const FlutterLogo(size: AppSizes.largeText),
  ];
  static const List<Map<String, String>> social = [
    {
      "icon": "assets/icons/github.svg",
      "link": "https://github.com/Zimmer550i",
    },
    // {
    //   "icon": "assets/icons/facebook.png",
    //   "link": "https://www.facebook.com/sakif049/",
    // },
    {
      "icon": "assets/icons/linkedin.svg",
      "link": "https://www.linkedin.com/in/wasiul-islam-398a71189/",
    },
    {
      "icon": "assets/icons/codeforces.svg",
      "link": "https://codeforces.com/profile/Zimmer550i",
    },
  ];

  static List<Project> projects = [
    Project(
      title: 'Project Title',
      type: DisplayType.split,
      mainTech: Technology.flutter,
      description: 'Project Description',
      assets: ['assets/images/asset1.png', 'assets/images/asset1.png'],
      tech: ['Flutter', 'Dart'],
      highlight: ['Project Highlight 1', 'Project Highlight 2'],
      links: [ProjectLink(iconAsset: 'assets/icons/github.svg', name: "Link 1", url: "https://github.com/Zimmer550i")],
    ),
    Project(
      title: 'Project Title',
      type: DisplayType.split,
      mainTech: Technology.flutter,
      description: 'Project Description',
      assets: ['assets/images/asset1.png', 'assets/images/asset1.png'],
      tech: ['Flutter', 'Dart'],
      highlight: ['Project Highlight 1', 'Project Highlight 2'],
      links: [ProjectLink(iconAsset: 'assets/icons/github.svg', name: "Link 1", url: "https://github.com/Zimmer550i")],
    ),
    Project(
      title: 'Project Title',
      type: DisplayType.split,
      mainTech: Technology.flutter,
      description: 'Project Description',
      assets: ['assets/images/sakif.jpg', 'assets/images/asset1.png'],
      tech: ['Flutter', 'Dart'],
      highlight: ['Project Highlight 1', 'Project Highlight 2'],
      links: [ProjectLink(iconAsset: 'assets/icons/github.svg', name: "Link 1", url: "https://github.com/Zimmer550i")],
    ),
  ];
}
