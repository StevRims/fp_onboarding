import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboardingrims/content/features/single/controller/onboarding_single_controller.dart';

import '../../../utils/constants.dart';

class OnboardingSinglePageView extends GetView<OnBoardingSingleController> {


  ///Use these one to update border round value for images and buttons
  final double roundedValue;

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

  const OnboardingSinglePageView({super.key,
  required this.roundedValue,
  required this.pageColor,
  required this.textColor,
  required this.navIconColor,
  required this.onboardingTextFirst,
  required this.onboardingImageFirst,
  required this.onboardingTextSecond,
  required this.onboardingImageSecond,
  required this.onboardingTextThree,
  required this.onboardingImageThree,
  required this.showScrollNavigationButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 20),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: Stack(
            children: [
              PageView(
                physics: showScrollNavigationButtons
                    ? NeverScrollableScrollPhysics()
                    : PageScrollPhysics(),
                controller: controller.pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  controller.currentPage(value);
                },
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        margin: EdgeInsets.all(10),
                        child: Text(
                          onboardingTextFirst ?? lorem1,
                          style: TextStyle(
                            color: textColor ?? Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(roundedValue),
                            image: DecorationImage(
                                image: NetworkImage( onboardingImageFirst ?? image1),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        margin: EdgeInsets.all(10),
                        child: Text(
                          onboardingTextSecond ??  lorem2,
                          style: TextStyle(
                            color: textColor ?? Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(roundedValue),
                            image: DecorationImage(
                                image: NetworkImage( onboardingImageSecond ?? image2),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        margin: EdgeInsets.all(10),
                        child: Text(
                          onboardingTextThree ?? lorem3,
                          style: TextStyle(
                            color: textColor ?? Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(roundedValue),
                            image: DecorationImage(
                                image: NetworkImage(onboardingImageThree ?? image3),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              showScrollNavigationButtons
                  ? Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                child: InkWell(
                    onTap: () {
                      controller.pageController.previousPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeIn);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_circle_left,
                        size: 48,
                        color: navIconColor!.withValues(
                          alpha: 100,
                        ),
                      ),
                    )),
              )
                  : SizedBox.shrink(),
              showScrollNavigationButtons
                  ? Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                child: InkWell(
                    onTap: () {

                      controller.pageController.nextPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeOut);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_circle_right,
                        size: 48,
                        color: navIconColor!.withValues(
                          alpha: 100,
                        ),
                      ),
                    )),
              )
                  : SizedBox.shrink(),
            ],
          ),
        ),

        SizedBox(height: 10,),

        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: controller.currentPage.value == 0
                    ? navIconColor
                    : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 10,
              height: 10,
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: controller.currentPage.value == 1
                    ? navIconColor
                    : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 10,
              height: 10,
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: controller.currentPage.value == 2
                    ? navIconColor
                    : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ],
        )),
      ],
    );
  }
}
