import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomHeight extends StatelessWidget {
  CustomHeight({super.key});

  var deviceHeight = Get.height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight * 0.01,
    );
  }
}
