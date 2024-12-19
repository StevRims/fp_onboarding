import 'package:flutter/material.dart';

class OnboardingThreePageview extends StatelessWidget {
  ///Page position in tree
  final int pagePosition;
  ///Page title
  final String _pageTitle;

  ///Page content description
  final String _pageDescription;

  ///Page content image
  final String _pageImageUrl;

  ///Page image rounded corner value
  final double _pageRoundedImageValue;

  ///Page image loaded from asset or from network
  final bool useLocalImage;

  const OnboardingThreePageview(this._pageTitle, this._pageDescription,
      this._pageImageUrl, this._pageRoundedImageValue,
      {super.key, required this.pagePosition, this.useLocalImage = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.only(top : 24),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Text(
              _pageTitle,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),


          Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: MediaQuery.sizeOf(context).height * 0.5,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_pageRoundedImageValue),
              image: DecorationImage(
                  image: useLocalImage
                      ? AssetImage(_pageImageUrl)
                      : NetworkImage(_pageImageUrl),
                  fit: BoxFit.cover),
            ),
          ),

          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              margin: EdgeInsets.only(top: 10),
              child: Text(
                _pageDescription,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
