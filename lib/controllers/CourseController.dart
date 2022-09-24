// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:dean/models/Course.dart';
import 'package:dean/services/category_remote_services.dart';
import 'package:dean/services/course_remote_services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CourseController extends GetxController {
  var loading = true.obs;
  var courseList = [].obs;
  @override
  onInit() {
    getCources();
    super.onInit();
  }

  getCources() async {
    var response = await CourseRemoteServices.getCources();
    loading.value = false;
    if (response['status']) {
      courseList.value = response['courses'];
      print("LOG:: Course List");
      print(courseList.length);
      for (int i = 0; i < courseList.length; ++i) {
        // print("LOG:: " + courseList[i]['title']);
      }
      print(loading.value);
    }
  }
}
