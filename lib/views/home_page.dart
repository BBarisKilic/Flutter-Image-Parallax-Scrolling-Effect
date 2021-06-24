import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parallax_effect/controllers/home_page_controller.dart';
import 'package:parallax_effect/utilities/constants.dart';

class HomePage extends StatelessWidget {
  final HomePageController _homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(kBGPath),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: buildBody(),
        ),
      ),
    );
  }

  Padding buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 3,
            child: const Text(
              kVincentVanGoghText,
              style: kTitleStyle,
            ),
          ),
          const Expanded(
            flex: 1,
            child: const Text(
              kDateText,
              style: kNormalTextStyle,
            ),
          ),
          const Expanded(
            flex: 3,
            child: const Text(
              kExplanationText,
              style: kNormalTextStyle,
              textAlign: TextAlign.justify,
            ),
          ),
          Expanded(
            flex: 12,
            child: buildPaintingPageView(),
          ),
          const Expanded(
            flex: 1,
            child: const Align(
              alignment: Alignment.center,
              child: const Text(
                kHighlightText,
                style: kNormalTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PageView buildPaintingPageView() {
    return PageView.builder(
      itemCount: _homePageController.paintings.length,
      controller: _homePageController.pageController,
      itemBuilder: (context, i) {
        return Transform.scale(
          scale: 1,
          child: Center(
            child: Container(
              padding: const EdgeInsets.only(right: 20.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Obx(() {
                      return Image.asset(
                        _homePageController.paintings[i].imagePath as String,
                        height: Get.height * 0.40,
                        fit: BoxFit.cover,
                        alignment: Alignment(
                            -_homePageController.pageOffset.abs() + i, 0),
                      );
                    }),
                  ),
                  Positioned(
                    left: 10,
                    right: 10,
                    bottom: 20,
                    child: Text(
                      _homePageController.paintings[i].name as String,
                      style: kNormalTextStyle.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
