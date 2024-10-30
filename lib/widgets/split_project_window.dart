import 'package:flutter/material.dart';
import 'package:portfolio_flutter/project_model.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:portfolio_flutter/widgets/custom_button.dart';

class SplitProjectWindow extends StatelessWidget {
  final Project project;
  const SplitProjectWindow({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Image.asset(project.assets[0])),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSizes.mediumPadding),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(project.description),
                for (int i = 0; i < project.highlight.length; i++)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.check),
                      Text(project.highlight[i]),
                    ],
                  ),
                Wrap(
                  children: [
                    for (int i = 0; i < project.links.length; i++)
                      CustomButton(
                        icon: Icons.catching_pokemon_rounded,
                        text: project.links[i].name,
                        link: project.links[i].url,
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
        project.assets.length >= 1
            ? Expanded(child: Image.asset(project.assets[1]))
            : Container(),
      ],
    );
  }
}
