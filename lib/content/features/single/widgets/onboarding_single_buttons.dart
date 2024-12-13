import 'package:flutter/material.dart';

class OnboardingSingleButtons extends StatelessWidget {


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


  const OnboardingSingleButtons({super.key,
  required this.roundedValue,
  required this.onboardingFirstButtonText,
  required this.firstButtonTextColor,
  required this.firstButtonBackgroundColor,
  required this.onFirstButtonClick,
  required this.secondButtonTextColor,
  required this.secondButtonBorderColor,
  required this.onboardingSecondButtonText,
  required this.onSecondButtonClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.09),
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(roundedValue)),
                ),
                child: Text(onboardingFirstButtonText ?? "Lorem ipsum",
                  style: TextStyle(
                    fontSize: 18,
                    color: firstButtonTextColor ?? Color(0xff151E3D),
                  ),)
            ),
          ),


          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: TextButton(
                onPressed: () {

                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(roundedValue)
                    ),
                    side: BorderSide(width: 1, color: Colors.white)),
                child: Text(onboardingSecondButtonText ?? "Sit amet",
                  style: TextStyle(
                    fontSize: 18,
                    color: secondButtonTextColor ?? Colors.white,
                  ),)),
          )
        ],
      ),
    );
  }
}
