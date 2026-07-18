import 'package:flutter/material.dart';

/// Responsive breakpoint utilities replacing the old is_mobile.dart.
bool isMobile(BuildContext context) {
  return MediaQuery.of(context).size.width < MediaQuery.of(context).size.height;
}

bool isNarrowDesktop(BuildContext context) {
  return MediaQuery.of(context).size.width < 1000;
}
