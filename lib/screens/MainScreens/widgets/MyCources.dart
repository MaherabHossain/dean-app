// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class MyCources extends StatefulWidget {
  const MyCources({super.key});

  @override
  State<MyCources> createState() => _MyCourcesState();
}

class _MyCourcesState extends State<MyCources> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.79.h),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ), // Image border
        child: GridTile(
          child: ClipRRect(
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(20),
            //   topRight: Radius.circular(20),
            // ), // Image border
            child: SizedBox.fromSize(
              // size: Size.fromRadius(48), // Image radius
              child: Image.network(
                'https://www.filepicker.io/api/file/sXz6u6kMQzK9uXkCwtPv',
                fit: BoxFit.cover,
                height: 98.27.h,
              ),
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Software Testing Advance Course",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Container(
                  // margin: EdgeInsets.only(
                  //   left: MediaQuery.of(context).size.width / 5,
                  // ),
                  child: Text(
                    "80%",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            subtitle: Center(
                child: Container(
              padding: EdgeInsets.only(top: 5.89.h),
              child: FAProgressBar(
                progressColor: primaryColor,
                size: 5.87.h,
                backgroundColor: Color.fromARGB(255, 146, 145, 145),
                currentValue: 80,
                // displayText: '%',
              ),
            )),
            // trailing:,
          ),
        ),
      ),
    );
  }
}
