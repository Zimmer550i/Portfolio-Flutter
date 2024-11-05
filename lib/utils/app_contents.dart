import 'package:flutter/material.dart';
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
    "BLoC Pattern",
    "Git version management",
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
    Project(
      mainTech: Technology.flutter,
      year: 2023,
      type: DisplayType.left,
      title: "Crafting Psyche",
      description:
          "Crafting Psyche is an exciting collision-avoidance game developed by Team Space Psycho for the NASA Space Apps Challenge 2023. Built with Flutter and the Flame engine, the game challenges players' reflexes as they navigate through space and avoid obstacles in an immersive interstellar adventure. As the app developer, I worked alongside an amazing team, each member bringing unique skills and dedication to bring this project to life.",
      assets: [
        "assets/images/crafting_psyche.png",
      ],
      tech: ["Nasa Space Apps Challenge", "Flutter", "Flame Engine"],
      highlight: [
        "Based on real life Psyche mission by NASA with lore",
        "Flutter's Flame Engine used for optimal performence",
        "3 stages with 1 bonus mode and an Endless mode",
      ],
      links: [
        ProjectLink(
          icon: Icons.android_rounded,
          name: "APK",
          url:
              "https://github.com/Zimmer550i/Crafting-Psyche/releases/download/v0.1-alpha/app-release.apk",
        ),
        ProjectLink(
          svgPath: "icons/github.svg",
          name: "Github",
          url: "https://github.com/Zimmer550i/Crafting-Psyche",
        ),
      ],
    ),
    Project(
      mainTech: Technology.flutter,
      year: 2024,
      type: DisplayType.split,
      title: "Daily Expenditure",
      description:
          "The Daily Expenditure app is a user-friendly tool designed to simplify tracking personal spending. With an easy tap-based input system, users can log their expenses quickly without needing a keyboard, making it ideal for on-the-go usage. Integrated with Firebase for secure authentication and real-time data management, the app ensures a smooth and reliable experience. It also features visual spending insights through charts and graphs powered by fl_chart, helping users understand and manage their finances effectively. A web version of the app is planned for future development to expand accessibility across platforms.",
      assets: [
        "assets/images/daily_exp_left.png",
        "assets/images/daily_exp_right.png",
      ],
      tech: ["Flutter", "Firebase", "Authentication", "Graph"],
      highlight: [
        "Keyboardless data entry",
        "Charts and Graphs for better insight",
        "Realtime data backup and sync across multiple devices",
      ],
      links: [],
    ),
    Project(
      title: "Neomorphic Calculator",
      mainTech: Technology.web,
      year: 2023,
      description:
          "This is a simple calculator with neomorphic design built on web using Html, Css and Js. A toggle button allows it to switch between Dark and Light mode. Sound playback has been used for haptic feedback. The Site is live, do check it out.",
      type: DisplayType.left,
      tech: ["HTML", "CSS", "JavaScript"],
      highlight: [
        "Neomorphic Design",
        "Dark and Light Mode",
      ],
      assets: ["assets/images/neo_calc.png"],
      links: [
        ProjectLink(
          icon: Icons.link_rounded,
          name: "Site",
          url: "https://zimmer550i.github.io/NeomorphicCalculatorWeb/",
        ),
        ProjectLink(
          svgPath: "icons/github.svg",
          name: "Github",
          url: "https://github.com/Zimmer550i/NeomorphicCalculatorWeb",
        ),
      ],
    ),
  ];
}
