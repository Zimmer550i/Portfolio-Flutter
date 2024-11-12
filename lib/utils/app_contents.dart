import 'package:flutter/material.dart';
import 'package:portfolio_flutter/pages/experience_page.dart';
import 'package:portfolio_flutter/pages/info_page.dart';
import 'package:portfolio_flutter/pages/profile_page.dart';
import 'package:portfolio_flutter/pages/project_page.dart';
import 'package:portfolio_flutter/project_model.dart';

class AppContents {
  static const double rotationMultiplier = 3;

  static const List<String> tabs = [
    "Profile",
    "Info",
    "Projects",
    "Experience",
  ];
  static List<Widget> pages = [
    const ProfilePage(),
    const InfoPage(),
    const ProjectPage(),
    const ExperiencePage(),
  ];
  static const String profileDescription =
      "a self-taught Flutter developer with a generalist approach and a background in competitive programming, pursuing collaborative environment to apply my skills and deepen my learning.";
  static const String detailedDescription =
      """I'm a Flutter developer with a generalist approach, skilled in building versatile and user-focused applications. My background includes a strong foundation in competitive programming, giving me a keen eye for problem-solving and optimized solutions. Self-taught and dedicated, I’m passionate about merging creativity with technical expertise to create impactful digital experiences. Whether it's tackling complex app architectures or refining UI details, I bring a diverse skill set and a drive for continuous learning to every project.""";
  static const List<String> skills = [
    "Flutter",
    "Firebase",
    "RESTful API",
    "BLoC, GetX, Provider",
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
      title: "This Portfolio Website",
      mainTech: Technology.flutter,
      year: 2024,
      description:
          "This website is designed with a minimalist approach to highlight my personal projects. Built using Flutter and hosted cost-free on Firebase Hosting, it integrates Firebase Analytics for tracking views and user interactions. You’re welcome to explore or fork the code directly from the GitHub Link given below.",
      type: DisplayType.right,
      tech: ["Flutter", "Firebase Hosting", "Firebase Analytics"],
      highlight: [
        "Built with Flutter for a responsive web experience. Optimized for all display sizes, from mobile to desktop",
        "Minimalist design to emphasize personal project showcase",
        "Hosted on Firebase Hosting for a reliable, cost-free solution",
        "Integrated Firebase Analytics for tracking views and user interactions",
      ],
      assets: ["assets/images/portfolio.png"],
      links: [
        ProjectLink(
          icon: Icons.link_rounded,
          name: "Site",
          url: "https://zimmer550i.web.app",
        ),
        ProjectLink(
          svgPath: "assets/icons/github.svg",
          name: "Github",
          url: "https://github.com/Zimmer550i/Portfolio-Flutter",
        ),
      ],
    ),
    Project(
      mainTech: Technology.flutter,
      year: 2024,
      type: DisplayType.split,
      title: "Daily Expenditure",
      description:
          "The Daily Expenditure app is a user-friendly tool designed to simplify tracking personal spending. With an easy tap-based input system, users can log their expenses quickly without needing a keyboard, making it ideal for on-the-go usage. Integrated with Firebase for secure authentication and real-time data management, the app ensures a smooth and reliable experience. It also features visual spending insights through charts and graphs powered by fl_chart, helping users understand and manage their finances effectively. A web version of the app is planned for future development to expand accessibility across platforms. The product is still in development. Codebase hasn't made public yet.",
      assets: [
        "assets/images/daily_exp_left.png",
        "assets/images/daily_exp_right.png",
      ],
      tech: ["Flutter", "Firebase", "Authentication", "Graph", "Provider"],
      highlight: [
        "Keyboardless data entry",
        "Charts and Graphs for better insight",
        "Realtime data backup and sync across multiple devices",
      ],
      links: [],
    ),
    Project(
      year: 2023,
      mainTech: Technology.flutter,
      type: DisplayType.right,
      title: "Uniwide Inventory Management",
      description:
          "Uniwide is an E-commerce app mainly used to manage inventory made for a client designed as per his request. User can add product and sell them at different prices and monitor profit for total sales. Variants like size or colors can also be selected while adding and selling products.",
      assets: ["assets/images/uniwide.png"],
      tech: [
        "Flutter",
        "Firebase",
        "Authentication",
      ],
      highlight: [
        "9 Page Application",
        "Firebase Authentication",
        "Firestore Database",
        "Add, Remove, Edit and Sell Products",
        "Different Variants are available for products",
      ],
      links: [
        ProjectLink(
          icon: Icons.android_rounded,
          name: "APK",
          url:
              "https://github.com/Zimmer550i/saad_project/releases/download/v0.5-alpha/app-release.apk",
        ),
        ProjectLink(
          svgPath: "assets/icons/github.svg",
          name: "Github",
          url: "https://github.com/Zimmer550i/saad_project",
        ),
      ],
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
          svgPath: "assets/icons/github.svg",
          name: "Github",
          url: "https://github.com/Zimmer550i/NeomorphicCalculatorWeb",
        ),
      ],
    ),
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
          svgPath: "assets/icons/github.svg",
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
          svgPath: "assets/icons/github.svg",
          name: "Github",
          url: "https://github.com/Zimmer550i/Crafting-Psyche",
        ),
      ],
    ),
    Project(
      year: 2024,
      mainTech: Technology.flutter,
      type: DisplayType.split,
      title: "Trivia App",
      description:
          "This trivia game project uses the OpenTDB API to bring a fun and interactive quiz experience to users. Players can select from 24 diverse topics and choose their preferred difficulty level: Easy, Medium, or Hard, to match their knowledge and skill. The game interface is designed to be simple and user-friendly, allowing seamless topic and difficulty selection. Trivia questions are dynamically fetched from the API, ensuring a fresh experience each time. The game also provides real-time score updates and feedback on answers, keeping users engaged and motivated as they play.",
      assets: [
        "assets/images/trivia_left.png",
        "assets/images/trivia_right.png"
      ],
      tech: ["Flutter", "RESTful API"],
      highlight: [
        "Choose from 24 diverse trivia topics",
        "Select difficulty level: Easy, Medium, or Hard",
        "Fetch trivia questions dynamically from OpenTDB API",
        "Simple and intuitive interface for topic and difficulty selection",
        "Real-time score display with feedback on correct and incorrect answers"
      ],
      links: [
        ProjectLink(
          svgPath: "assets/icons/github.svg",
          name: "Github",
          url: "https://github.com/Zimmer550i/trivia_app/",
        ),
        ProjectLink(
          icon: Icons.android_rounded,
          name: "APK",
          url:
              "https://github.com/Zimmer550i/trivia_app/releases/download/v1.0/app-arm64-v8a-release.apk",
        ),
      ],
    ),
    Project(
      year: 2023,
      mainTech: Technology.ai,
      type: DisplayType.split,
      title: "Peach Leaf Bacterial Disease Detection App Using AI",
      description:
          "This Flutter app detects bacterial diseases in peach leaves using camera input. The app utilizes a custom-trained AI model, created with a Kaggle dataset and implemented with TensorFlow Lite (tflite) for efficient, on-device disease detection.",
      assets: [
        "assets/images/peach_1.png",
        "assets/images/peach_2.png",
      ],
      tech: ["Flutter", "Kaggle", "AI", "Tflite"],
      highlight: [
        "Detects bacterial diseases in peach leaves using camera input",
        "AI model trained on Kaggle dataset for high accuracy",
        "TensorFlow Lite (tflite) integration for real-time, on-device inference",
        "User-friendly Flutter interface for easy disease identification"
      ],
      links: [
        ProjectLink(
          svgPath: "assets/icons/github.svg",
          name: "Github",
          url: "https://github.com/Zimmer550i/peach_leaf_detection_app.git",
        ),
        ProjectLink(
          icon: Icons.android_rounded,
          name: "APK",
          url:
              "https://github.com/Zimmer550i/peach_leaf_detection_app/releases/download/v0.1-beta/app-release.apk",
        ),
      ],
    ),
    Project(
      year: 2021,
      mainTech: Technology.python,
      type: DisplayType.right,
      title: "Space Game",
      description:
          "This project, built with Python and Pygame, is one of my proudest accomplishments. Despite its simplicity, it presented significant challenges that taught me the fundamentals of game development, handling complex project workflows, and mastering essential data structures.",
      assets: ["assets/images/space_game.png"],
      tech: ["Python", "Pygame"],
      highlight: [
        "Endless mode to achieve the highest score possible",
        "Difficulty dynamically increases with score",
        "Mouse-based gameplay for precision control",
        "Auto-shoot feature for continuous action"
      ],
      links: [
        ProjectLink(
          svgPath: "assets/icons/github.svg",
          name: "Github",
          url: "https://github.com/Zimmer550i/Space_Game.git",
        ),
      ],
    ),
    Project(
      year: 2021,
      mainTech: Technology.python,
      type: DisplayType.left,
      title: "Calculator App (Python)",
      description:
          "Basic calculator app made using Tkinter library. This is my very first project that has a GUI. Only whole numbers can be used as input but the output can be in float.",
      assets: ["assets/images/calc_python.png"],
      tech: ["Python", "Tkinter"],
      highlight: [],
      links: [
        ProjectLink(
          svgPath: "assets/icons/github.svg",
          name: "Github",
          url: "https://github.com/Zimmer550i/Calculator.git",
        ),
      ],
    ),
  ];
}
