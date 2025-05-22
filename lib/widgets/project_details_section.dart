import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_flutter/project_model.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:portfolio_flutter/utils/app_texts.dart';
import 'package:portfolio_flutter/widgets/custom_button.dart';

class ProjectDetailsSection extends StatefulWidget {
  const ProjectDetailsSection({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  State<ProjectDetailsSection> createState() => _ProjectDetailsSectionState();
}

class _ProjectDetailsSectionState extends State<ProjectDetailsSection> {
  GlobalKey projectInfoKey = GlobalKey();
  GlobalKey projectLinksKey = GlobalKey();
  double requiredHeight = 0;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final double projectInfoHeight = projectInfoKey.currentContext?.size?.height ?? 0;
      final double projectLinksHeight = projectLinksKey.currentContext?.size?.height ?? 0;

      final double newRequiredHeight = projectInfoHeight + projectLinksHeight + AppSizes.mediumPadding;

      if (newRequiredHeight != requiredHeight) {
        setState(() {
          requiredHeight = newRequiredHeight;
        });
      }
    });

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.hasBoundedHeight && requiredHeight < constraints.maxHeight) {
        return Column(
          children: [
            projectInfo(projectInfoKey),
            Expanded(child: Container()),
            projectLinks(projectLinksKey),
          ],
        );
      }
      return SingleChildScrollView(
        child: Column(
          children: [
            projectInfo(projectInfoKey),
            const SizedBox(
              height: AppSizes.mediumPadding,
            ),
            projectLinks(projectLinksKey),
          ],
        ),
      );
    });
  }

  Widget projectLinks(GlobalKey key) {
    return Padding(
      key: key,
      padding: const EdgeInsets.only(bottom: AppSizes.mediumPadding),
      child: Wrap(
        spacing: AppSizes.mediumPadding,
        runSpacing: AppSizes.smallPadding,
        alignment: WrapAlignment.center,
        children: [
          for (int i = 0; i < widget.project.links.length; i++)
            CustomButton(
              icon: widget.project.links[i].icon,
              svgPath: widget.project.links[i].svgPath,
              text: widget.project.links[i].name,
              link: widget.project.links[i].url,
            ),
        ],
      ),
    );
  }

  Widget projectInfo(GlobalKey key) {
    return Column(
      key: key,
      children: [
        const SizedBox(
          height: AppSizes.mediumPadding,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Year: ${widget.project.year}",
          ),
        ),
        Text(
          widget.project.description,
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
              ...widget.project.tech.map((item) {
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
        for (int i = 0; i < widget.project.highlight.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.smallPadding),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/icons/dot.svg",
                  height: AppSizes.iconSizeSmall,
                ),
                const SizedBox(
                  width: AppSizes.mediumPadding,
                ),
                Expanded(
                  child: Text(
                    widget.project.highlight[i],
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
