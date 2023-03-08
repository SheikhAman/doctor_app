import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomWidth extends StatelessWidget {
  CustomWidth({super.key});

  var deviceWidth = Get.width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth * 0.01,
    );
  }
}
