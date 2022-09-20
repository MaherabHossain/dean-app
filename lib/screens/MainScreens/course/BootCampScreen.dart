// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'dart:ui';

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

class BootCampSceen extends StatefulWidget {
  const BootCampSceen({super.key});

  @override
  State<BootCampSceen> createState() => _BootCampSceenState();
}

class _BootCampSceenState extends State<BootCampSceen> {
  List categoriesList = [
    {"name": "ALL", "selected": true},
    {"name": "Programming", "selected": false},
    {"name": "Software Testing", "selected": false},
    {"name": "JavaScript", "selected": false},
    {"name": "Economics", "selected": false},
    {"name": "Cyber Security", "selected": false},
  ];
  @override
  Widget build(BuildContext context) {
    var gridView = GridView(
      // physics: NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 180, crossAxisSpacing: 10),
      children: [
        CourseCard(),
        CourseCard(),
        CourseCard(),
        CourseCard(),
        CourseCard(),
        CourseCard(),
        CourseCard(),
        CourseCard(),
        CourseCard(),
        CourseCard(),
        CourseCard(),
        CourseCard(),
      ],
    );
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 67.h,
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.h),
              color: primaryColor,
              child: Row(
                children: [
                  Text(
                    "Bootcamps",
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
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 20.sp,
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
                            categoriesList[index]['selected'] = true;
                          });

                          for (var i = 0; i < categoriesList.length; i++) {
                            if (i != index) {
                              setState(() {
                                categoriesList[i]['selected'] = false;
                              });
                            }
                          }
                          print(categoriesList[index]['name']);
                          print(categoriesList[index]['selected']);
                        },
                        child: Categories(categoriesList[index]['selected'],
                            categoriesList[index]['name']));
                  }),
                  itemCount: categoriesList.length,
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Column(
                children: [
                  for (int i = 0; i < 10; i += 2)
                    Row(
                      children: [
                        CourseCard(),
                        SizedBox(
                          width: 10.w,
                        ),
                        CourseCard(),
                      ],
                    )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
