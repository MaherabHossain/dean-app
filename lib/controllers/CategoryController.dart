// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:dean/models/Course.dart';
import 'package:dean/services/category_remote_services.dart';
import 'package:dean/utilities/showToastMessage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var loading = false.obs;

  var categoriesList = [].obs;
  @override
  onInit() {
    getCategories();
    super.onInit();
  }

  getCategories() async {
    var response = await CategoryRemoteServices.getCategories();
    if (response['status']) {
      var tempCategories = response['categories'];
      categoriesList.clear();
      Map allcategories = {"id": 0, "name": "All", "selected": true};
      categoriesList.add(allcategories);
      for (int i = 0; i < tempCategories.length; ++i) {
        tempCategories[i]['selected'] = false;
        categoriesList.add(tempCategories[i]);
      }
    } else {
      showToastMessage(response['message']);
    }
  }
}
