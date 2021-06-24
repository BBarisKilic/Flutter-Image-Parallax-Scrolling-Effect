import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parallax_effect/utilities/constants.dart';

class HomePage extends StatelessWidget {
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
            child: SizedBox(
              height: Get.height * 0.40,
            ),
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
}
