import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_flutter/utils/app_contents.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:portfolio_flutter/utils/is_mobile.dart';
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
      _rotationY = (mouseX / screenWidth - 0.5) * pi / 6;
      _rotationY /= AppContents.rotationMultiplier;
      _rotationX = -(mouseY / screenHeight - 0.5) * pi / 6;
      _rotationX /= AppContents.rotationMultiplier;
    });
  }

  bool get isMouseConnected {
    return RendererBinding.instance.mouseTracker.mouseIsConnected;
  }

  @override
  Widget build(BuildContext context) {
    if (isMobile(context)) {
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
            MediaQuery.of(context).size,
          ); // Update rotation angles based on mouse movement
        },
        child: Stack(
          children: [
            // Positioned.fill(
            //   child: Container(
            //     decoration: BoxDecoration(
            //       gradient: RadialGradient(
            //         radius: MediaQuery.of(context).size.height / 2,
            //         colors: const [Colors.amber, Colors.transparent],
            //         stops: const [0.5, 0.5],
            //       ),
            //     ),
            //   ),
            // ),
            Positioned.fill(
              child: Opacity(
                opacity: 0.05,
                child: Image.asset(
                  "assets/images/grain.jpg",
                  colorBlendMode: BlendMode.overlay,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // Perspective
                ..rotateX(isMouseConnected
                    ? _rotationX
                    : 0) // Rotate around X-axis (up/down)
                ..rotateY(isMouseConnected
                    ? _rotationY
                    : 0), // Rotate around Y-axis (left/right)
              child: const Center(
                child: MainWindow(),
              ),
            ).animate().fadeIn(
                  duration: const Duration(milliseconds: 100),
                ),
            isMouseConnected
                ? Positioned(
                    left: mouseX,
                    top: mouseY,
                    child: IgnorePointer(
                      child: Image.asset(
                        'assets/icons/cursor.png',
                        height: AppSizes.iconSizeMedium,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
