import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spyveb/FollowUser/Model/FollowModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:spyveb/Network/request.dart';
import 'package:spyveb/Network/url.dart';

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
    update();
  }

  void getAPIDATA() async {
    try {
      Request request = Request(
        url: urlBase +
            urlArtistData +
            "id=" +
            "909253" +
            "&" +
            "entity=" +
            "album",
      );
      await request.get().then((value) {
        print(value.body);
        if (value.statusCode == 200) {
          followModel.value = followModelFromJson(value.body);
          update();
        }
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
