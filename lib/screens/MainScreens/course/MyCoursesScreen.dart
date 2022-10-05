// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:dean/controllers/CourseController.dart';
import 'package:dean/screens/MainScreens/course/CourseVideoScreen.dart';
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
  var response;
  var isLoading = false;
  final courseController = Get.put(CourseController());
  getMyCourses() async {
    setState(() {
      isLoading = true;
    });
    var _response = await courseController.getMyCourses();

    setState(() {
      response = _response;
      isLoading = false;
    });
  }

  @override
  void initState() {
    getMyCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(isLoading);
    if (response != null) {
      print(response.length);
    }
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            // height: 87.h,
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
                    // Icon(
                    //   Icons.search,
                    //   color: Colors.white,
                    //   size: 20.sp,
                    // )
                  ],
                ),
                // Text(
                //   "Here are your enrolled course, bootcamps",
                //   style: TextStyle(
                //     color: Color.fromARGB(255, 146, 145, 145),
                //     fontSize: 14.sp,
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 22.3.h,
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: deepPrimaryColor,
                  ),
                )
              : response == null
                  ? Container()
                  : response.length < 1
                      ? Center(
                          child: Text("No course available!"),
                        )
                      : Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: GridView(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisExtent: 180,
                                crossAxisSpacing: 20,
                              ),
                              children: [
                                for (int i = 0; i < response.length; ++i)
                                  InkWell(
                                    onTap: (() {
                                      Get.to(CourseVideoScreen());
                                    }),
                                    child: MyCources(
                                        courseDetails: response[i]['course']),
                                  ),
                              ],
                            ),
                          ),
                        ),
        ],
      ),
    ));
  }
}
