import 'package:get/get.dart';
import 'package:test_app/models/date_model.dart';

class DateModelController extends GetxController {
  final List<DateModel> dateModelList = [];

  RxInt onTap = 0.obs;

  setOnTap(indexValue) {
    onTap.value = indexValue;
  }

  getDateList() {
    final List<DateModel> list = [
      DateModel(week: "Mon", date: "11"),
      DateModel(week: "Tue", date: "12"),
      DateModel(week: "Wed", date: "13"),
      DateModel(week: "Thu", date: "14"),
      DateModel(week: "Fri", date: "15"),
      DateModel(week: "Sat", date: "16"),
      DateModel(week: "Sun", date: "17"),
      DateModel(week: "Mon", date: "18"),
      DateModel(week: "Tue", date: "19"),
      DateModel(week: "Wed", date: "20"),
    ];
    dateModelList.addAll(list);
  }

  @override
  void onInit() {
    getDateList();
    // TODO: implement onInit
    super.onInit();
  }
}
