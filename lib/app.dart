import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  double _rotationX = 0;
  double _rotationY = 0;

  void _updateRotationAngles(PointerHoverEvent event, Size screenSize) {
    final mouseX = event.position.dx;
    final mouseY = event.position.dy;

    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    setState(() {
      _rotationY = (mouseX / screenWidth - 0.5) * pi / 18;
      _rotationX = -(mouseY / screenHeight - 0.5) * pi / 18;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width - AppSizes.webPadding;
    double height = width / AppSizes.webAspectRatio;

    return Scaffold(
      body: MouseRegion(
        onHover: (event) {
          _updateRotationAngles(event,
              screenSize); // Update rotation angles based on mouse movement
        },
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // Perspective
            ..rotateX(_rotationX) // Rotate around X-axis (up/down)
            ..rotateY(_rotationY), // Rotate around Y-axis (left/right)
          child: Center(
            child: Container(
              width: width,
              height: height,
              constraints: BoxConstraints(
                maxWidth: screenSize.width - AppSizes.webPadding,
                maxHeight: screenSize.height,
              ),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                border: Border.all(width: AppSizes.smallPadding),
                borderRadius: BorderRadius.circular(AppSizes.mediumPadding),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
