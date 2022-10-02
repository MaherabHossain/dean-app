// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, dead_code, avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:chewie/chewie.dart';
import 'package:dean/controllers/CourseController.dart';
import 'package:dean/screens/MainScreens/course/CartScreen.dart';
import 'package:dean/screens/MainScreens/course/SelectBatchScreen.dart';
import 'package:dean/screens/MainScreens/widgets/PaymentMethodCard.dart';
import 'package:dean/screens/MainScreens/widgets/Profilecard.dart';
import 'package:dean/screens/splashScreen/splashScreen.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class CoursedetailsScreen extends StatefulWidget {
  int id;
  CoursedetailsScreen({super.key, required this.id});

  @override
  State<CoursedetailsScreen> createState() => _CoursedetailsScreenState();
}

class _CoursedetailsScreenState extends State<CoursedetailsScreen> {
  final courseController = Get.put(CourseController());
  late VideoPlayerController videoPlayerController;
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(
            // ignore: prefer_interpolation_to_compose_strings

            courseController.courseList[widget.id]['video'] == null
                ? "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"
                : 'https://www.deanny.org' +
                    courseController.courseList[widget.id]['video']),
        autoPlay: false);
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 14.h),
                  color: deepPrimaryColor,
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
                        "Course Details",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        // onTap: () {
                        //   Get.to(CartScreen());
                        // },
                        child: Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            // color: Color.fromARGB(255, 168, 69, 69),
                            shape: BoxShape.circle,
                          ),
                          // child: Icon(
                          //   Icons.shopping_cart,
                          //   color: Colors.white,
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      // _visibility = !_visibility;
                    });
                  },
                  child: courseController.courseList[widget.id]['video'] != null
                      ? Stack(
                          children: [
                            flickManager != null
                                ? FlickVideoPlayer(flickManager: flickManager)
                                : Center(
                                    child: CircularProgressIndicator(),
                                  ),
                          ],
                        )
                      : Image(
                          image: NetworkImage('https://www.deanny.org' +
                              courseController.courseList[widget.id]['image']),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courseController.courseList[widget.id]['title'],
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        courseController.courseList[widget.id]['created_by'],
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Color.fromARGB(255, 136, 136, 136),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              RatingBar.builder(
                                initialRating: courseController
                                            .courseList[widget.id]['rating'] ==
                                        null
                                    ? 0.0
                                    : courseController.courseList[widget.id]
                                            ['rating']
                                        .toDouble(),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 12.h,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 2.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  // size: 40,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              // Text(
                              //   courseController.courseList[widget.id]['rating']
                              //       .toString(),
                              //   style: TextStyle(
                              //     fontSize: 18.sp,
                              //     fontWeight: FontWeight.w600,
                              //   ),
                              // ),
                            ],
                          ),
                          Text(
                            "\$" +
                                courseController.courseList[widget.id]
                                    ['discount_price'],
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(courseController.courseList[widget.id]
                          ['description']),
                      SizedBox(
                        height: 19.h,
                      ),
                      Divider(
                        thickness: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Language",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 124, 124, 124)),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "English",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Teacher",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 124, 124, 124)),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                courseController.courseList[widget.id]
                                    ['created_by'],
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Duration",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 124, 124, 124)),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "${courseController.courseList[widget.id]['currculums'].length} weeks",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Genre",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 124, 124, 124)),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                courseController.courseList[widget.id]
                                        ['category'][
                                    'name'], //need 12 charecter to proper alignments
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Students",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 124, 124, 124)),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "220k",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Released",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 124, 124, 124),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "8 Aug, 2021",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Divider(
                        thickness: 1.h,
                      ),
                      Text(
                        "Curriculum",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 124, 124, 124),
                        ),
                      ),
                      for (int i = 0;
                          i <
                              courseController
                                  .courseList[widget.id]['currculums'].length;
                          ++i)
                        ListTile(
                          title: Text(
                            courseController.courseList[widget.id]['currculums']
                                [i]['title'],
                            style: TextStyle(
                              // fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: Text(
                            courseController.courseList[widget.id]['currculums']
                                [i]['time'],
                            style: TextStyle(
                              // fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 60.h,
                      ),
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
                  onTap: () async {
                    var _batches = [];
                    var tempBatches =
                        courseController.courseList[widget.id]["shcedules"];
                    for (int i = 0; i < tempBatches.length; ++i) {
                      // tempBatches[i]['isSelect'] = false;
                      _batches.add({
                        "id": tempBatches[i]["id"],
                        "start_date": tempBatches[i]['start_date'],
                        "days": tempBatches[i]['days'],
                        "start_at": tempBatches[i]['start_at'],
                        "isSelect": false,
                      });
                    }
                    print(_batches);
                    Get.to(SelectBatchScreen(
                      batchDetails: _batches,
                      id: widget.id,
                      courseId: courseController.courseList[widget.id]['id'],
                    ));
                  },
                  child: Container(
                    height: 50.h,
                    color: primaryColor,
                    child: Center(
                      child: Text(
                        "Enroll",
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
      ),
    ));
  }
}
