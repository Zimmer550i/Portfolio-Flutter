import 'package:flutter/material.dart';
import 'package:portfolio_flutter/config/app_contents.dart';
import 'package:portfolio_flutter/config/app_sizes.dart';
import 'package:portfolio_flutter/config/app_texts.dart';
import 'package:portfolio_flutter/config/app_theme.dart';
import 'package:portfolio_flutter/utils/responsive.dart';
import 'package:portfolio_flutter/widgets/settings_overlay.dart';

class MainWindow extends StatefulWidget {
  const MainWindow({super.key});

  @override
  State<MainWindow> createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context).extension<PortfolioTheme>()!;
    late double width, height;

    if (isMobile(context)) {
      width = screenSize.width;
      height = screenSize.height;
    } else {
      width = screenSize.width * AppSizes.webPadding;
      height = screenSize.height * AppSizes.webPadding;
    }

    return Container(
      width: width,
      height: height,
      constraints: BoxConstraints(maxWidth: height * 1.7776),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.mediumPadding),
      ),
      child: Padding(
        padding: isMobile(context)
            ? const EdgeInsets.only(
                bottom: AppSizes.smallPadding,
                left: AppSizes.mediumPadding,
                right: AppSizes.mediumPadding,
              )
            : const EdgeInsets.all(AppSizes.mediumPadding),
        child: Stack(
          children: [
            Column(
              children: [
                _tabBarTop(theme),
                Expanded(child: AppContents.pages[index]),
                _tabBarBottom(theme),
              ],
            ),
            if (!isMobile(context))
              const Positioned(
                bottom: AppSizes.smallPadding,
                right: AppSizes.smallPadding,
                child: SettingsOverlay(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _tabBarTop(PortfolioTheme theme) {
    if (isMobile(context)) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSizes.smallPadding),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: AppContents.tabs.map((e) => _tab(e, theme)).toList(),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -AppSizes.smallPadding),
          child: Container(
            decoration: BoxDecoration(
              color: theme.dividerColor,
              borderRadius: BorderRadius.circular(AppSizes.smallPadding / 2),
            ),
            height: AppSizes.smallPadding,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: AppSizes.mediumPadding),
      ],
    );
  }

  Widget _tabBarBottom(PortfolioTheme theme) {
    if (!isMobile(context)) return const SizedBox.shrink();
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            children: AppContents.tabs.map((e) => _tab(e, theme)).toList(),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: theme.dividerColor,
            borderRadius: BorderRadius.circular(AppSizes.smallPadding / 2),
          ),
          height: AppSizes.smallPadding,
          width: double.infinity,
        ),
      ],
    );
  }

  Widget _tab(String e, PortfolioTheme theme) {
    final isSelected = e == AppContents.tabs[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          index = AppContents.tabs.indexOf(e);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? theme.tabSelectedBackground : theme.tabBackground,
          borderRadius: BorderRadius.circular(AppSizes.smallPadding / 2),
        ),
        padding: EdgeInsets.only(
          left: AppSizes.mediumPadding,
          right: AppSizes.mediumPadding,
          bottom: AppSizes.smallPadding,
          top: isMobile(context) ? AppSizes.smallPadding : 0,
        ),
        child: Text(
          e,
          style: AppTexts.tabText(context).copyWith(
            color: isSelected ? theme.tabSelectedText : theme.tabText,
          ),
        ),
      ),
    );
  }
}
