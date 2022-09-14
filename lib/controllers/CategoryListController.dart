import 'package:get/get.dart';

class CategoryListController extends GetxController {
  final List categoriesList = [
    {"name": "ALL", "selected": false},
    {"name": "Programming", "selected": true},
    {"name": "Software Testing", "selected": false},
    {"name": "JavaScript", "selected": false},
    {"name": "Economics", "selected": false},
    {"name": "Cyber Security", "selected": false},
  ].obs;
}
