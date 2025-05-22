import 'package:flutter/material.dart';

enum Technology {
  python,
  flutter,
  web,
  ai,
}

enum DisplayType { split, right, left, full }

class ProjectLink {
  final IconData? icon;
  final String? svgPath;
  final String name;
  final String url;

  ProjectLink({
    this.icon,
    this.svgPath,
    required this.name,
    required this.url,
  });
}

class Project {
  final String title;
  final Technology mainTech;
  final DisplayType type;
  final List<String> tech;
  final String description;
  final List<String> assets;
  final List<String> highlight;
  final List<ProjectLink> links;
  final int year;

  Project({
    required this.year,
    required this.mainTech,
    required this.type,
    required this.title,
    required this.description,
    required this.assets,
    required this.tech,
    required this.highlight,
    required this.links,
  });
}
