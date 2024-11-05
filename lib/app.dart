import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:portfolio_flutter/widgets/main_window.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  double _rotationX = 0;
  double _rotationY = 0;
  double mouseX = 0;
  double mouseY = 0;

  void _updateRotationAngles(PointerHoverEvent event, Size screenSize) {
    mouseX = event.position.dx;
    mouseY = event.position.dy;

    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    setState(() {
      _rotationY = (mouseX / screenWidth - 0.5) * pi / 18;
      _rotationX = -(mouseY / screenHeight - 0.5) * pi / 18;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width <
        MediaQuery.of(context).size.height) {
      return const Scaffold(
        body: Center(
          child: MainWindow(),
        ),
      );
    }
    return Scaffold(
      body: MouseRegion(
        cursor: SystemMouseCursors.none,
        onHover: (event) {
          _updateRotationAngles(
              event,
              MediaQuery.of(context)
                  .size); // Update rotation angles based on mouse movement
        },
        child: Stack(
          children: [
            Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // Perspective
                ..rotateX(_rotationX) // Rotate around X-axis (up/down)
                ..rotateY(_rotationY), // Rotate around Y-axis (left/right)
              child: const Center(
                child: MainWindow(),
              ),
            ),
            Positioned(
              left: mouseX,
              top: mouseY,
              child: IgnorePointer(
                child: Image.asset(
                  'assets/icons/cursor.png',
                  height: AppSizes.iconSizeMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
