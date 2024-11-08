import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      return SingleChildScrollView(
        child: Column(
          children: [
            projectInfo(),
            const SizedBox(
              height: AppSizes.mediumPadding,
            ),
            projectLinks(),
          ],
        ),
      );
    });
  }

  Widget projectLinks() {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.mediumPadding),
      child: Wrap(
        spacing: AppSizes.mediumPadding,
        runSpacing: AppSizes.smallPadding,
        alignment: WrapAlignment.center,
        children: [
          for (int i = 0; i < project.links.length; i++)
            CustomButton(
              icon: project.links[i].icon,
              svgPath: project.links[i].svgPath,
              text: project.links[i].name,
              link: project.links[i].url,
            ),
        ],
      ),
    );
  }

  Widget projectInfo() {
    return Column(
      children: [
        const SizedBox(
          height: AppSizes.mediumPadding,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Year: ${project.year}",
          ),
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
            runSpacing: AppSizes.smallPadding,
            children: [
              ...project.tech.map((item) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.smallPadding),
                  decoration: BoxDecoration(
                    color: AppColors.black,
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
          height: AppSizes.mediumPadding,
        ),
        for (int i = 0; i < project.highlight.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.smallPadding),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/icons/arrow_forward.svg",
                  height: AppSizes.iconSizeSmall,
                ),
                const SizedBox(
                  width: AppSizes.mediumPadding,
                ),
                Expanded(
                  child: Text(
                    project.highlight[i],
                    style: AppTexts.bodyTextLarge,
                    maxLines: 5,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
