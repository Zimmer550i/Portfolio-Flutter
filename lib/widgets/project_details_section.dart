import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_flutter/models/project_model.dart';
import 'package:portfolio_flutter/config/app_sizes.dart';
import 'package:portfolio_flutter/config/app_texts.dart';
import 'package:portfolio_flutter/config/app_theme.dart';
import 'package:portfolio_flutter/widgets/custom_button.dart';

class ProjectDetailsSection extends StatefulWidget {
  const ProjectDetailsSection({super.key, required this.project});

  final Project project;

  @override
  State<ProjectDetailsSection> createState() => _ProjectDetailsSectionState();
}

class _ProjectDetailsSectionState extends State<ProjectDetailsSection> {
  final GlobalKey _projectInfoKey = GlobalKey();
  final GlobalKey _projectLinksKey = GlobalKey();
  double requiredHeight = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<PortfolioTheme>()!;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final infoH = _projectInfoKey.currentContext?.size?.height ?? 0;
      final linksH = _projectLinksKey.currentContext?.size?.height ?? 0;
      final newRequired = infoH + linksH + AppSizes.mediumPadding;

      if (newRequired != requiredHeight) {
        setState(() => requiredHeight = newRequired);
      }
    });

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.hasBoundedHeight &&
          requiredHeight < constraints.maxHeight) {
        return Column(
          children: [
            _projectInfo(_projectInfoKey, theme),
            const Spacer(),
            _projectLinks(_projectLinksKey),
          ],
        );
      }
      return SingleChildScrollView(
        child: Column(
          children: [
            _projectInfo(_projectInfoKey, theme),
            const SizedBox(height: AppSizes.mediumPadding),
            _projectLinks(_projectLinksKey),
          ],
        ),
      );
    });
  }

  Widget _projectLinks(GlobalKey key) {
    return Padding(
      key: key,
      padding: const EdgeInsets.only(bottom: AppSizes.mediumPadding),
      child: Wrap(
        spacing: AppSizes.mediumPadding,
        runSpacing: AppSizes.smallPadding,
        alignment: WrapAlignment.center,
        children: [
          for (final link in widget.project.links)
            CustomButton(
              icon: link.icon,
              svgPath: link.svgPath,
              text: link.name,
              link: link.url,
            ),
        ],
      ),
    );
  }

  Widget _projectInfo(GlobalKey key, PortfolioTheme theme) {
    return Column(
      key: key,
      children: [
        const SizedBox(height: AppSizes.mediumPadding),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Year: ${widget.project.year}",
            style: AppTexts.bodyText(context),
          ),
        ),
        Text(
          widget.project.description,
          maxLines: 50,
          style: AppTexts.bodyText(context),
        ),
        const SizedBox(height: AppSizes.smallPadding),
        Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: AppSizes.smallPadding,
            runSpacing: AppSizes.smallPadding,
            children: widget.project.tech.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.smallPadding,
                ),
                decoration: BoxDecoration(
                  color: theme.chipBackground,
                  borderRadius: BorderRadius.circular(AppSizes.largePadding),
                ),
                child: Text(
                  item,
                  style: AppTexts.bodyText(context).copyWith(
                    color: theme.chipText,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: AppSizes.mediumPadding),
        for (final highlight in widget.project.highlight)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.smallPadding),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/icons/dot.svg",
                  height: AppSizes.iconSizeSmall,
                  colorFilter: ColorFilter.mode(
                    theme.iconColor,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: AppSizes.mediumPadding),
                Expanded(
                  child: Text(
                    highlight,
                    style: AppTexts.bodyTextLarge(context),
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
