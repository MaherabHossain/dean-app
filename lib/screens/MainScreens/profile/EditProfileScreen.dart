// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_null_comparison

import 'package:dean/controllers/AuthController.dart';
import 'package:dean/screens/MainScreens/widgets/Profilecard.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileScreen extends StatefulWidget {
  // String name, email, phone, address;
  const EditProfileScreen({
    super.key,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with SingleTickerProviderStateMixin {
  AuthController authController = Get.put(AuthController());
  late AnimationController _controller;
  List<String>? userInfo;
  String name = "", email = "", phone = "", address = "";

  // getUserinfo() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   userInfo = prefs.getStringList("userInfo");

  //   print("from profile edit screen");
  //   // {name,email,provider,mobile,address,image,gender,phoneNo,creditLimit}
  //   print(userInfo);
  //   setState(() {
  //     name = userInfo![0];
  //     email = userInfo?[1] ?? "";
  //     phone = userInfo?[7] ?? "";
  //     address = userInfo?[4] ?? "";
  //   });
  //   // print("dfs");
  // }

  @override
  void initState() {
    // getUserinfo();
    print("LOG:::test from profile update");
    print(authController.userInfo);

    if (authController.userInfo != null) {
      setState(() {
        print("Testing jkxbdfi");
        print(authController.userInfo);
        name = authController.userInfo[0][0];
        email = authController.userInfo[0][1];
        phone = authController.userInfo[0][7];
        address = authController.userInfo[0][4];
      });
    }
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(authController.userInfo[0]);
    return SafeArea(
      child: Scaffold(
        backgroundColor: deepPrimaryColor,
        body: Obx(
          () => SingleChildScrollView(
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
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 168, 69, 69),
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          onTap: (() {
                            print("Tapped");
                            Map userInfo = {
                              "name": name,
                              "phone_no": phone ?? "null",
                              "address": address ?? "null",
                              "gender": "null"
                            };
                            authController.updateUser(userInfo);
                            // print("LOG::: check form data.");
                            // print(data);
                          }),
                          child: !authController.isLoading.value
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : CircularProgressIndicator(
                                  color: Colors.white,
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
                                      // authController.userInfo[0][0],
                                      name,
                                      // "temo",
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
                                      // authController.userInfo[0][0]["email"],
                                      // authController.userInfo[0][1],
                                      email,
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
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 20.19.w,
                          vertical: 30.12.h,
                        ),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(50), // Image border
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
                  Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: TextFormField(
                      onChanged: ((value) {
                        setState(() {
                          name = value;
                        });
                      }),
                      initialValue: name,
                      // initialValue: authController.userInfo[0][0],
                      cursorColor: Color.fromARGB(255, 141, 137, 137),
                      style:
                          TextStyle(color: Color.fromARGB(255, 141, 137, 137)),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        fillColor: primaryColor,
                        filled: true,
                        // border: InputBorder.none,
                        hintText: "Name..",
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Color.fromARGB(255, 141, 137, 137),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: TextFormField(
                      onChanged: ((value) {
                        setState(() {
                          phone = value;
                        });
                      }),
                      initialValue: phone,
                      cursorColor: Color.fromARGB(255, 141, 137, 137),
                      style:
                          TextStyle(color: Color.fromARGB(255, 141, 137, 137)),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        fillColor: primaryColor,
                        filled: true,
                        // border: InputBorder.none,
                        hintText: "Phone..",
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Color.fromARGB(255, 141, 137, 137),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: TextFormField(
                      onChanged: ((value) {
                        setState(() {
                          address = value;
                        });
                      }),
                      initialValue: address,
                      cursorColor: Color.fromARGB(255, 141, 137, 137),
                      style:
                          TextStyle(color: Color.fromARGB(255, 141, 137, 137)),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        fillColor: primaryColor,
                        filled: true,
                        // border: InputBorder.none,
                        hintText: "Address..",
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Color.fromARGB(255, 141, 137, 137),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
