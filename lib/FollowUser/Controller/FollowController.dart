import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spyveb/FollowUser/Model/FollowModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;

class Followcontroller extends GetxController {
  Rx<FollowModel> followModel = FollowModel().obs;
  RxList<bool> followBool = <bool>[].obs;
  RxInt totalFollow = 0.obs;

  void totalFollowCheck() {
    totalFollow.value = 0;
    for (int i = 0; i < followModel.value.results!.length; i++) {
      if (followModel.value.results![i].follow == true) {
        totalFollow.value++;
      }
    }
    setLocalData();
    update();
  }

  initLocalData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.getString("jsonData") == null) {
      String response = await rootBundle.loadString('asset/data.txt');
      followModel.value = followModelFromJson(response);
      _prefs.setString("jsonData", followModelToJson(followModel.value));
      totalFollowCheck();
    } else {
      var data = _prefs.getString("jsonData");
      followModel.value = followModelFromJson(data.toString());
      totalFollowCheck();
    }
  }

  setLocalData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString("jsonData", followModelToJson(followModel.value));
  }
}
