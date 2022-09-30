// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:async';

import 'package:dean/controllers/CourseController.dart';
import 'package:dean/screens/MainScreens/course/SelectBatchScreen.dart';
import 'package:dean/screens/MainScreens/explore/ExploreDetailsScreen.dart';
import 'package:dean/screens/MainScreens/widgets/ExploreCourseCard.dart';
import 'package:dean/screens/MainScreens/widgets/PaymentMethodCard.dart';
import 'package:dean/screens/MainScreens/widgets/Profilecard.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final courseController = Get.put(CourseController());

  late String search;
  var courseList;
  var displayCourse;
  var displayIndex = [];
  @override
  void initState() {
    courseList = courseController.courseList;
    if (courseList != null) {
      for (int i = 0; i < courseList.length; ++i) {
        displayIndex.add(i);
      }
      displayCourse = courseList;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 216, 216, 216),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 14.h),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          // color: Color.fromARGB(255, 168, 69, 69),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 1),
                          // borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      "Explore",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          // color: Color.fromARGB(255, 168, 69, 69),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add_shopping_cart_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 27.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      onSubmitted: ((value) {
                        print(value);
                      }),
                      onChanged: (value) {
                        var input = value.toLowerCase();
                        var suggetions = [];
                        for (int i = 0; i < courseList.length; ++i) {
                          var courseTitle =
                              courseList[i]['title'].toLowerCase();
                          if (courseTitle.contains(input)) {
                            suggetions.add(i);
                          }
                        }
                        // print(suggetions.length);
                        setState(() {
                          displayIndex = suggetions;
                        });
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        // border: InputBorder.none,
                        hintText: "Search for a course..",
                        hintStyle: TextStyle(
                          fontSize: 12.sp,
                          color: Color.fromARGB(255, 141, 137, 137),
                        ),
                        suffixIcon: InkWell(
                          // onTap: () {
                          //   Get.to(ExploreDetailsScreen());
                          // },
                          child: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 141, 137, 137),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    // Text(
                    //   "Browser Category",
                    //   style: TextStyle(
                    //     fontSize: 15.sp,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 16.h,
                    // ),
                    // Container(
                    //   child: Wrap(
                    //     children: [
                    //       Container(
                    //         padding: EdgeInsets.all(10),
                    //         margin: EdgeInsets.only(right: 10.w, bottom: 15.h),
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //           color: primaryColor,
                    //         ),
                    //         child: Text(
                    //           "Game Development",
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.w400,
                    //               color: Colors.white),
                    //         ),
                    //       ),
                    //       Container(
                    //         padding: EdgeInsets.all(10),
                    //         margin: EdgeInsets.only(right: 10.w, bottom: 15.h),
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //           color: primaryColor,
                    //         ),
                    //         child: Text(
                    //           "Finance",
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.w400,
                    //               color: Colors.white),
                    //         ),
                    //       ),
                    //       Container(
                    //         padding: EdgeInsets.all(10),
                    //         margin: EdgeInsets.only(right: 10.w, bottom: 15.h),
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //           color: primaryColor,
                    //         ),
                    //         child: Text(
                    //           "Game ",
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.w400,
                    //               color: Colors.white),
                    //         ),
                    //       ),
                    //       Container(
                    //         padding: EdgeInsets.all(10),
                    //         margin: EdgeInsets.only(right: 10.w, bottom: 15.h),
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //           color: primaryColor,
                    //         ),
                    //         child: Text(
                    //           "Finance",
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.w400,
                    //               color: Colors.white),
                    //         ),
                    //       ),
                    //       Container(
                    //         padding: EdgeInsets.all(10),
                    //         margin: EdgeInsets.only(right: 10.w, bottom: 15.h),
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //           color: primaryColor,
                    //         ),
                    //         child: Text(
                    //           "Game Development",
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.w400,
                    //               color: Colors.white),
                    //         ),
                    //       ),
                    //       Container(
                    //         padding: EdgeInsets.all(10),
                    //         margin: EdgeInsets.only(right: 10.w, bottom: 15.h),
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //           color: primaryColor,
                    //         ),
                    //         child: Text(
                    //           "Finance",
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.w400,
                    //               color: Colors.white),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child: Divider(
                        thickness: 1,
                      )),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 7.h),
                        child: Text(
                          'Recommended Courses',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Expanded(child: Divider()),
                    ]),
                    SizedBox(
                      height: 15.h,
                    ),
                    if (courseList != null)
                      for (int i = 0; i < displayIndex.length; ++i)
                        ExploreCourseCard(id: displayIndex[i]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
