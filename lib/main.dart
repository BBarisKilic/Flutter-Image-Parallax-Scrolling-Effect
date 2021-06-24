import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parallax_effect/views/home_page.dart';

void main() {
  runApp(ParallaxEffectApp());
}

class ParallaxEffectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "timesBold"),
      home: HomePage(),
    );
  }
}
