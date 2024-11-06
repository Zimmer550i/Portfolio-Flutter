import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_flutter/utils/app_contents.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:portfolio_flutter/utils/app_texts.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < constraints.maxHeight) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              leftInfoWindow(),
              const SizedBox(
                height: AppSizes.largePadding,
              ),
              rightInfoWindow(),
            ],
          ),
        );
      }
      return SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: leftInfoWindow(),
            ),
            const SizedBox(
              width: AppSizes.largePadding,
            ),
            Expanded(
              child: rightInfoWindow(),
            ),
          ],
        ),
      );
    });
  }

  leftInfoWindow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        aboutMe(),
        const SizedBox(
          height: AppSizes.largePadding,
        ),
        education(),
      ],
    );
  }

  rightInfoWindow() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        skills(),
        const SizedBox(
          height: AppSizes.largePadding,
        ),
        contactInfo(),
      ],
    );
  }

  aboutMe() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About Me:",
          style: AppTexts.heading,
        ),
        SizedBox(
          height: AppSizes.smallPadding,
        ),
        Padding(
          padding: EdgeInsets.only(left: AppSizes.largePadding),
          child: Text(
            AppContents.detailedDescription,
            style: AppTexts.bodyTextLarge,
          ),
        ),
      ],
    );
  }

  education() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Education:",
          style: AppTexts.heading,
        ),
        const SizedBox(
          height: AppSizes.smallPadding,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: AppSizes.largePadding,
          ),
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
        ),
      ],
    );
  }

  skills() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Skills:",
          style: AppTexts.heading,
        ),
        const SizedBox(
          height: AppSizes.smallPadding,
        ),
        Padding(
          padding: const EdgeInsets.only(left: AppSizes.largePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...AppContents.skills.map(
                (e) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: AppSizes.mediumPadding),
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
        ),
      ],
    );
  }

  contactInfo() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact:",
          style: AppTexts.heading,
        ),
        SizedBox(
          height: AppSizes.smallPadding,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: AppSizes.largePadding,
          ),
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
        ),
      ],
    );
  }
}
