import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/app_contents.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:portfolio_flutter/utils/app_texts.dart';

class MainWindow extends StatefulWidget {
  const MainWindow({
    super.key,
  });

  @override
  State<MainWindow> createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width * AppSizes.webPadding;
    double height = width / AppSizes.webAspectRatio;

    return Container(
      width: width,
      height: height,
      constraints: BoxConstraints(
        maxWidth: screenSize.width,
        maxHeight: screenSize.height,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border.all(width: AppSizes.smallPadding),
        borderRadius: BorderRadius.circular(AppSizes.mediumPadding),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.mediumPadding),
        child: Column(
          children: [
            const SizedBox(
              height: AppSizes.smallPadding,
            ),
            Row(
              children: [
                ...AppContents.tabs.map((e) {
                  return tab(e);
                }),
              ],
            ),
            Transform.translate(
              offset: const Offset(0, -AppSizes.smallPadding),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius:
                      BorderRadius.circular(AppSizes.smallPadding / 2),
                ),
                height: AppSizes.smallPadding,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: AppSizes.largePadding,
            ),
            AppContents.pages[index],
          ],
        ),
      ),
    );
  }

  Widget tab(String e) {
    bool isSelected = e == AppContents.tabs[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          index = AppContents.tabs.indexOf(e);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black : AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(AppSizes.smallPadding / 2),
        ),
        padding: const EdgeInsets.only(
          left: AppSizes.mediumPadding,
          right: AppSizes.mediumPadding,
          bottom: AppSizes.smallPadding,
        ),
        child: Text(
          e,
          style: AppTexts.tabText.copyWith(
              color: isSelected ? AppColors.backgroundColor : AppColors.black),
        ),
      ),
    );
  }
}
