import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/date_model_controller.dart';
import 'package:test_app/controller/time_model_controller.dart';
import 'package:test_app/pages/video_call_page.dart';
import 'package:test_app/widgets/custom_height.dart';
import 'package:test_app/widgets/custom_width.dart';

import '../utils/text_const.dart';
import '../widgets/custom_column_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var deviceHeight = Get.height;
  var deviceWidth = Get.width;
  final String longText =
      'This is a long text that will be truncated after 3 lines. '
      'When the "more" text is tapped, the user will be taken to '
      'another page that shows the full text.';

  var controller = Get.put(DateModelController());
  var timeController = Get.put(TimeModelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Doctor card section heigt: 3.8

              Container(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                height: deviceHeight * 0.38,
                width: deviceWidth,
                decoration: const BoxDecoration(
                  color: Color(0xff0957df),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: deviceHeight * 0.02,
                    ),
                    _DoctorInfo(
                      deviceHeight: deviceHeight,
                      deviceWidth: deviceWidth,
                    ),
                    SizedBox(
                      height: deviceHeight * 0.02,
                    ),
                    SizedBox(
                      height: deviceHeight * 0.12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomColumn(
                            deviceHeight: deviceHeight,
                            title: "100",
                            subtitle: "Reviews",
                          ),
                          CustomColumn(
                            deviceHeight: deviceHeight,
                            title: "10",
                            subtitle: "Years exp.",
                          ),
                          CustomColumn(
                            deviceHeight: deviceHeight,
                            title: "1550",
                            subtitle: "Petients",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              //Demography height: 1.7
              _Demography(deviceHeight: deviceHeight, longText: longText),

              // Schedules height: 1.7
              SizedBox(
                height: deviceHeight * 0.17,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Schedules",
                        style: text18BlackBold,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: SizedBox(
                          height: deviceHeight * 0.1,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.dateModelList.length,
                            itemBuilder: (context, index) {
                              final value = controller.dateModelList[index];
                              return InkWell(
                                onTap: () {
                                  controller.setOnTap(index);
                                },
                                child: Obx(
                                  () => Card(
                                    shape: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
                                    elevation: 2.0,
                                    child: Container(
                                      height: deviceHeight * 0.1,
                                      width: deviceWidth * 0.14,
                                      decoration: BoxDecoration(
                                        color: controller.onTap.value == index
                                            ? const Color(0xffa9e48e)
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            value.week.toString(),
                                            style:
                                                controller.onTap.value == index
                                                    ? text14WhiteFontWeightw500
                                                    : text14BlackFontWeightw500,
                                          ),
                                          CustomHeight(),
                                          Text(
                                            value.date.toString(),
                                            style:
                                                controller.onTap.value == index
                                                    ? text14WhiteFontWeightw500
                                                    : text14BlackFontWeightw500,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Choose time height: 1.3
              SizedBox(
                height: deviceHeight * 0.13,
                width: deviceWidth,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose Time",
                        style: text18BlackBold,
                      ),
                      SizedBox(
                        height: deviceHeight * 0.07,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: timeController.timeList.length,
                          itemBuilder: (context, index) {
                            final time = timeController.timeList[index].time;
                            return Obx(
                              () => InkWell(
                                onTap: () {
                                  timeController.setOnTap(index);
                                },
                                child: Card(
                                  elevation: 2.0,
                                  color: timeController.onTimeTap.value == index
                                      ? Color(0xffa9e48e)
                                      : Colors.white,
                                  shape: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0),
                                      child: Text(
                                        time.toString(),
                                        style: timeController.onTimeTap.value ==
                                                index
                                            ? text14WhiteFontWeightw500
                                            : text14BlackFontWeightw500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Appointment button height: 0.08
              InkWell(
                onTap: () {
                  Get.to(() => VideoCallPage());
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  height: deviceHeight * 0.08,
                  width: deviceWidth,
                  decoration: BoxDecoration(
                    color: const Color(0xff0957df),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Book Appointment",
                        style: text18WhiteBold,
                      ),
                      CustomWidth(),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Demography extends StatelessWidget {
  const _Demography({
    super.key,
    required this.deviceHeight,
    required this.longText,
  });

  final double deviceHeight;
  final String longText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight * 0.17,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Demography",
              style: text18BlackBold,
            ),
            CustomHeight(),
            Text(
              longText,
              style: TextStyle(
                letterSpacing: 1,
                color: Colors.black54,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

class _DoctorInfo extends StatelessWidget {
  const _DoctorInfo({
    super.key,
    required this.deviceHeight,
    required this.deviceWidth,
  });

  final double deviceHeight;
  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight * 0.22,
      child: Row(
        children: [
          Container(
            height: deviceHeight * 0.22,
            width: deviceWidth * 0.3,
            decoration: BoxDecoration(
              border: Border.all(width: 3.0, color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              image: const DecorationImage(
                image: AssetImage(
                  'images/doctor.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: deviceWidth * 0.1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dr. Aman",
                style: text18WhiteBold,
              ),
              Text(
                "Neurologist",
                style: text16White70,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  Text(
                    "Los Angeles, Us",
                    style: text14White70,
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    child: const Text(
                      "5 Star",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      height: deviceWidth * 0.1,
                      width: deviceWidth * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
