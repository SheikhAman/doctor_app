import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/utils/text_const.dart';
import 'package:test_app/widgets/custom_height.dart';

import '../widgets/custom_icon_button.dart';

class VideoCallPage extends StatelessWidget {
  VideoCallPage({super.key});

  var deviceHeight = Get.height;
  var deviceWidth = Get.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image
            _BackGroundImage(
                deviceHeight: deviceHeight, deviceWidth: deviceWidth),

            // foreground image + back icon
            _TopSection(deviceWidth: deviceWidth, deviceHeight: deviceHeight),

            // doctor live info
            _DoctorLiveInfo(
                deviceHeight: deviceHeight, deviceWidth: deviceWidth),

            //CustomButtonsSection
            _CustomButtonSection(
                deviceHeight: deviceHeight, deviceWidth: deviceWidth)
          ],
        ),
      ),
    );
  }
}

class _CustomButtonSection extends StatelessWidget {
  const _CustomButtonSection({
    super.key,
    required this.deviceHeight,
    required this.deviceWidth,
  });

  final double deviceHeight;
  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: deviceHeight * 0.8,
      child: SizedBox(
        width: deviceWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomIconButton(
              height: deviceWidth * 0.16,
              width: deviceWidth * 0.16,
              icon: Icons.video_call_outlined,
              ontap: () {
                debugPrint('Video call');
              },
            ),
            CustomIconButton(
              height: deviceWidth * 0.18,
              width: deviceWidth * 0.18,
              icon: Icons.call_end,
              iconColor: Colors.blueAccent,
              ontap: () {
                debugPrint('Call');
              },
            ),
            CustomIconButton(
              height: deviceWidth * 0.16,
              width: deviceWidth * 0.16,
              icon: Icons.mic_outlined,
              ontap: () {
                debugPrint('Mic');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DoctorLiveInfo extends StatelessWidget {
  const _DoctorLiveInfo({
    super.key,
    required this.deviceHeight,
    required this.deviceWidth,
  });

  final double deviceHeight;
  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: deviceHeight * 0.6,
      left: deviceWidth * 0.04,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "🔴 ",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  TextSpan(
                    text: "7:30",
                    style: text14BlackFontWeightw500,
                  ),
                ],
              ),
            ),
          ),
          CustomHeight(),
          Text(
            "Dr Aman",
            style: textWhiteSize26Fontbold,
          ),
          Text("Neurologist", style: textWhiteSize20FontBold),
        ],
      ),
    );
  }
}

class _TopSection extends StatelessWidget {
  const _TopSection({
    super.key,
    required this.deviceWidth,
    required this.deviceHeight,
  });

  final double deviceWidth;
  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: deviceWidth * 0.13,
              width: deviceWidth * 0.13,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(
                Icons.arrow_back_ios,
                size: deviceWidth * 0.05,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.2,
            width: deviceWidth * 0.3,
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  "images/doctor2.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackGroundImage extends StatelessWidget {
  const _BackGroundImage({
    super.key,
    required this.deviceHeight,
    required this.deviceWidth,
  });

  final double deviceHeight;
  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight,
      width: deviceWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'images/doctor.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
