import 'package:flutter/material.dart';

import '../utils/text_const.dart';

class CustomColumn extends StatelessWidget {
  final String title, subtitle;
  const CustomColumn({
    required this.title,
    required this.subtitle,
    super.key,
    required this.deviceHeight,
  });

  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: deviceHeight * 0.01,
        ),
        Text(
          subtitle.toString(),
          style: text16White70,
        ),
      ],
    );
  }
}
