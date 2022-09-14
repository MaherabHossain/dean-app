// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dean/utilities/utility.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatefulWidget {
  const CourseCard({super.key});

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // var height = size.height;
    // var width = size.width;
    return Container(
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
                  'https://www.filepicker.io/api/file/sXz6u6kMQzK9uXkCwtPv',
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 80.w,
                        child: Text(
                          "Trigonometry Full Course",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        "43 hrs",
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
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        width: 80.w,
                        child: RatingBar.builder(
                          initialRating: 3.5,
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
                            print(rating);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 35.28.w,
                      ),
                      Text(
                        "\$340",
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
    );
  }
}
