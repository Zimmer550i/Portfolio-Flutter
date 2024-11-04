import 'package:flutter/material.dart';
import 'package:portfolio_flutter/project_model.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:portfolio_flutter/utils/app_texts.dart';
import 'package:portfolio_flutter/widgets/custom_button.dart';

class ProjectDetailsSection extends StatelessWidget {
  const ProjectDetailsSection({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          const SizedBox(
            height: AppSizes.mediumPadding,
          ),
          Text(
            project.description,
            maxLines: 50,
            style: AppTexts.bodyText,
          ),
          const SizedBox(
            height: AppSizes.smallPadding,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: AppSizes.smallPadding,
              children: [
                ...project.tech.map((item) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSizes.smallPadding),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(
                        AppSizes.largePadding,
                      ),
                    ),
                    child: Text(
                      item,
                      style: AppTexts.bodyText.copyWith(
                        color: AppColors.backgroundColor,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(
            height: AppSizes.smallPadding,
          ),
          for (int i = 0; i < project.highlight.length; i++)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check),
                Expanded(
                  child: Text(
                    project.highlight[i],
                    style: AppTexts.bodyTextLarge,
                    maxLines: 5,
                  ),
                ),
              ],
            ),
          (constraints.hasBoundedHeight)
              ? Expanded(child: Container())
              : const SizedBox(
                  height: AppSizes.mediumPadding,
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
          ),
          const SizedBox(
            height: AppSizes.mediumPadding,
          ),
        ],
      );
    });
  }
}
