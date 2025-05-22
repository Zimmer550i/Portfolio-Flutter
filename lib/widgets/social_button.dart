import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../utils/log_event.dart';

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
          launchUrlString(widget.url);
          logCustomEvent("Button Pressed: ${widget.url}");
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: isFocused ? AppColors.black : null,
            borderRadius: BorderRadius.circular(AppSizes.smallPadding),
            border: Border.all(
              width: AppSizes.smallPadding / 2,
            ),
          ),
          padding: EdgeInsets.all(widget.size / 10),
          child: SvgPicture.asset(
            widget.imgAsset,
            width: widget.size,
            // ignore: deprecated_member_use
            color: isFocused ? AppColors.backgroundColor : AppColors.black,
          ),
        ),
      ),
    );
  }
}
