// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:dean/models/Course.dart';
import 'package:dean/screens/MainScreens/HomePage.dart';
import 'package:dean/screens/MainScreens/course/MyCoursesScreen.dart';
import 'package:dean/services/category_remote_services.dart';
import 'package:dean/services/course_remote_services.dart';
import 'package:dean/utilities/showToastMessage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CourseController extends GetxController {
  var loading = true.obs;
  var courseList = [].obs;
  var loadingPay = false.obs;
  var cart = [].obs;
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

  applyCoupon(coupon) async {
    loadingPay.value = true;
    var response = await CourseRemoteServices.applyCoupon(coupon);
    print("LOG::: checking response");
    print(response);
    if (response['status']) {
      loadingPay.value = false;
      return response;
    } else {
      showToastMessage(response['message']);
      loadingPay.value = false;
      return null;
    }
  }

  placeeOrder(orderData) async {
    loadingPay.value = true;
    var response = await CourseRemoteServices.placeOrder(orderData);
    if (response['status']) {
      showToastMessage("course Purchased Successfully");
      loadingPay.value = false;
      Get.offAll(HomePage());
    } else {
      loadingPay.value = false;
      showToastMessage(response["message"]);
    }
  }

  getMyCourses() async {
    loadingPay.value = true;
    var response = await CourseRemoteServices.getMyCourses();

    if (response['status']) {
      loadingPay.value = false;
      return response['courses'];
    } else {
      loadingPay.value = false;
      showToastMessage("Something went wrong!");
      return null;
    }
  }
}
