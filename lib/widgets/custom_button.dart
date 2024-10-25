import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:portfolio_flutter/utils/app_texts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.mediumPadding),
      decoration: BoxDecoration(
        border: Border.all(width: AppSizes.smallPadding / 2),
        borderRadius: BorderRadius.circular(AppSizes.smallPadding),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.email_outlined),
          const SizedBox(
            width: AppSizes.mediumPadding,
          ),
          Text(
            "Contact Me",
            style: AppTexts.bodyTextLarge
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
