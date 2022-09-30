// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:async';

import 'package:dean/screens/MainScreens/course/SelectBatchScreen.dart';
import 'package:dean/screens/MainScreens/widgets/ExploreCourseCard.dart';
import 'package:dean/screens/MainScreens/widgets/PaymentMethodCard.dart';
import 'package:dean/screens/MainScreens/widgets/Profilecard.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ExploreDetailsScreen extends StatefulWidget {
  const ExploreDetailsScreen({super.key});

  @override
  State<ExploreDetailsScreen> createState() => _ExploreDetailsScreenState();
}

class _ExploreDetailsScreenState extends State<ExploreDetailsScreen> {
  late String search;
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
                      "Explore Details",
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
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Result for 'vue js'",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Total searches 198",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Color.fromARGB(255, 139, 139, 139),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ]),
                    SizedBox(
                      height: 15.h,
                    ),
                    ExploreCourseCard(
                      id: 1,
                    ),
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
