import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/config/app_contents.dart';
import 'package:portfolio_flutter/config/app_sizes.dart';
import 'package:portfolio_flutter/config/app_texts.dart';
import 'package:portfolio_flutter/widgets/custom_button.dart';

class ProfileDetailsSection extends StatelessWidget {
  const ProfileDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hi, I am", style: AppTexts.bodyText(context)),
        AnimatedTextKit(
          repeatForever: true,
          pause: const Duration(seconds: 3),
          animatedTexts: [
            TypewriterAnimatedText(
              "MD Wasiul Islam",
              speed: const Duration(milliseconds: 60),
              textStyle: AppTexts.tabText(context).copyWith(fontSize: 48),
            ),
            TypewriterAnimatedText(
              "Zimmer550i",
              speed: const Duration(milliseconds: 60),
              textStyle: AppTexts.tabText(context).copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 48,
              ),
            ),
          ],
        ),
        LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth * 0.8,
            child: Text(
              AppContents.profileDescription,
              style: AppTexts.bodyTextLarge(context),
            ),
          );
        }),
        FittedBox(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: AppSizes.mediumPadding),
            child: Row(
              children: [
                CustomButton(
                  icon: Icons.text_snippet_rounded,
                  text: "Get CV",
                  link: "${Uri.base.toString()}/${AppContents.cvFileName}",
                ),
                const SizedBox(width: AppSizes.mediumPadding),
                const CustomButton(
                  icon: Icons.email_rounded,
                  text: "Contact Me",
                  link: "mailto:${AppContents.emailAddress}",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
