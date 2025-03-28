
part of '../../onboardingrims.dart';



class EntryPoint extends StatelessWidget {

  ///Display a single onboarding page
  final bool isSinglePage;

  ///Display three pages for the onboarding
  final bool isThreePage;


  ///Single page first button callback action
  final VoidCallback singleFirstButtonOnClick;

  ///Single page first button callback action
  final VoidCallback singleSecondButtonOnClick;

  ///Single page button textStyle
  final TextStyle singleButtonTextStyle;


  const EntryPoint({super.key,
    this.isSinglePage = true,
    this.isThreePage = false,
    required this.singleFirstButtonOnClick,
    required this.singleSecondButtonOnClick,
    required this.singleButtonTextStyle
  });

  @override
  Widget build(BuildContext context) {
    return isSinglePage
        ? OnboardingSinglePage(
      onFirstButtonClick: singleFirstButtonOnClick,
      onSecondButtonClick: singleSecondButtonOnClick,
      buttonsTextStyle: singleButtonTextStyle,
      roundedValue: 25,
      showScrollNavigationButtons: false,
    )
        : isThreePage
        ? OnboardingThreePage(
      endButtonOnClick: (){

      },
    )
        : SizedBox.shrink();
  }
}
