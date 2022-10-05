// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:dean/controllers/PaymentController.dart';
import 'package:dean/screens/MainScreens/widgets/PaymentMethodCard.dart';
import 'package:dean/screens/MainScreens/widgets/Profilecard.dart';
import 'package:dean/utilities/showToastMessage.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
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
                    "About App",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                  Container()
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  child: Text(
                    "Welcome to Dean Institute",
                    style: TextStyle(
                        fontSize: 15.h,
                        color: deepPrimaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.h, right: 20.h, top: 10.h),
                  child: Text(
                    "Dean Institute We help organizations of all types and sizes prepare for the path ahead — wherever it leads.Our curated collection of business and technical courses help companies, governments, and nonprofits go further by placing learning at the center of their strategies.The mission to provide world-class education for anyone, anywhere. Learners, teachers, districts, and parents,Students practice at their own pace, first filling in gaps in their understanding and then accelerating their learning.With Dean teachers can identify gaps in their students’ understanding, tailor instruction, and meet the needs of every student.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15.sp, height: 2),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
