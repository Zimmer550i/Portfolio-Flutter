import 'package:flutter/material.dart';
import '../utils/app_sizes.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxHeight > constraints.maxWidth) {
        return const Column(
          children: [],
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            rmsc(constraints),
          ],
        );
      }
    });
  }

  rmsc(BoxConstraints size) {
    return Row(
      children: [
        FittedBox(
          child: Container(
                  constraints: size,
              decoration: BoxDecoration(
                border: Border.all(width: AppSizes.smallPadding),
                borderRadius: BorderRadius.circular(AppSizes.mediumPadding),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.smallPadding),
                child: Image.asset(
                  "assets/images/diu.jpeg",
                ),
              ),
            ),
        ),
        const Text("Rajshahi Model School and College"),
      ],
    );
  }
}
