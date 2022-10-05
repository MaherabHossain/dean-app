// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:dean/controllers/PaymentController.dart';
import 'package:dean/screens/MainScreens/widgets/PaymentMethodCard.dart';
import 'package:dean/screens/MainScreens/widgets/Profilecard.dart';
import 'package:dean/utilities/showToastMessage.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
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
                    "Help & Support",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                  Container()
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.call),
                      title: Text(
                        "+1-518-621-0378",
                        style: TextStyle(
                            color: Color.fromARGB(255, 102, 101, 100)),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text(
                        "support@deanny.org",
                        style: TextStyle(
                            color: Color.fromARGB(255, 102, 101, 100)),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text(
                        "admin@deanny.org",
                        style: TextStyle(
                            color: Color.fromARGB(255, 102, 101, 100)),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text(
                        "instructor@deanny.org",
                        style: TextStyle(
                            color: Color.fromARGB(255, 102, 101, 100)),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text(
                        "hr@deanny.org",
                        style: TextStyle(
                            color: Color.fromARGB(255, 102, 101, 100)),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text(
                        "admission@deanny.org",
                        style: TextStyle(
                            color: Color.fromARGB(255, 102, 101, 100)),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_city),
                      title: Text(
                        "75 Maiden Lane # 240 New York, NY 10038",
                        style: TextStyle(
                            color: Color.fromARGB(255, 102, 101, 100)),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_city),
                      title: Text(
                        "128 Mallory Ave, Jersey City, NJ 07304, United States",
                        style: TextStyle(
                            color: Color.fromARGB(255, 102, 101, 100)),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
