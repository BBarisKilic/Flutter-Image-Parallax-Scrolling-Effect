import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parallax_effect/data/data.dart';
import 'package:parallax_effect/models/paintings.dart';

class HomePageController extends GetxController {
  var _paintings = <Paintings>[].obs;
  var pageController;

  List<Paintings> get paintings => _paintings;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(viewportFraction: 0.7);
  }

  @override
  void onReady() {
    super.onReady();
    createPaintingList();
  }

  void createPaintingList() {
    for (int i = 0; i < data.length; i++)
      _paintings
          .add(Paintings(imagePath: data[i]["image"], name: data[i]["name"]));
  }
}
