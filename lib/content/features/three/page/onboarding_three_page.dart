import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboardingrims/content/features/three/controller/onboarding_three_controller.dart';
import 'package:onboardingrims/content/features/three/widgets/onboarding_three_pageview.dart';
import 'package:onboardingrims/content/utils/constants.dart';

class OnboardingThreePage extends StatelessWidget {

  ///Params for first page
  final String? pageFirstBottomTitle;
  final String? pageFirstTitle;
  final String? pageFirstDescription;
  final String? pageFirstImageUrl;


  ///Params for second page
  final String? pageSecondBottomTitle;
  final String? pageSecondTitle;
  final String? pageSecondDescription;
  final String? pageSecondImageUrl;

  ///Params for third page
  final String? pageThirdBottomTitle;
  final String? pageThirdTitle;
  final String? pageThirdDescription;
  final String? pageThirdImageUrl;

  ///Use this to change whole page background color
  final Color? pageBackgroundColor;

  ///Use this to change active color of page count evolution
  final Color pageCountEvolutionColor;

  ///Use this to change inactive color of page count evolution
  final Color pageCountInactiveEvolutionColor;

  ///Use this to add rounded value for all images
  final double pageRoundedImageValue;

  ///Use this to load all images from assets or network
  final bool pageUseLocalImage;

  ///Use this to change navigation buttons colors
  final Color navigationButtonColor;

  ///Button next text title
  final String? btnNextTextTitle;

  ///Button end text title
  final String? btnEndTextTitle;

  ///End button callback action
  final VoidCallback endButtonOnClick;


  OnboardingThreePage({super.key,
   this.pageFirstBottomTitle,
   this.pageFirstTitle,
   this.pageFirstImageUrl,
   this.pageFirstDescription,
   this.pageSecondBottomTitle,
   this.pageSecondTitle,
   this.pageSecondImageUrl,
   this.pageSecondDescription,
   this.pageThirdBottomTitle,
   this.pageThirdTitle,
   this.pageThirdImageUrl,
   this.pageThirdDescription,
     this.btnNextTextTitle,
     this.btnEndTextTitle,
    required this.endButtonOnClick,
    this.pageRoundedImageValue = 15,
    this.pageUseLocalImage = false,
    this.pageBackgroundColor,
    this.navigationButtonColor = Colors.white,
    this.pageCountInactiveEvolutionColor = Colors.grey,
    this.pageCountEvolutionColor = Colors.red,
  });

  final OnboardingThreeController  controller = Get.put(OnboardingThreeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: pageBackgroundColor ?? Color(0xff151E3D),
      body: SafeArea(child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
              //Page bar evolution
              Container(
                width: MediaQuery.sizeOf(context).width,
                margin: EdgeInsets.all(5),
                child: Obx(()=>Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width / 3,
                        height: 7,
                        decoration: BoxDecoration(
                          color: controller.currentPageIndex.value >=
                              threePagePositionFirst
                              ? pageCountEvolutionColor
                              : pageCountInactiveEvolutionColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width / 3,
                        height: 7,
                        decoration: BoxDecoration(
                          color: controller.currentPageIndex.value >=
                              threePagePositionSecond
                              ? pageCountEvolutionColor
                              : pageCountInactiveEvolutionColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width / 3,
                        height: 7,
                        decoration: BoxDecoration(
                          color: controller.currentPageIndex.value >=
                              threePagePositionThird
                              ? pageCountEvolutionColor
                              : pageCountInactiveEvolutionColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                )),
              ),


              Expanded(
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: controller.pageController,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (value) {
                    controller.currentPageIndex(value);
                  },
                  children: [
                    OnboardingThreePageview(
                        pageFirstTitle ?? lorem1,
                        pageFirstDescription ?? lorem2,
                        pageFirstImageUrl ?? image1,
                        pageRoundedImageValue,
                        useLocalImage: pageUseLocalImage,
                        pagePosition: threePagePositionFirst),

                    OnboardingThreePageview(
                        pageSecondTitle ?? lorem3,
                        pageSecondDescription ?? lorem4,
                        pageSecondImageUrl ?? image2,
                        pageRoundedImageValue,
                        useLocalImage: pageUseLocalImage,
                        pagePosition: threePagePositionSecond),

                    OnboardingThreePageview(
                        pageThirdTitle ?? lorem5,
                        pageThirdDescription ?? lorem6,
                        pageThirdImageUrl ?? image3,
                        pageRoundedImageValue,
                        useLocalImage: pageUseLocalImage,
                        pagePosition: threePagePositionThird),
                  ],
                )
              )

            ],
      ),),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 20
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              thickness: 1,
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Obx(()=>controller.currentPageIndex.value == threePagePositionFirst
                    ? SizedBox.shrink()
                    : IconButton(
                   padding: EdgeInsets.zero,
                    icon: Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: navigationButtonColor),
                      child: Icon(
                        Icons.keyboard_backspace_rounded,
                        size: 32,
                      ),
                    ),
                    onPressed: () {
                      if (controller.currentPageIndex.value >
                          threePagePositionFirst) {
                        controller.pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInCubic);
                      } else {
                        //Do action to leave page
                      }
                    }

                )),


                Expanded(
                  child: Obx(()=>Text(
                    controller.currentPageIndex.value == threePagePositionFirst
                        ? pageFirstBottomTitle ?? "Page title 1"
                        : controller.currentPageIndex.value ==
                        threePagePositionSecond
                        ? pageSecondBottomTitle ?? "Page title 2"
                        : controller.currentPageIndex.value ==
                        threePagePositionThird
                        ? pageThirdBottomTitle ?? "Page title 3"
                        : "Page title",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
                    textAlign: TextAlign.center,
                  ),)
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: navigationButtonColor),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      if(controller.currentPageIndex.value < threePagePositionThird){
                        controller.pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInCubic);
                      }else{
                        //Do action to leave page
                        endButtonOnClick();
                      }

                      },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Obx(()=>Text(
                        controller.currentPageIndex.value != threePagePositionThird
                            ? btnNextTextTitle ?? "Suivant"
                            : btnEndTextTitle ?? "Terminer",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
