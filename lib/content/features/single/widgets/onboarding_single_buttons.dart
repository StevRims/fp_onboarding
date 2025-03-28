import 'package:flutter/material.dart';

class OnboardingSingleButtons extends StatelessWidget {


  ///Use these one to update border round value for images and buttons
  final double _roundedValue;

  ///Use these one to display buttons texts
  final String? _onboardingFirstButtonText;
  final String? _onboardingSecondButtonText;

  ///CallBack action when taping on first button
  final VoidCallback _onFirstButtonClick;
  ///CallBack action when taping on second button
  final VoidCallback _onSecondButtonClick;


  ///Use that one to set background color for first button
  final Color? _firstButtonBackgroundColor;
  ///Use that one to set color for first button text
  final Color? _firstButtonTextColor;
  ///Use that one to set color for second button text
  final Color? _secondButtonTextColor;
  ///Use that one to set color for second button border
  final Color? _secondButtonBorderColor;

  ///Use that one to set text style for all buttons
  final TextStyle? _buttonsTextStyle;


  const OnboardingSingleButtons(
   this._roundedValue,
   this._onboardingFirstButtonText,
   this._firstButtonTextColor,
   this._firstButtonBackgroundColor,
   this._onFirstButtonClick,
   this._secondButtonTextColor,
   this._secondButtonBorderColor,
   this._onboardingSecondButtonText,
   this._onSecondButtonClick,
   this._buttonsTextStyle,

      {super.key}
  );

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
                onPressed: _onFirstButtonClick,
                style: ElevatedButton.styleFrom(
                  textStyle: _buttonsTextStyle,
                  backgroundColor: _firstButtonBackgroundColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_roundedValue)),
                ),
                child: Text(_onboardingFirstButtonText ?? "Lorem ipsum",
                  style: TextStyle(
                    fontSize: 18,
                    color: _firstButtonTextColor ?? Color(0xff151E3D),
                  ),)
            ),
          ),

          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: TextButton(
                onPressed: _onSecondButtonClick,
                style: TextButton.styleFrom(
                    textStyle: _buttonsTextStyle,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(_roundedValue)
                    ),
                    side: BorderSide(width: 1, color: _secondButtonBorderColor ?? Colors.white)),
                child: Text(_onboardingSecondButtonText ?? "Sit amet",
                  style: TextStyle(
                    fontSize: 18,
                    color: _secondButtonTextColor ?? Colors.white,
                  ),)),
          )
        ],
      ),
    );
  }
}
