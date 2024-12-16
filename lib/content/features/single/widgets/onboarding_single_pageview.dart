import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboardingrims/content/features/single/controller/onboarding_single_controller.dart';

import '../../../utils/constants.dart';

class OnboardingSinglePageView extends GetView<OnBoardingSingleController> {


  ///Use these one to update border round value for images and buttons
  final double _roundedValue;

  ///Use that one to set color for the presentation texts
  final Color? _textColor;
  ///Use that one to set color for the navigation icons
  final Color? _navIconColor;


  ///Use these one to display presentation texts and images
  final String? _onboardingTextFirst;
  final String? _onboardingImageFirst;
  final String? _onboardingTextSecond;
  final String? _onboardingImageSecond;
  final String? _onboardingTextThree;
  final String? _onboardingImageThree;

  ///Use that one to display navigation buttons
  final bool _showScrollNavigationButtons;

  ///Use that one to choose whether local or network images
  final bool _useLocalImages;

  const OnboardingSinglePageView(
      this._roundedValue,
      this._textColor,
      this._navIconColor,
      this._onboardingTextFirst,
      this._onboardingImageFirst,
      this._onboardingTextSecond,
      this._onboardingImageSecond,
      this._onboardingTextThree,
      this._onboardingImageThree,
      this._useLocalImages,
      this._showScrollNavigationButtons,
      {super.key});

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
                physics: _showScrollNavigationButtons
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
                          _onboardingTextFirst ?? lorem1,
                          style: TextStyle(
                            color: _textColor ?? Colors.white,
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
                            borderRadius: BorderRadius.circular(_roundedValue),
                            image: DecorationImage(
                                image: _useLocalImages ?
                                  AssetImage(_onboardingImageFirst!)
                                : NetworkImage( _onboardingImageFirst ?? image1),
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
                          _onboardingTextSecond ??  lorem2,
                          style: TextStyle(
                            color: _textColor ?? Colors.white,
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
                            borderRadius: BorderRadius.circular(_roundedValue),
                            image: DecorationImage(
                                image: _useLocalImages ?
                                AssetImage(_onboardingImageFirst!)
                                    : NetworkImage( _onboardingImageSecond ?? image2),
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
                          _onboardingTextThree ?? lorem3,
                          style: TextStyle(
                            color: _textColor ?? Colors.white,
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
                            borderRadius: BorderRadius.circular(_roundedValue),
                            image: DecorationImage(
                                image: _useLocalImages ?
                                AssetImage(_onboardingImageFirst!)
                                    : NetworkImage(_onboardingImageThree ?? image3),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              _showScrollNavigationButtons
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
                        color: _navIconColor!.withValues(
                          alpha: 100,
                        ),
                      ),
                    )),
              )
                  : SizedBox.shrink(),
              _showScrollNavigationButtons
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
                        color: _navIconColor!.withValues(
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
                    ? _navIconColor
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
                    ? _navIconColor
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
                    ? _navIconColor
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
