import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:portfolio_flutter/utils/app_texts.dart';
import 'package:portfolio_flutter/utils/log_event.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CustomButton extends StatefulWidget {
  final IconData? icon;
  final String? svgPath;
  final String? text;
  final String? link;
  const CustomButton({
    super.key,
    this.icon,
    this.text,
    this.link,
    this.svgPath,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isFocused = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isFocused = true;
        });
      },
      onExit: (event) {
        setState(() {
          isFocused = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          if (widget.link != null) {
            launchUrlString(widget.link!);
          }
          logCustomEvent("Button Pressed: ${widget.text}", extra: widget.link);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.mediumPadding,
              vertical: AppSizes.smallPadding / 2),
          decoration: BoxDecoration(
            border: Border.all(width: AppSizes.smallPadding / 2),
            borderRadius: BorderRadius.circular(AppSizes.smallPadding),
            color: isFocused ? AppColors.black : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.icon == null
                  ? Container()
                  : Icon(
                      widget.icon,
                      color: isFocused
                          ? AppColors.backgroundColor
                          : AppColors.black,
                    ),
              widget.svgPath == null
                  ? Container()
                  : SvgPicture.asset(
                      widget.svgPath!,
                      height: AppSizes.iconSizeSmall,
                      // ignore: deprecated_member_use
                      color: isFocused
                          ? AppColors.backgroundColor
                          : AppColors.black,
                    ),
              const SizedBox(
                width: AppSizes.mediumPadding,
              ),
              Text(
                widget.text ?? "",
                style: AppTexts.bodyTextLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color:
                      isFocused ? AppColors.backgroundColor : AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
