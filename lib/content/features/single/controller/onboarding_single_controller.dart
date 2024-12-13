import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingSingleController extends GetxController{

  final ScrollController rowScrollController = ScrollController();
  final PageController pageController = PageController(initialPage: 0);
  var currentScrollPosition = 0.0;

  var currentPage = 0.obs;
}