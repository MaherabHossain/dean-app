// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_interpolation_to_compose_strings

import 'package:dean/controllers/CourseController.dart';
import 'package:dean/screens/MainScreens/course/CourseDetailsScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dean/utilities/utility.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseCard extends StatefulWidget {
  var courseDetails;
  CourseCard({super.key, required this.courseDetails});

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  final courseController = Get.put(CourseController());

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // var height = size.height;
    // var width = size.width;
    // print(courseController.courseList[widget.id]['image']);
    return InkWell(
      onTap: () {
        Get.to(CoursedetailsScreen(
          id: widget.courseDetails['id'],
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.h),
        // height: 190.h,
        child: Column(
          children: [
            Container(
              width: 155.38.w,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)), // Image border
                child: SizedBox.fromSize(
                  // size: Size.fromRadius(48), // Image radius
                  child: Image.network(
                    'https://www.deanny.org' + widget.courseDetails['image'],
                    fit: BoxFit.cover,
                    height: 98.27.h,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              width: 155.38.w,
              // height: height / 9,
              constraints: BoxConstraints(
                maxHeight: double.infinity,
              ),

              child: Padding(
                padding: const EdgeInsets.all(6.37),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          width: 80.w,
                          child: Text(
                            widget.courseDetails['title'],
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          widget.courseDetails['hours'] != null
                              ? widget.courseDetails['hours'].toString() +
                                  " hrs"
                              : "",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Matthew Henry",
                        style: TextStyle(
                          color: Color.fromARGB(255, 146, 145, 145),
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    Row(
                      // // crossAxisAlignment: Cro,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          width: 80.w,
                          child: RatingBar.builder(
                            initialRating:
                                widget.courseDetails['rating'].toDouble(),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 10.h,
                            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                              // size: 40,
                            ),
                            onRatingUpdate: (rating) {
                              // print(rating);
                            },
                          ),
                        ),

                        Text(
                          "\$" + widget.courseDetails['discount_price'],
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        // Container(
                        //   padding: EdgeInsets.only(right: 40),
                        //   child: Text(
                        //     "\$230.00",
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.w600,
                        //       fontSize: 12.sp,
                        //     ),
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
