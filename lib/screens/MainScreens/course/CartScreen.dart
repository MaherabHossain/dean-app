// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:async';
import 'dart:ui';

import 'package:dean/controllers/CourseController.dart';
import 'package:dean/screens/MainScreens/course/SelectBatchScreen.dart';
import 'package:dean/screens/MainScreens/widgets/PaymentMethodCard.dart';
import 'package:dean/screens/MainScreens/widgets/Profilecard.dart';
import 'package:dean/utilities/api.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final courseController = Get.put(CourseController());
  double totalPrice = 0;
  List<String>? courseIdServer;
  List<String>? courseIdLocal;
  List<String>? batchIdServer;

  getCourse() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      courseIdServer = prefs.getStringList("cart");
      courseIdLocal = prefs.getStringList("cartIndex");
      batchIdServer = prefs.getStringList("batchIndex");
      for (var i = 0; i < courseIdLocal!.length; i++) {
        totalPrice += double.parse(courseController
            .courseList[int.parse(courseIdLocal![i])]['discount_price']);
      }
    });
  }

  @override
  void initState() {
    // courseController.courseList[]
    getCourse();
    super.initState();
  }

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
                      "Cart",
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
              SizedBox(
                height: 10.h,
              ),
              courseIdLocal != null
                  ? Column(
                      children: [
                        for (int i = 0; i < courseIdLocal!.length; ++i)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color:
                                          Color.fromARGB(255, 202, 202, 202)),
                                  padding: EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          appUrl +
                                              courseController.courseList[
                                                      int.parse(
                                                          courseIdLocal![i])]
                                                  ['image'],
                                          height: 50.h,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Container(
                                        width: 80.w,
                                        child: Text(
                                          courseController.courseList[
                                                  int.parse(courseIdLocal![i])]
                                              ['title'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        courseController.courseList[int.parse(
                                                    courseIdLocal![i])]
                                                ['discount_price'] +
                                            "\$",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      IconButton(
                                          onPressed: () async {
                                            totalPrice -= double.parse(
                                                courseController.courseList[
                                                        int.parse(
                                                            courseIdLocal![i])]
                                                    ['discount_price']);
                                            var prefs = await SharedPreferences
                                                .getInstance();
                                            setState(() {
                                              var course_server_id =
                                                  courseController.courseList[
                                                      int.parse(courseIdLocal![
                                                          i])]['id'];
                                              courseIdServer!
                                                  .remove(course_server_id);
                                              var batch_server_id =
                                                  batchIdServer![i];
                                              courseIdLocal!
                                                  .remove(courseIdLocal![i]);
                                              courseIdServer!
                                                  .remove(course_server_id);
                                              batchIdServer!
                                                  .remove(batch_server_id);
                                              prefs.setStringList(
                                                  "cart", courseIdServer!);
                                              prefs.setStringList(
                                                  "cartIndex", courseIdLocal!);
                                              prefs.setStringList(
                                                  "batchIndex", batchIdServer!);
                                              print(
                                                  "LOG:::::::::cart local index");
                                              print(courseIdLocal);
                                              print(
                                                  "LOG:::::::::cart server index");
                                              print(courseIdServer);
                                              print(
                                                  "LOG:::::::::batch server index");
                                              print(batchIdServer);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                )
                              ],
                            ),
                          ),
                      ],
                    )
                  : Text("No Cart Data available!"),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  "Total price: " + totalPrice.toString() + "\$",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 70.h,
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
                    "Checkout",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
