// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, invalid_use_of_protected_member, unnecessary_null_comparison

import 'package:dean/controllers/AuthController.dart';
import 'package:dean/screens/MainScreens/widgets/Profilecard.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthController authController = Get.put(AuthController());
  var userInfo;
  getUserinfo() async {
    final prefs = await SharedPreferences.getInstance();
    userInfo = prefs.getStringList("userInfo");

    // {name,email,provider,mobile,address,image,gender,phoneNo,creditLimit}

    if (authController.userInfo.isEmpty) {
      authController.userInfo.add(userInfo);
      if (authController.userInfo == null) {}
    }
    // print(userInfo?[0]);
    setState(() {});
  }

  @override
  void initState() {
    getUserinfo();
    // print(authController.userInfo);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: deepPrimaryColor,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                      "Profile",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
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
                        child: InkWell(
                          onTap: () async {
                            // final prefs = await SharedPreferences.getInstance();
                            // final success = await prefs.remove('token');
                            // if (success) {
                            //   print("Logout successfully");
                            // } else {
                            //   print("Hello");
                            // }
                          },
                          child: Obx(() => InkWell(
                                onTap: () {
                                  print(authController.isLoadingLogout.value);
                                  authController.logOut();
                                },
                                child: !authController.isLoadingLogout.value
                                    ? Icon(
                                        Icons.logout,
                                        color: Colors.white,
                                      )
                                    : CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 24.w,
                              right: 24.w,
                              top: 46.38.h,
                              bottom: 25.67.h),
                          margin: EdgeInsets.only(
                            top: 71.62.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColor,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    userInfo?[0] ?? "",
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Joined",
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    userInfo?[1] ?? "",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "1 Sep, 2022",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   padding: EdgeInsets.only(left: 24.48.w),
                        //   margin: EdgeInsets.only(top: 25.h),
                        //   child: Positioned(
                        //     bottom: 0,
                        //     child: ClipRRect(
                        //       borderRadius:
                        //           BorderRadius.circular(50), // Image border
                        //       child: SizedBox.fromSize(
                        //         // size: Size.fromRadius(48), // Image radius
                        //         child: Image.network(
                        //           'https://www.filepicker.io/api/file/sXz6u6kMQzK9uXkCwtPv',
                        //           fit: BoxFit.cover,
                        //           height: 83.24.h,
                        //           width: 83.24.h,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20.19.w,
                        vertical: 30.12.h,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50), // Image border
                        child: SizedBox.fromSize(
                          // size: Size.fromRadius(48), // Image radius
                          child: Container(
                            color: Colors.white,
                            child: Image.asset(
                              'assets/images/userIcon.png',
                              fit: BoxFit.contain,
                              height: 83.23.h,
                              width: 83.23.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "General",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Column(
                  children: [
                    ProfileCard(
                        Icon(Icons.person), "Edit profile", '/edit-profile'),
                    ProfileCard(Icon(Icons.credit_card), "Payment Method",
                        '/payment-method'),
                    ProfileCard(Icon(Icons.work_history), "Transaction History",
                        '/transaction-history'),
                  ],
                ),
                Text(
                  "Help",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Column(
                  children: [
                    ProfileCard(Icon(Icons.credit_card), "Help and Suport",
                        '/edit-profile'),
                    ProfileCard(
                        Icon(Icons.dns), "Tarms & Condition", '/edit-profile'),
                    ProfileCard(Icon(Icons.info), "About App", '/edit-profile'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
