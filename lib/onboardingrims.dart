library onboardingrims;

import 'package:flutter/material.dart';
import 'package:onboardingrims/content/features/single/page/onboarding_single_page.dart';

import 'content/features/three/page/onboarding_three_page.dart';



class OnboardingRims extends StatelessWidget {


  ///Display a single onboarding page
  final bool isSinglePage;

  ///Display three pages for the onboarding
  final bool isThreePage;


  ///Single page first button callback action
  final VoidCallback singleFirstButtonOnClick;

  ///Single page first button callback action
  final VoidCallback singleSecondButtonOnClick;



  const OnboardingRims({
    super.key,
    this.isSinglePage = true,
    this.isThreePage = false,
    required this.singleFirstButtonOnClick,
    required this.singleSecondButtonOnClick,
  });

  @override
  Widget build(BuildContext context) {
    return isSinglePage
        ? OnboardingSinglePage(
      onFirstButtonClick: singleFirstButtonOnClick,
      onSecondButtonClick: singleSecondButtonOnClick,
      roundedValue: 25,
      showScrollNavigationButtons: false,
    )
        : isThreePage
        ? OnboardingThreePage()
        : SizedBox.shrink();
  }
}