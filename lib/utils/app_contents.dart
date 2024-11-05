import 'package:flutter/material.dart';
import 'package:portfolio_flutter/pages/education_page.dart';
import 'package:portfolio_flutter/pages/info_page.dart';
import 'package:portfolio_flutter/pages/profile_page.dart';
import 'package:portfolio_flutter/pages/project_page.dart';
import 'package:portfolio_flutter/project_model.dart';

class AppContents {
  static const List<String> tabs = [
    "Profile",
    "Info",
    "Projects",
  ];
  static List<Widget> pages = [
    const ProfilePage(),
    const InfoPage(),
    const ProjectPage(),
  ];
  static const String profileDescription =
      "a self-taught Flutter developer with a generalist approach and a background in competitive programming, focused on creating optimized and impactful digital experiences.";
  static const String detailedDescription =
      """I'm a Flutter developer with a generalist approach, skilled in building versatile and user-focused applications. My background includes a strong foundation in competitive programming, giving me a keen eye for problem-solving and optimized solutions. Self-taught and dedicated, I’m passionate about merging creativity with technical expertise to create impactful digital experiences. Whether it's tackling complex app architectures or refining UI details, I bring a diverse skill set and a drive for continuous learning to every project.""";
  static const List<String> skills = [
    "Flutter",
    "Firebase",
    "RESTful API",
    "Clean Architecture",
    "Competitive Programming",
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
      mainTech: Technology.flutter,
      year: 2023,
      type: DisplayType.split,
      title: "Instagram Clone",
      description:
          "An Instagram Clone with Firebase as it's backend. Users must signin to use the app. Post images are compressed to reduce traffic and reduce loading times. This was one of the very fast app I used to learn Flutter. Expect some spaghetti code inside XD...",
      assets: [
        "assets/images/insta_clone_front.png",
        "assets/images/insta_clone_right.png",
      ],
      tech: ["Flutter", "Firebase", "Authentication"],
      highlight: [
        "Fully functional Authentication",
        "Posts Contain Image and Description",
        "Image compression to reduce traffic",
      ],
      links: [
        ProjectLink(
          icon: Icons.android_rounded,
          name: "APK",
          url:
              "https://github.com/Zimmer550i/instagram_clone/releases/download/v0.1/app-release.apk",
        ),
        ProjectLink(
          svgPath: "icons/github.svg",
          name: "Github",
          url: "https://github.com/Zimmer550i/instagram_clone",
        ),
      ],
    ),
  ];
}
