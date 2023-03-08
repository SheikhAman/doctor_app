import 'package:get/get.dart';

import '../models/time_model.dart';

class TimeModelController extends GetxController {
  final List<TimeModel> timeList = [];

  final onTimeTap = 0.obs;

  setOnTap(indexValue) {
    onTimeTap.value = indexValue;
    update();
  }

  getTimeList() {
    return [
      TimeModel("09:00 am"),
      TimeModel("10:00 am"),
      TimeModel("11:00 am"),
      TimeModel("12:00 am"),
      TimeModel("1:00 am"),
      TimeModel("2:00 am"),
      TimeModel("3:00 am"),
      TimeModel("4:00 am"),
      TimeModel("5:00 am"),
      TimeModel("6:00 am"),
    ];
  }

  @override
  void onInit() {
    final list = getTimeList();
    timeList.addAll(list);
    // TODO: implement onInit
    super.onInit();
  }
}
