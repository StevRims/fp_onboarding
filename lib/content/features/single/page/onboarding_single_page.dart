import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboardingrims/content/features/single/controller/onboarding_single_controller.dart';
import 'package:onboardingrims/content/features/single/widgets/onboarding_single_buttons.dart';
import 'package:onboardingrims/content/features/single/widgets/onboarding_single_pageview.dart';
import 'package:onboardingrims/content/utils/constants.dart';

class OnboardingSinglePage extends StatelessWidget {


  ///Use that one to display welcome text
  final String? welcomeText;

  ///Use these one to update border round value for images and buttons
  final double roundedValue;

  ///Use these one to display buttons texts
  final String? onboardingFirstButtonText;
  final String? onboardingSecondButtonText;

  ///CallBack action when taping on first button
  final VoidCallback onFirstButtonClick;
  ///CallBack action when taping on second button
  final VoidCallback onSecondButtonClick;


  ///Use that one to set background color for first button
  final Color? firstButtonBackgroundColor;
  ///Use that one to set color for first button text
  final Color? firstButtonTextColor;
  ///Use that one to set color for second button text
  final Color? secondButtonTextColor;
  ///Use that one to set color for second button border
  final Color? secondButtonBorderColor;
  ///Use that one to set color for the whole page
  final Color? pageColor;
  ///Use that one to set color for the presentation texts
  final Color? textColor;
  ///Use that one to set color for the navigation icons
  final Color? navIconColor;


  ///Use these one to display presentation texts and images
  final String? onboardingTextFirst;
  final String? onboardingImageFirst;
  final String? onboardingTextSecond;
  final String? onboardingImageSecond;
  final String? onboardingTextThree;
  final String? onboardingImageThree;

  ///Use that one to display navigation buttons
  final bool showScrollNavigationButtons;

  OnboardingSinglePage({
    super.key,
    this.welcomeText,
    required this.onFirstButtonClick,
    required this.onSecondButtonClick,
    this.roundedValue = 5,
    this.onboardingFirstButtonText,
    this.onboardingSecondButtonText,
    this.firstButtonBackgroundColor,
    this.firstButtonTextColor,
    this.secondButtonTextColor,
    this.secondButtonBorderColor,
    this.pageColor,
    this.textColor,
    this.navIconColor = Colors.white,
    this.showScrollNavigationButtons = true,
    this.onboardingTextFirst,
    this.onboardingImageFirst,
    this.onboardingTextSecond,
    this.onboardingImageSecond,
    this.onboardingTextThree,
    this.onboardingImageThree,
  });

  final OnBoardingSingleController controller =
      Get.put(OnBoardingSingleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageColor ?? Color(0xff151E3D),
      body: Column(
        spacing: 12,
        children: [

          Expanded(
            flex: 4,
            child: OnboardingSinglePageView(
                roundedValue: roundedValue,
                pageColor: pageColor,
                textColor: textColor,
                navIconColor: navIconColor,
                onboardingTextFirst: onboardingTextFirst,
                onboardingImageFirst: onboardingImageFirst,
                onboardingTextSecond: onboardingTextSecond,
                onboardingImageSecond: onboardingImageSecond,
                onboardingTextThree: onboardingTextThree,
                onboardingImageThree: onboardingImageThree,
                showScrollNavigationButtons: showScrollNavigationButtons),
          ),

          Divider(),

          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.09),
            width: MediaQuery.sizeOf(context).width,
            child: Text(welcomeText ?? lorem1,
              style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ), textAlign: TextAlign.center,),
          ),

          SizedBox(height: 10,),

          //buttons
          Expanded(
            flex: 1,
            child: OnboardingSingleButtons(
                roundedValue: roundedValue,
                onboardingFirstButtonText: onboardingFirstButtonText,
                firstButtonTextColor: firstButtonTextColor,
                firstButtonBackgroundColor: firstButtonBackgroundColor,
                onFirstButtonClick: onFirstButtonClick,
                secondButtonTextColor: secondButtonTextColor,
                secondButtonBorderColor: secondButtonBorderColor,
                onboardingSecondButtonText: onboardingSecondButtonText,
                onSecondButtonClick: onSecondButtonClick),
          )
        ],
      ),
    );
  }
}
