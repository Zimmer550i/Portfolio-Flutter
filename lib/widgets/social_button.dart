import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_flutter/config/app_sizes.dart';
import 'package:portfolio_flutter/config/app_theme.dart';
import 'package:portfolio_flutter/services/analytics_service.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialButton extends StatefulWidget {
  final String imgAsset;
  final String url;
  final double size;

  const SocialButton({
    super.key,
    this.size = AppSizes.iconSizeSmall,
    required this.imgAsset,
    required this.url,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<PortfolioTheme>()!;

    return MouseRegion(
      onEnter: (_) => setState(() => isFocused = true),
      onExit: (_) => setState(() => isFocused = false),
      child: GestureDetector(
        onTap: () {
          launchUrlString(widget.url);
          AnalyticsService.logCustomEvent("Button Pressed: ${widget.url}");
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: isFocused ? theme.buttonHoverBackground : null,
            borderRadius: BorderRadius.circular(AppSizes.smallPadding),
            border: Border.all(
              width: AppSizes.smallPadding / 2,
              color: theme.cardBorder,
            ),
          ),
          padding: EdgeInsets.all(widget.size / 10),
          child: SvgPicture.asset(
            widget.imgAsset,
            width: widget.size,
            colorFilter: ColorFilter.mode(
              isFocused ? theme.buttonHoverText : theme.buttonText,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
