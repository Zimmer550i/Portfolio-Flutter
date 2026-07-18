import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_flutter/config/app_contents.dart';
import 'package:portfolio_flutter/config/app_sizes.dart';
import 'package:portfolio_flutter/config/app_texts.dart';
import 'package:portfolio_flutter/config/app_theme.dart';
import 'package:portfolio_flutter/services/analytics_service.dart';
import 'package:portfolio_flutter/utils/responsive.dart';
import 'package:portfolio_flutter/widgets/info_structure.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  static bool _loggedOnce = false;

  @override
  Widget build(BuildContext context) {
    if (!_loggedOnce) {
      AnalyticsService.logScreenView("Info Screen");
      _loggedOnce = true;
    }

    final theme = Theme.of(context).extension<PortfolioTheme>()!;

    return LayoutBuilder(builder: (context, constraints) {
      if (isMobile(context)) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSizes.largePadding),
              _aboutMe(context),
              const SizedBox(height: AppSizes.largePadding),
              _skills(context, theme),
              const SizedBox(height: AppSizes.largePadding),
              InfoStructure(
                title: "I've Worked With:",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _technologies(),
                    const SizedBox(height: AppSizes.mediumPadding),
                    _languages(),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.largePadding),
              _education(context),
              const SizedBox(height: AppSizes.largePadding),
              _contactInfo(context, theme),
              const SizedBox(height: AppSizes.largePadding),
            ],
          ),
        );
      }

      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: constraints.maxHeight * 1.3),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _aboutMe(context)),
                    const SizedBox(width: AppSizes.largePadding),
                    Expanded(flex: 2, child: _skills(context, theme)),
                  ],
                ),
                const SizedBox(height: AppSizes.largePadding),
                _workedWith(),
                const SizedBox(height: AppSizes.largePadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _education(context)),
                    const SizedBox(width: AppSizes.largePadding),
                    Expanded(flex: 2, child: _contactInfo(context, theme)),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _workedWith() {
    return InfoStructure(
      title: "I've Worked With",
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _technologies()),
          const SizedBox(width: AppSizes.largePadding),
          Expanded(child: _languages()),
        ],
      ),
    );
  }

  Widget _languages() {
    return InfoStructure(
      title: "Languages",
      isSubTitle: true,
      child: Wrap(
        spacing: AppSizes.smallPadding,
        runSpacing: AppSizes.smallPadding,
        children: [
          Image.asset("assets/logos/c.png", height: 36),
          Image.asset("assets/logos/cpp.png", height: 36),
          Image.asset("assets/logos/csharp.png", height: 36),
          Image.asset("assets/logos/python.png", height: 36),
          Image.asset("assets/logos/js.png", height: 36),
          Image.asset("assets/logos/java.png", height: 36),
          Image.asset("assets/logos/php.png",
              height: 36, filterQuality: FilterQuality.high),
          Image.asset("assets/logos/bash.png", height: 36),
          Image.asset("assets/logos/dart.png", height: 36),
          Image.asset("assets/logos/sql.png", height: 36),
        ],
      ),
    );
  }

  Widget _technologies() {
    return InfoStructure(
      title: "Technologies",
      isSubTitle: true,
      child: Wrap(
        spacing: AppSizes.mediumPadding,
        runSpacing: AppSizes.mediumPadding,
        children: [
          Image.asset("assets/logos/flutter.png", height: 36),
          Image.asset("assets/logos/firebase.png", height: 36),
          Image.asset("assets/logos/git.png", height: 36),
          Image.asset("assets/logos/xampp.png", height: 36),
          Image.asset("assets/logos/docker.png", height: 36),
          Image.asset("assets/logos/postman.png", height: 36),
          Image.asset("assets/logos/cpanel.png", height: 36, width: 72),
          Transform.translate(
            offset: const Offset(0, -18),
            child: Image.asset("assets/logos/lamp.png", height: 48),
          ),
        ],
      ),
    );
  }

  Widget _aboutMe(BuildContext context) {
    return InfoStructure(
      title: "About Me",
      child: Text(
        AppContents.detailedDescription,
        style: AppTexts.bodyTextLarge(context),
      ),
    );
  }

  Widget _education(BuildContext context) {
    return InfoStructure(
      title: "Education",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Daffodil International University",
            style: AppTexts.bodyTextLarge(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Computer Science and Engineering",
            style: AppTexts.bodyText(context),
          ),
          Text(
            "Graduation: Dec 2024",
            style: AppTexts.bodyText(context),
          ),
        ],
      ),
    );
  }

  Widget _skills(BuildContext context, PortfolioTheme theme) {
    return InfoStructure(
      title: "Skills",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: AppContents.skills.map((e) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.mediumPadding),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/arrow_forward.svg",
                  height: AppSizes.iconSizeSmall,
                  colorFilter: ColorFilter.mode(
                    theme.iconColor,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: AppSizes.mediumPadding),
                Expanded(
                  child: Text(e, style: AppTexts.bodyTextLarge(context)),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _contactInfo(BuildContext context, PortfolioTheme theme) {
    return InfoStructure(
      title: "Contact",
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.email_rounded, color: theme.iconColor),
              const SizedBox(width: AppSizes.mediumPadding),
              Text("sakif049@gmail.com", style: AppTexts.bodyText(context)),
            ],
          ),
          const SizedBox(height: AppSizes.mediumPadding),
          Row(
            children: [
              Icon(Icons.location_pin, color: theme.iconColor),
              const SizedBox(width: AppSizes.mediumPadding),
              Text("Dhaka, Bangladesh", style: AppTexts.bodyText(context)),
            ],
          ),
        ],
      ),
    );
  }
}
