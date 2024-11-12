import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_flutter/utils/app_contents.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:portfolio_flutter/utils/app_texts.dart';
import 'package:portfolio_flutter/utils/is_mobile.dart';
import 'package:portfolio_flutter/widgets/info_structure.dart';

class InfoPage extends StatelessWidget {
  static bool loggedOnce = false;
  const InfoPage({super.key});

  void logScreenEvent() async {
    await FirebaseAnalytics.instance
        .logScreenView(screenName: "Project Screen");
  }

  @override
  Widget build(BuildContext context) {
    if (!loggedOnce) {
      logScreenEvent();
      loggedOnce = true;
    }
    return LayoutBuilder(builder: (context, constraints) {
      if (isMobile(context)) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: AppSizes.largePadding,
              ),
              aboutMe(),
              const SizedBox(
                height: AppSizes.largePadding,
              ),
              skills(),
              const SizedBox(
                height: AppSizes.largePadding,
              ),
              InfoStructure(
                title: "I've Worked With:",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    technologies(),
                    const SizedBox(
                      height: AppSizes.mediumPadding,
                    ),
                    languages(),
                  ],
                ),
              ),
              const SizedBox(
                height: AppSizes.largePadding,
              ),
              education(),
              const SizedBox(
                height: AppSizes.largePadding,
              ),
              contactInfo(),
              const SizedBox(
                height: AppSizes.largePadding,
              ),
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
                  children: [
                    Expanded(flex: 3, child: aboutMe()),
                    const SizedBox(
                      width: AppSizes.largePadding,
                    ),
                    Expanded(flex: 2, child: skills()),
                  ],
                ),
                const SizedBox(
                  height: AppSizes.largePadding,
                ),
                workedWith(),
                const SizedBox(
                  height: AppSizes.largePadding,
                ),
                Row(
                  children: [
                    Expanded(flex: 3, child: education()),
                    const SizedBox(
                      width: AppSizes.largePadding,
                    ),
                    Expanded(flex: 2, child: contactInfo()),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  workedWith() {
    return InfoStructure(
      title: "I've Worked With",
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: technologies(),
          ),
          const SizedBox(
            width: AppSizes.largePadding,
          ),
          Expanded(
            child: languages(),
          ),
          // const SizedBox(
          //   width: AppSizes.largePadding,
          // ),
          // Expanded(
          //   child: InfoStructure(
          //     title: "Tools",
          //     isSubTitle: true,
          //     child: Wrap(
          //       spacing: AppSizes.smallPadding,
          //       runSpacing: AppSizes.smallPadding,
          //       children: [
          //         Image.asset("assets/logos/git.png", height: 36),
          //         Image.asset("assets/logos/xampp.png", height: 36),
          //         Image.asset("assets/logos/docker.png", height: 36),
          //         Image.asset("assets/logos/cpanel.png", height: 36, width: 72,),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  InfoStructure languages() {
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
          Image.asset(
            "assets/logos/php.png",
            height: 36,
            filterQuality: FilterQuality.high,
          ),
          Image.asset("assets/logos/bash.png", height: 36),
          Image.asset("assets/logos/dart.png", height: 36),
          Image.asset("assets/logos/sql.png", height: 36),
        ],
      ),
    );
  }

  InfoStructure technologies() {
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
          Image.asset(
            "assets/logos/cpanel.png",
            height: 36,
            width: 72,
          ),
          Transform.translate(
              offset: const Offset(0, -18),
              child: Image.asset("assets/logos/lamp.png", height: 48)),
        ],
      ),
    );
  }

  aboutMe() {
    return const InfoStructure(
      title: "About Me",
      child: Text(
        AppContents.detailedDescription,
        style: AppTexts.bodyTextLarge,
      ),
    );
  }

  education() {
    return InfoStructure(
      title: "Education",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Daffodil International University",
            style: AppTexts.bodyTextLarge.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Computer Science and Engineering",
            style: AppTexts.bodyText,
          ),
          const Text(
            "Graduation: Dec 2024",
            style: AppTexts.bodyText,
          ),
        ],
      ),
    );
  }

  skills() {
    return InfoStructure(
      title: "Skills",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...AppContents.skills.map(
            (e) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSizes.mediumPadding),
                child: Row(
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
                      e,
                      style: AppTexts.bodyTextLarge,
                    )),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  contactInfo() {
    return const InfoStructure(
      title: "Contact",
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.email_rounded),
              SizedBox(
                width: AppSizes.mediumPadding,
              ),
              Text(
                "sakif049@gmail.com",
                style: AppTexts.bodyText,
              ),
            ],
          ),
          SizedBox(
            height: AppSizes.mediumPadding,
          ),
          Row(
            children: [
              Icon(
                Icons.location_pin,
              ),
              SizedBox(
                width: AppSizes.mediumPadding,
              ),
              Text(
                "Dhaka, Bangladesh",
                style: AppTexts.bodyText,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
