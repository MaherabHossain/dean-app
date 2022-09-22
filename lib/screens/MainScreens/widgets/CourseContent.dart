import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseContent extends StatefulWidget {
  const CourseContent({super.key});

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Section 1 : Course intro",
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            "12 video . 25 min",
            style: TextStyle(color: Color.fromARGB(255, 139, 139, 139)),
          ),
        ],
      ),
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Section 1 : Video 1",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "12 video . 25 min",
                      style:
                          TextStyle(color: Color.fromARGB(255, 139, 139, 139)),
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Section 1 : Video 1",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "12 video . 25 min",
                      style:
                          TextStyle(color: Color.fromARGB(255, 139, 139, 139)),
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Section 1 : Video 1",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "12 video . 25 min",
                      style:
                          TextStyle(color: Color.fromARGB(255, 139, 139, 139)),
                    ),
                  ],
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
