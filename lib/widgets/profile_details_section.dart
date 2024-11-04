import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/app_contents.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:portfolio_flutter/utils/app_texts.dart';
import 'package:portfolio_flutter/widgets/custom_button.dart';

class ProfileDetailsSection extends StatelessWidget {
  const ProfileDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        LayoutBuilder(builder: (context, constraints) {
          double width = constraints.maxWidth * 0.8;
          return SizedBox(
            width: width,
            child: const Text(
              AppContents.profileDescription,
              style: AppTexts.bodyTextLarge,
            ),
          );
        }),
        const FittedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.mediumPadding),
            child: Row(
              children: [
                CustomButton(
                  icon: Icons.text_snippet_rounded,
                  text: "Get CV",
                  link:
                      "https://www.canva.com/design/DAFoT4qxCXU/8fBNTXshbHKKSSUFOwfHXw/view?utm_content=DAFoT4qxCXU&utm_campaign=designshare&utm_medium=link&utm_source=editor",
                ),
                SizedBox(
                  width: AppSizes.mediumPadding,
                ),
                CustomButton(
                  icon: Icons.email_rounded,
                  text: "Contact Me",
                  link: "mailto:sakif049@gmail.com",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
