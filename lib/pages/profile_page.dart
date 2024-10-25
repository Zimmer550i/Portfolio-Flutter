import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/app_contents.dart';
import 'package:portfolio_flutter/utils/app_texts.dart';
import 'package:portfolio_flutter/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../utils/app_sizes.dart';

class ProfilePage extends StatelessWidget {
  final bool isMobile;
  const ProfilePage({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: firstSection(context),
          ),
          Expanded(
            child: secondSection(),
          ),
        ],
      );
    }
    return Row(
      children: [
        Expanded(
          child: firstSection(context),
        ),
        Expanded(
          child: secondSection(),
        ),
      ],
    );
  }

  Column secondSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hi, I am",
          style: AppTexts.bodyText,
        ),
        AnimatedTextKit(
          repeatForever: true,
          pause: const Duration(seconds: 3),
          animatedTexts: [
            TypewriterAnimatedText(
              "MD Wasiul Islam",
              speed: const Duration(milliseconds: 60),
              textStyle: AppTexts.tabText.copyWith(fontSize: 48),
            ),
            TypewriterAnimatedText(
              "Zimmer550i",
              speed: const Duration(milliseconds: 60),
              textStyle: AppTexts.tabText
                  .copyWith(fontWeight: FontWeight.w900, fontSize: 48),
            ),
          ],
        ),
        const Text(
          "Flutter Developer",
          style: AppTexts.bodyTextLarge,
        ),
        const FittedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.mediumPadding),
            child: Row(
              children: [
                CustomButton(),
                SizedBox(
                  width: AppSizes.mediumPadding,
                ),
                CustomButton(),
              ],
            ),
          ),
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...AppContents.social.map((e) {
              return GestureDetector(
                onTap: () {
                  launchUrlString(e["link"]!);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: AppSizes.mediumPadding),
                  child: Image.asset(
                    e["icon"]!,
                    width: AppSizes.largePadding,
                  ),
                ),
              );
            })
          ],
        ),
      ],
    );
  }

  Center firstSection(BuildContext context) {
    return Center(
      child: LayoutBuilder(builder: (context, constraint) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(width: AppSizes.smallPadding),
            borderRadius: BorderRadius.circular(AppSizes.mediumPadding),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.smallPadding),
            child: Image.asset(
              "assets/icons/facebook.png",
              // "assets/images/sakif.jpg",
              height: constraint.maxWidth / 2,
            ),
          ),
        );
      }),
    );
  }
}