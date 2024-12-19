import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingThreeController extends GetxController{

  var currentPageIndex = 0.obs;
  PageController pageController = PageController(
    initialPage: 0,);
}