import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_flutter/config/app_sizes.dart';
import 'package:portfolio_flutter/config/app_texts.dart';
import 'package:portfolio_flutter/config/app_theme.dart';
import 'package:portfolio_flutter/services/analytics_service.dart';
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
    final theme = Theme.of(context).extension<PortfolioTheme>()!;

    return MouseRegion(
      onEnter: (_) => setState(() => isFocused = true),
      onExit: (_) => setState(() => isFocused = false),
      child: GestureDetector(
        onTap: () {
          if (widget.link != null) {
            launchUrlString(widget.link!);
          }
          AnalyticsService.logCustomEvent(
            "Button Pressed: ${widget.text}",
            extra: widget.link,
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.mediumPadding,
            vertical: AppSizes.smallPadding / 2,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: AppSizes.smallPadding / 2,
              color: theme.cardBorder,
            ),
            borderRadius: BorderRadius.circular(AppSizes.smallPadding),
            color: isFocused ? theme.buttonHoverBackground : theme.buttonBackground,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  color: isFocused ? theme.buttonHoverText : theme.buttonText,
                ),
              if (widget.svgPath != null)
                SvgPicture.asset(
                  widget.svgPath!,
                  height: AppSizes.iconSizeSmall,
                  colorFilter: ColorFilter.mode(
                    isFocused ? theme.buttonHoverText : theme.buttonText,
                    BlendMode.srcIn,
                  ),
                ),
              const SizedBox(width: AppSizes.mediumPadding),
              Text(
                widget.text ?? "",
                style: AppTexts.bodyTextLarge(context).copyWith(
                  fontWeight: FontWeight.bold,
                  color: isFocused ? theme.buttonHoverText : theme.buttonText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
