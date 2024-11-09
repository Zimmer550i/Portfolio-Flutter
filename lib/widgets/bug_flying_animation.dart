import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:portfolio_flutter/utils/log_event.dart';

class BugFlyingAnimation extends StatefulWidget {
  final Size size;

  const BugFlyingAnimation({super.key, required this.size});

  @override
  BugFlyingAnimationState createState() => BugFlyingAnimationState();
}

class BugFlyingAnimationState extends State<BugFlyingAnimation>
    with SingleTickerProviderStateMixin {
  double _x = 0;
  double _y = 0;
  double _angle = 0;
  double _targetX = 200;
  double _targetY = 200;
  final double _maxSpeed = 10;
  double _speed = 2;
  double _rotationSpeed = 0.2;
  bool isMoving = true;
  bool showFirst = true;
  late Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = Ticker(_onTick)..start();
    _setNewTarget();
  }

  void _onTick(Duration elapsed) {
    if (isMoving) {
      setState(() {
        // Calculate direction to target
        double deltaX = _targetX - _x;
        double deltaY = _targetY - _y;
        double targetAngle = atan2(deltaY, deltaX);

        setState(() {
          showFirst = !showFirst;
        });

        // Gradually rotate towards target angle
        double angleDifference = targetAngle - _angle;
        angleDifference =
            (angleDifference + pi) % (2 * pi) - pi; // Normalize to [-pi, pi]

        if (dist() > widget.size.shortestSide / 3) {
          _rotationSpeed = 0.05;
        } else {
          _rotationSpeed = 0.2;
        }
        if (angleDifference.abs() < _rotationSpeed) {
          _angle = targetAngle; // Snap to target angle if close enough
        } else {
          _angle += angleDifference.sign * _rotationSpeed;
        }

        // Move forward in the current direction
        _speed = dist() / 10;
        _speed = _speed > _maxSpeed ? _maxSpeed : _speed;
        _x += cos(_angle) * _speed;
        _y += sin(_angle) * _speed;

        // Check if close enough to the target to set a new one
        if (dist() < 50) {
          setState(() {
            isMoving = false;
          });
        }
      });
    }
  }

  double dist() {
    return sqrt(pow(_targetX - _x, 2) + pow(_targetY - _y, 2)).toDouble();
  }

  void _setNewTarget() {
    final random = Random();
    _targetX = random.nextDouble() * (widget.size.width - 58);
    _targetY = random.nextDouble() * (widget.size.height - 86);

    double deltaX = _targetX - _x;
    double deltaY = _targetY - _y;
    if ((deltaX * deltaX + deltaY * deltaY) < 500) {
      _setNewTarget();
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _x,
      top: _y,
      child: Transform.rotate(
        angle: _angle,
        child: MouseRegion(
          onHover: (event) {
            logCustomEvent("Playing with the Bug");
            setState(() {
              isMoving = true;
              _setNewTarget();
            });
          },
          child: Image.asset(
            showFirst ? "assets/images/fly_1.png" : "assets/images/fly_2.png",
          ),
        ),
      ),
    );
  }
}
