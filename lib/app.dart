import 'dart:math';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_flutter/config/app_contents.dart';
import 'package:portfolio_flutter/config/app_sizes.dart';
import 'package:portfolio_flutter/config/app_theme.dart';
import 'package:portfolio_flutter/services/settings_provider.dart';
import 'package:portfolio_flutter/utils/responsive.dart';
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

    final settings = SettingsScope.of(context);
    final theme = Theme.of(context).extension<PortfolioTheme>()!;
    final bgImage = settings.backgroundImage;

    return Scaffold(
      body: MouseRegion(
        cursor: SystemMouseCursors.none,
        onHover: (event) {
          _updateRotationAngles(event, MediaQuery.of(context).size);
        },
        child: Stack(
          children: [
            // Static background
            Positioned.fill(
              child: Image.asset(bgImage, fit: BoxFit.cover),
            ),
            // 3D perspective window
            Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(isMouseConnected ? _rotationX : 0)
                ..rotateY(isMouseConnected ? _rotationY : 0),
              child: Center(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final screenSize = MediaQuery.of(context).size;
                    final sw = screenSize.width;
                    final sh = screenSize.height;
                    final windowW = sw * AppSizes.webPadding;
                    final windowH = sh * AppSizes.webPadding;
                    final maxW = windowH * 1.7776;
                    final actualW = windowW < maxW ? windowW : maxW;

                    // Compute the exact inverse of the parent's transform
                    // so the inner blurred bg perfectly cancels out the rotation
                    final parentTransform = Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(isMouseConnected ? _rotationX : 0)
                      ..rotateY(isMouseConnected ? _rotationY : 0);
                    final inverseTransform = Matrix4.copy(parentTransform)
                      ..invert();

                    return ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppSizes.mediumPadding),
                      child: SizedBox(
                        width: actualW,
                        height: windowH,
                        child: Stack(
                          clipBehavior: Clip.hardEdge,
                          children: [
                            // Counter-rotated blurred background
                            RepaintBoundary(
                              child: Transform(
                                alignment: FractionalOffset.center,
                                transform: inverseTransform,
                                child: OverflowBox(
                                  maxWidth: sw,
                                  maxHeight: sh,
                                  child: ImageFiltered(
                                    imageFilter: ImageFilter.blur(
                                        sigmaX: 5, sigmaY: 5),
                                    child: Image.asset(
                                      bgImage,
                                      width: sw,
                                      height: sh,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Tint overlay
                            Positioned.fill(
                              child: Container(color: theme.windowTint),
                            ),
                            // Window content
                            const Positioned.fill(child: MainWindow()),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ).animate().fadeIn(
                  duration: const Duration(milliseconds: 100),
                ),
            // Custom cursor
            if (isMouseConnected)
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
