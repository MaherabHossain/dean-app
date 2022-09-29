// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:async';
import 'dart:ui';

import 'package:dean/controllers/CourseController.dart';
import 'package:dean/screens/MainScreens/course/SelectBatchScreen.dart';
import 'package:dean/screens/MainScreens/widgets/PaymentMethodCard.dart';
import 'package:dean/screens/MainScreens/widgets/Profilecard.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        SingleChildScrollView(
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
                          color: Color.fromARGB(255, 168, 69, 69),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      "Checkout",
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
                          color: Color.fromARGB(255, 168, 69, 69),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment method",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        // side: ,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: Color.fromARGB(255, 233, 231, 231),
                      leading: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 233, 231, 231),
                        child: Image(
                            image: AssetImage("assets/images/masterCard.png")),
                      ),
                      title: Text(
                        "Creadit Card",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      trailing: Icon(
                        Icons.radio_button_checked,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        // side: ,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: Color.fromARGB(255, 233, 231, 231),
                      leading: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 233, 231, 231),
                        child: Image(
                            image: AssetImage("assets/images/masterCard.png")),
                      ),
                      title: Text(
                        "Creadit Card",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      trailing: Icon(
                        Icons.radio_button_checked,
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        // side: ,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: Color.fromARGB(255, 233, 231, 231),
                      leading: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 233, 231, 231),
                        child: Image(
                            image: AssetImage("assets/images/masterCard.png")),
                      ),
                      title: Text(
                        "Creadit Card",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      trailing: Icon(
                        Icons.radio_button_checked,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color.fromARGB(255, 128, 128, 128),
                        ),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              "Price",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  // fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            trailing: Text(
                              "\$250",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  // fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                          Divider(),
                          ListTile(
                            title: Text(
                              "Discount",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  // fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            trailing: Text(
                              "-\$50",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  // fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                          Divider(),
                          ListTile(
                            title: Text(
                              "Total",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            trailing: Text(
                              "\$200",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  // Get.to();
                },
                child: Container(
                  height: 50.h,
                  color: primaryColor,
                  child: Center(
                    child: Text(
                      "Pay Now",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )),
        ),
      ]),
    ));
  }
}
