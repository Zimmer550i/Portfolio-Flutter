import 'package:flutter/material.dart';
import 'package:portfolio_flutter/pages/education_page.dart';
import 'package:portfolio_flutter/pages/profile_page.dart';
import 'package:portfolio_flutter/pages/project_page.dart';
import 'package:portfolio_flutter/project_model.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';

class AppContents {
  static const List<String> tabs = [
    "Profile",
    "Projects",
    "Contact Me",
  ];
  static List<Widget> pages = [
    const ProfilePage(),
    const ProjectPage(),
    const FlutterLogo(size: AppSizes.largeText),
  ];
  static const String profileDescription =
      "a self-taught Flutter developer with a generalist approach and a background in competitive programming, focused on creating optimized and impactful digital experiences.";
  static const String detailedDescription =
      """I'm a Flutter developer with a generalist approach, skilled in building versatile and user-focused applications. My background includes a strong foundation in competitive programming, giving me a keen eye for problem-solving and optimized solutions. Self-taught and dedicated, I’m passionate about merging creativity with technical expertise to create impactful digital experiences. Whether it's tackling complex app architectures or refining UI details, I bring a diverse skill set and a drive for continuous learning to every project.""";

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
      title: 'What is Lorem Ipsum?',
      type: DisplayType.split,
      mainTech: Technology.flutter,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      assets: ['assets/images/asset1.png', 'assets/images/asset1.png'],
      tech: ['Flutter', 'Dart'],
      highlight: [
        'Lorem Ipsum includes all the main characters',
        'Suitable placeholder for anything'
      ],
      links: [
        ProjectLink(
            iconAsset: 'assets/icons/github.svg',
            name: "Link 1",
            url: "https://github.com/Zimmer550i")
      ],
    ),
    Project(
      title: 'Project Title',
      type: DisplayType.split,
      mainTech: Technology.flutter,
      description: 'Project Description',
      assets: ['assets/images/asset1.png', 'assets/images/asset1.png'],
      tech: ['Flutter', 'Dart'],
      highlight: ['Project Highlight 1', 'Project Highlight 2'],
      links: [
        ProjectLink(
            iconAsset: 'assets/icons/github.svg',
            name: "Link 1",
            url: "https://github.com/Zimmer550i")
      ],
    ),
    Project(
      title: 'Project Title',
      type: DisplayType.full,
      mainTech: Technology.flutter,
      description: 'Project Description',
      assets: ['assets/images/sakif.jpg'],
      tech: ['Flutter', 'Dart'],
      highlight: ['Project Highlight 1', 'Project Highlight 2'],
      links: [
        ProjectLink(
            iconAsset: 'assets/icons/github.svg',
            name: "Link 1",
            url: "https://github.com/Zimmer550i")
      ],
    ),
  ];
}
