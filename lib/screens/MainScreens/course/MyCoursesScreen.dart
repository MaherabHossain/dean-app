// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:dean/screens/MainScreens/profile/profileScreen.dart';
import 'package:dean/screens/MainScreens/widgets/MyCources.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:get/get.dart';

class MyCourcesScreen extends StatefulWidget {
  const MyCourcesScreen({super.key});
//
  @override
  State<MyCourcesScreen> createState() => _MyCourcesScreenState();
}

class _MyCourcesScreenState extends State<MyCourcesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 87.h,
            color: primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 37.h,
                      child: Text(
                        "My Courses",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 190.h,
                    // ),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 20.sp,
                    )
                  ],
                ),
                Text(
                  "Here are your enrolled course, bootcamps",
                  style: TextStyle(
                    color: Color.fromARGB(255, 146, 145, 145),
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 22.3.h,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisExtent: 180,
                  crossAxisSpacing: 20,
                ),
                children: [
                  InkWell(
                    onTap: (() {
                      // Get.to(ProfileScreen());
                    }),
                    child: MyCources(),
                  ),
                  InkWell(
                    onTap: (() {
                      // Get.to(ProfileScreen());
                    }),
                    child: MyCources(),
                  ),
                  InkWell(
                    onTap: (() {
                      // Get.to(ProfileScreen());
                    }),
                    child: MyCources(),
                  ),
                  InkWell(
                    onTap: (() {
                      // Get.to(ProfileScreen());
                    }),
                    child: MyCources(),
                  ),
                  InkWell(
                    onTap: (() {
                      // Get.to(ProfileScreen());
                    }),
                    child: MyCources(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
