// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:dean/screens/MainScreens/course/SelectBatchScreen.dart';
import 'package:dean/screens/MainScreens/widgets/PaymentMethodCard.dart';
import 'package:dean/screens/MainScreens/widgets/Profilecard.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CoursedetailsScreen extends StatefulWidget {
  const CoursedetailsScreen({super.key});

  @override
  State<CoursedetailsScreen> createState() => _CoursedetailsScreenState();
}

class _CoursedetailsScreenState extends State<CoursedetailsScreen> {
  // late VideoPlayerController _controller;
  // late bool _visibility = false;

  // bool allowScrubbing = true;
  // @override
  // void initState() {
  //   super.initState();

  //   _controller = VideoPlayerController.network(
  //       'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4')
  //     ..initialize().then((_) {
  //       _visibility = true;
  //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.

  //       if (mounted) {
  //         // check whether the state object is in tree
  //         setState(() {
  //           // make changes here
  //         });
  //       }
  //     });
  // }
  late VideoPlayerController videoPlayerController;
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
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
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 14.h),
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
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 168, 69, 69),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
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
                child: Stack(
                  children: [
                    flickManager != null
                        ? FlickVideoPlayer(flickManager: flickManager)
                        : Center(
                            child: CircularProgressIndicator(),
                          ),

                    // Visibility(
                    //   visible: _visibility,
                    //   child: Center(
                    //     child: Container(
                    //       margin: EdgeInsets.only(top: 70.h),
                    //       child: IconButton(
                    //         onPressed: () {
                    //           setState(() {
                    //             _controller.value.isPlaying
                    //                 ? _controller.pause()
                    //                 : _controller.play();
                    //           });
                    //         },
                    //         icon: Icon(
                    //           _controller.value.isPlaying
                    //               ? Icons.pause
                    //               : Icons.play_arrow,
                    //           color: Colors.white,
                    //           size: 35.sp,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //     // left: 0,
                    //     bottom: 0,
                    //     //you can use "right" and "bottom" too
                    //     child: Container(
                    //         width: MediaQuery.of(context).size.width,
                    //         // color: Colors.purple,
                    //         child: Visibility(
                    //           visible: _visibility,
                    //           child: VideoProgressIndicator(
                    //             _controller,
                    //             padding: EdgeInsets.all(2.0),
                    //             allowScrubbing: allowScrubbing,
                    //           ),
                    //         ))),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Software Testing Fundamentals Course",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "Sara Johnson",
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
                              initialRating: 3.5,
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
                            Text(
                              "4.5",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\$230",
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
                    Text(
                        'Here, this is a mastery software testing course where you will learn to get the depth look of software and find bugs, improving notes all from scratch. So, if you are a beginner this course is absolutely best for you.'),
                    SizedBox(
                      height: 19.h,
                    ),
                    Divider(
                      thickness: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Language",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 124, 124, 124)),
                        ),
                        Text(
                          "Teacher",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 124, 124, 124)),
                        ),
                        Text(
                          "Duration",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 124, 124, 124)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "English",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Text(
                          "Sara Johnson",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Text(
                          "2 weeks",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Genre",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 124, 124, 124)),
                        ),
                        Text(
                          "Students",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 124, 124, 124)),
                        ),
                        Text(
                          "Released",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 124, 124, 124),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "IT          ", //need 12 charecter to proper alignments
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Text(
                          "220k",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Text(
                          "8 Aug, 2021",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
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
                    ListTile(
                      title: Text(
                        "1.Introduction",
                        style: TextStyle(
                          // fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Text(
                        "02:40:12",
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
                onTap: () {
                  Get.to(SelectBatchScreen());
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
    ));
  }
}
