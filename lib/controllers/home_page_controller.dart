import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parallax_effect/data/data.dart';
import 'package:parallax_effect/models/paintings.dart';

class HomePageController extends GetxController {
  var _paintings = <Paintings>[].obs;
  var _pageOffset = 0.0.obs;
  late PageController pageController;

  List<Paintings> get paintings => _paintings;
  double get pageOffset => _pageOffset.value;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      _pageOffset.value = pageController.page as double;
    });
  }

  @override
  void onReady() {
    super.onReady();
    createPaintingList();
  }

  @override
  void dispose() {
    pageController.removeListener(() {});
    pageController.dispose();
    super.dispose();
  }

  void createPaintingList() {
    for (int i = 0; i < data.length; i++)
      _paintings
          .add(Paintings(imagePath: data[i]["image"], name: data[i]["name"]));
  }
}
