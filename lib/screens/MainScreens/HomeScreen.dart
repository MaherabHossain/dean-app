// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_new

import 'package:dean/controllers/AuthController.dart';
import 'package:dean/controllers/CategoryController.dart';
import 'package:dean/controllers/CourseController.dart';
import 'package:dean/screens/MainScreens/widgets/Categories.dart';
import 'package:dean/screens/MainScreens/widgets/CourseCard.dart';
import 'package:dean/screens/MainScreens/widgets/HeroSection.dart';
import 'package:dean/screens/MainScreens/widgets/Programs.dart';
import 'package:dean/screens/MainScreens/widgets/Slider.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final categoryController = Get.put(CategoryController());
  final courseController = Get.put(CourseController());
  var displayCourse = [];
  List categoriesList = [
    {"name": "ALL", "selected": true},
    {"name": "Programming", "selected": false},
    {"name": "Software Testing", "selected": false},
    {"name": "JavaScript", "selected": false},
    {"name": "Economics", "selected": false},
    {"name": "Cyber Security", "selected": false},
  ];
  logOut() async {
    final prefs = await SharedPreferences.getInstance();
    final success = await prefs.remove('token');
    if (success) {
      print("Logout successfully");
    } else {
      print("Wrong!");
    }
  }

  checkTokenExpire() async {
    final prefs = await SharedPreferences.getInstance();
    String? token_expire = prefs.getString("token_expires_at");
    if (token_expire != null) {
      DateTime now = new DateTime.now();
      DateTime date = new DateTime(
          now.year, now.month, now.day, now.hour, now.minute, now.second);
      String time_now = date.toString().substring(0, 19);
      DateTime dt1 = DateTime.parse(token_expire!);
      DateTime dt2 = DateTime.parse(time_now);

      if (dt1.compareTo(dt2) == 0 || dt1.compareTo(dt2) < 0) {
        await prefs.remove('token');
        await prefs.remove('userInfo');
        await prefs.remove('token_expires_at');
      }
    }
  }

  @override
  void initState() {
    categoryController.getCategories();
    courseController.getCources();
    displayCourse = courseController.courseList;
    // print("Hello world");
    // print(displayCourse);
    categoryController.getCategories();
    checkTokenExpire();
    // logOut();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              HeroSection(),
              SizedBox(
                height: 135.h,
                child: ListView(
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    ImageSlider(),
                    ImageSlider(),
                    ImageSlider(),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                child: SizedBox(
                  height: 50.h,
                  child: ListView(
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Programs(),
                      Programs(),
                      Programs(),
                      Programs(),
                      Programs(),
                      Programs(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15.h),
                    child: SizedBox(
                      height: 25.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  categoryController.categoriesList[index]
                                      ['selected'] = true;
                                });

                                for (var i = 0;
                                    i <
                                        categoryController
                                            .categoriesList.length;
                                    i++) {
                                  if (i != index) {
                                    setState(() {
                                      categoryController.categoriesList[i]
                                          ['selected'] = false;
                                    });
                                  }
                                }
                                if (index == 0) {
                                  displayCourse = courseController.courseList;
                                } else {
                                  displayCourse = [];
                                  for (int i = 0;
                                      i < courseController.courseList.length;
                                      ++i) {
                                    if (courseController.courseList[i]
                                            ['category']['id'] ==
                                        index) {
                                      displayCourse
                                          .add(courseController.courseList[i]);
                                    }
                                  }
                                }
                              },
                              child: Categories(
                                  categoryController.categoriesList[index]
                                      ['selected'],
                                  categoryController.categoriesList[index]
                                      ['name']));
                        }),
                        itemCount: categoryController.categoriesList.length,
                      ),
                    ),
                  ),
                  Divider(
                    color:
                        Color.fromARGB(255, 139, 139, 139), //color of divider
                    height: 1, //height spacing of divider
                    thickness: 1, //thickness of divier line
                    indent: 15.w, //spacing at the start of divider
                  ),
                ],
              ),
              !courseController.loading.value
                  ? displayCourse != null
                      ? Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10.h),
                          child: Column(
                            children: [
                              for (int i = 0; i < displayCourse.length; i += 2)
                                if (displayCourse.length % 2 != 0 &&
                                    i == displayCourse.length - 1)
                                  Row(
                                    children: [
                                      CourseCard(id: i),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                    ],
                                  )
                                else
                                  Row(
                                    children: [
                                      CourseCard(
                                        id: i,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      CourseCard(
                                        id: i + 1,
                                      ),
                                    ],
                                  )
                            ],
                          ),
                        )
                      : Center(
                          child: Text("No Course available"),
                        )
                  : Container(
                      margin: EdgeInsets.only(top: 20.h),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: deepPrimaryColor,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
