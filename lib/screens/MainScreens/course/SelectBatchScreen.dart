// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:async';

import 'package:dean/screens/MainScreens/widgets/PaymentMethodCard.dart';
import 'package:dean/screens/MainScreens/widgets/Profilecard.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class SelectBatchScreen extends StatefulWidget {
  const SelectBatchScreen({super.key});

  @override
  State<SelectBatchScreen> createState() => _SelectBatchScreenState();
}

class _SelectBatchScreenState extends State<SelectBatchScreen> {
  late VideoPlayerController _controller;
  late bool _visibility = false;
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4')
      ..initialize().then((_) {
        _visibility = true;
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  List<dynamic> batches = [
    {
      "day": "Sat-Sun",
      "time": "Time 9 am - 5 pm",
      "date": "23 Aug",
      "isSelect": false
    },
    {
      "day": "Sat-Sun",
      "time": "Time 9 am - 5 pm",
      "date": "23 Aug",
      "isSelect": false
    },
    {
      "day": "Sat-Sun",
      "time": "Time 9 am - 5 pm",
      "date": "23 Aug",
      "isSelect": false
    },
    {
      "day": "Sat-Sun",
      "time": "Time 9 am - 5 pm",
      "date": "23 Aug",
      "isSelect": false
    },
    {
      "day": "Sat-Sun",
      "time": "Time 9 am - 5 pm",
      "date": "23 Aug",
      "isSelect": false
    },
    {
      "day": "Sat-Sun",
      "time": "Time 9 am - 5 pm",
      "date": "23 Aug",
      "isSelect": false
    },
    {
      "day": "Sat-Sun",
      "time": "Time 9 am - 5 pm",
      "date": "23 Aug",
      "isSelect": false
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 14.h),
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
                        "Select Batch",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Color.fromARGB(255, 0, 0, 0),
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
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 43),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        // tileColor: Color.fromARGB(255, 233, 231, 231),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image(
                            image: NetworkImage(
                                "https://www.filepicker.io/api/file/sXz6u6kMQzK9uXkCwtPv"),
                            height: 55.h,
                          ),
                        ),
                        title: Text(
                          "Python Advance Course ",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          "Batch selected: I will select later",
                          style:
                              TextStyle(color: Color.fromARGB(255, 59, 58, 58)),
                        ),
                      ),
                      Divider(
                        color: Color.fromARGB(31, 17, 17, 17),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 40.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < batches.length - 1; i += 2)
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 16,
                                        top: 14,
                                        bottom: 22,
                                        right: 16),
                                    margin: EdgeInsets.only(bottom: 30.h),
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              batches[i]['day'],
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              batches[i]['date'],
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          batches[i]['time'],
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 16,
                                        top: 14,
                                        bottom: 22,
                                        right: 16),
                                    margin: EdgeInsets.only(bottom: 30.h),
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              batches[i + 1]['day'],
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              batches[i + 1]['date'],
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          batches[i + 1]['time'],
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            SizedBox(
                              height: 17.h,
                            ),
                            Text(
                              "Have a coupon code?",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 9.h,
                            ),
                            TextFormField(
                              // initialValue: address,
                              cursorColor: Color.fromARGB(255, 141, 137, 137),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 141, 137, 137)),
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                contentPadding: EdgeInsets.all(20),
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                // border: InputBorder.none,

                                hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color.fromARGB(255, 141, 137, 137),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                            )
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
              child: Container(
                height: 50.h,
                color: primaryColor,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        color: Color.fromARGB(255, 228, 181, 26),
                        child: Center(
                          child: Text(
                            "Back",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
