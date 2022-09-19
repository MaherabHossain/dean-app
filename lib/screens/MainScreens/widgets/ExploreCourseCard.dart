// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:async';

import 'package:dean/screens/MainScreens/course/SelectBatchScreen.dart';
import 'package:dean/screens/MainScreens/widgets/PaymentMethodCard.dart';
import 'package:dean/screens/MainScreens/widgets/Profilecard.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ExploreCourseCard extends StatefulWidget {
  const ExploreCourseCard({super.key});

  @override
  State<ExploreCourseCard> createState() => _ExploreCourseCardState();
}

class _ExploreCourseCardState extends State<ExploreCourseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: AssetImage("assets/images/graduationCap.png"),
              // height: 72.h,
              // width: 72.w,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Math 102",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Description: All can be perfect in math....",
                style: TextStyle(
                    fontSize: 12.sp, color: Color.fromARGB(255, 143, 141, 141)
                    // fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Price: \$50",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: 3.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 1,
                    itemSize: 12.h,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                      // size: 40,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Text(
                    "5.0",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    " . By Sarah William",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Color.fromARGB(255, 143, 141, 141)
                        // fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    " . Beginner",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Color.fromARGB(255, 143, 141, 141)
                        // fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
