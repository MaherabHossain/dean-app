// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'dart:ui';

import 'package:dean/controllers/CategoryController.dart';
import 'package:dean/controllers/CourseController.dart';
import 'package:dean/screens/MainScreens/explore/ExploreScreen.dart';
import 'package:dean/screens/MainScreens/widgets/Categories.dart';
import 'package:dean/screens/MainScreens/widgets/CourseCard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dean/screens/MainScreens/HomeScreen.dart';
import 'package:dean/screens/splashScreen/forgotPasswordScreen.dart';
import 'package:dean/screens/splashScreen/registerScreen.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllCourseScreen extends StatefulWidget {
  const AllCourseScreen({super.key});

  @override
  State<AllCourseScreen> createState() => _AllCourseScreenState();
}

class _AllCourseScreenState extends State<AllCourseScreen> {
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
    // categoryController.getCategorries();
    // courseController.getCources();
    displayCourse = courseController.courseList;
    print("Hello world");
    print(displayCourse);
    checkTokenExpire();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Container(
                height: 67.h,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.h),
                color: primaryColor,
                child: Row(
                  children: [
                    Text(
                      "All Cources",
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 170.w,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(ExploreScreen());
                      },
                      child: InkWell(
                        onTap: () {
                          Get.to(ExploreScreen());
                        },
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
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
                                i < categoryController.categoriesList.length;
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
                                if (courseController.courseList[i]['category']
                                        ['id'] ==
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
                color: Color.fromARGB(255, 139, 139, 139), //color of divider
                height: 1, //height spacing of divider
                thickness: 1, //thickness of divier line
                indent: 15, //spacing at the start of divider
              ),
              SizedBox(
                height: 17.h,
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
                                      CourseCard(
                                        courseDetails: displayCourse[i],
                                        id: displayCourse[i]['id'],
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                    ],
                                  )
                                else
                                  Row(
                                    children: [
                                      CourseCard(
                                        courseDetails: displayCourse[i],
                                        id: displayCourse[i]['id'],
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      CourseCard(
                                        courseDetails: displayCourse[i + 1],
                                        id: displayCourse[i + 1]['id'],
                                      ),
                                    ],
                                  )
                            ],
                          ),
                        )
                      : Center(
                          child: Text("No Course available"),
                        )
                  : Center(
                      child: CircularProgressIndicator(
                        color: deepPrimaryColor,
                      ),
                    ),
            ],
          ),
        ),
      ),
    ));
  }
}
