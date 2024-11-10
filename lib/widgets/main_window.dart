import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/app_contents.dart';
import 'package:portfolio_flutter/utils/app_sizes.dart';
import 'package:portfolio_flutter/utils/app_texts.dart';
import 'package:portfolio_flutter/utils/is_mobile.dart';

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
      constraints: BoxConstraints(
        maxWidth: height * 1.7776,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border:
            isMobile(context) ? null : Border.all(width: AppSizes.smallPadding),
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
        child: Column(
          children: [
            // const SizedBox(
            //   height: AppSizes.smallPadding,
            // ),
            tabBarTop(),
            Expanded(
              child: AppContents.pages[index],
            ),
            tabBarBottom(),
          ],
        ),
      ),
    );
  }

  Widget tabBarTop() {
    if (isMobile(context)) {
      return Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSizes.smallPadding,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...AppContents.tabs.map((e) {
                return tab(e);
              }),
            ],
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -AppSizes.smallPadding),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(AppSizes.smallPadding / 2),
            ),
            height: AppSizes.smallPadding,
            width: double.infinity,
          ),
        ),
        const SizedBox(
          height: AppSizes.mediumPadding,
        ),
      ],
    );
  }

  Widget tabBarBottom() {
    if (!isMobile(context)) {
      return Container();
    }
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            children: [
              ...AppContents.tabs.map((e) {
                return tab(e);
              }),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(AppSizes.smallPadding / 2),
          ),
          height: AppSizes.smallPadding,
          width: double.infinity,
        ),
      ],
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
        padding: EdgeInsets.only(
          left: AppSizes.mediumPadding,
          right: AppSizes.mediumPadding,
          bottom: AppSizes.smallPadding,
          top: isMobile(context) ? AppSizes.smallPadding : 0,
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
