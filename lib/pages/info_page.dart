import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/app_contents.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:portfolio_flutter/utils/app_texts.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth < constraints.maxHeight){
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
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
        Text(
          "Education:",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Daffodil International University",
                style: AppTexts.bodyTextLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Computer Science and Engineering",
                style: AppTexts.bodyText,
              ),
              Text(
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
        Text(
          "Skills:",
          style: AppTexts.heading,
        ),
        SizedBox(
          height: AppSizes.smallPadding,
        ),
        Padding(
          padding: EdgeInsets.only(left: AppSizes.largePadding),
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
                          "icons/arrow_forward.svg",
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
    return Column(
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
          padding: const EdgeInsets.only(
            left: AppSizes.largePadding,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.email_rounded),
                  const SizedBox(
                    width: AppSizes.mediumPadding,
                  ),
                  Text(
                    "sakif049@gmail.com",
                    style: AppTexts.bodyText,
                  ),
                ],
              ),
              const SizedBox(
                height: AppSizes.mediumPadding,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_pin,

                  ),
                  const SizedBox(
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
