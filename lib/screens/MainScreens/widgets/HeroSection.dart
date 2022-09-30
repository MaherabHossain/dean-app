// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:dean/screens/MainScreens/course/CartScreen.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Container(
      // margin: EdgeInsets.only(left: -20),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      // height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        color: primaryColor,
      ),
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage("assets/images/splashLogo.png"),
                  height: 35.49.h,
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 2,
                    // ),
                    Container(
                      margin: EdgeInsets.only(top: 9.94.h),
                      child: Image(
                        image: AssetImage("assets/images/deanText.png"),
                        height: 8.3.h,
                      ),
                    ),
                    // Text(
                    //   "DEAN INSTITUTE",
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.w700,
                    //     fontSize: 0.007.sh,
                    //   ),
                    // ),
                    SizedBox(
                      height: 5.04.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 2.34.w),
                      child: Image(
                        image: AssetImage("assets/images/deanSubtitle.png"),
                        height: 7.h,
                      ),
                    ),
                    // Text(
                    //   "Learn, Innovate, Didrupt",
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.w600,
                    //     fontSize: 0.018.sh,
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  width: 98.77.w,
                ),
                InkWell(
                  onTap: () {
                    Get.to(CartScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 168, 69, 69),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 13.w,
                ),
                InkWell(
                  onTap: () {
                    // Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 168, 69, 69),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 26.h,
            ),
            SizedBox(
              height: 40.h,
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  fillColor: Color.fromARGB(255, 216, 216, 216),
                  filled: true,
                  // border: InputBorder.none,
                  hintText: "Search cources,bootcamps",
                  hintStyle: TextStyle(
                    fontSize: 12.sp,
                    color: Color.fromARGB(255, 141, 137, 137),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 141, 137, 137),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
