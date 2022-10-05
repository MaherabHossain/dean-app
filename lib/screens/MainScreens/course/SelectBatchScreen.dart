// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_element, avoid_init_to_null

import 'dart:async';

import 'package:dean/controllers/CourseController.dart';
import 'package:dean/controllers/PaymentController.dart';
import 'package:dean/screens/MainScreens/course/CartScreen.dart';
import 'package:dean/screens/MainScreens/course/CheckOutScreen.dart';
import 'package:dean/screens/MainScreens/profile/TermsScreen.dart';
import 'package:dean/screens/MainScreens/widgets/PaymentMethodCard.dart';
import 'package:dean/screens/MainScreens/widgets/Profilecard.dart';
import 'package:dean/screens/splashScreen/splashScreen.dart';
import 'package:dean/utilities/showToastMessage.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class SelectBatchScreen extends StatefulWidget {
  var batchDetails;
  var id;
  var courseId;
  SelectBatchScreen(
      {super.key, required this.batchDetails, required this.id, this.courseId});

  @override
  State<SelectBatchScreen> createState() =>
      _SelectBatchScreenState(batchDetails: batchDetails);
}

class _SelectBatchScreenState extends State<SelectBatchScreen> {
  var batchDetails;
  var coupon;
  var checkedValue = false;
  _SelectBatchScreenState({this.batchDetails});
  final courseController = Get.put(CourseController());
  final paymentController = Get.put(PaymentController());
  var batchId = null;
  var cardList;
  var displayCourse = [];
  getDisplayCourse() {
    for (int i = 0; i < courseController.courseList.length; ++i) {
      if (courseController.courseList[i]["id"] == widget.id) {
        setState(() {
          displayCourse.add(courseController.courseList[i]);
        });
      }
    }
  }

  @override
  void initState() {
    getDisplayCourse();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("LOG::: Select batches..");
    print(widget.courseId);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 14.h),
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
                        "Select Batch",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Color.fromARGB(255, 0, 0, 0),
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 43),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        // tileColor: Color.fromARGB(255, 233, 231, 231),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image(
                            image: NetworkImage(
                                // ignore: prefer_interpolation_to_compose_strings
                                'https://www.deanny.org' +
                                    displayCourse[0]['image']),
                            height: 55.h,
                          ),
                        ),
                        title: Text(
                          displayCourse[0]['title'],
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Divider(
                        color: Color.fromARGB(31, 17, 17, 17),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 40.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < batchDetails.length; i += 2)
                              if (batchDetails.length % 2 != 0 &&
                                  i == batchDetails.length - 1)
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          batchId = batchDetails[i]['id'];
                                          batchDetails[i]['isSelect'] =
                                              !batchDetails[i]['isSelect'];
                                        });
                                        for (int j = 0;
                                            j < batchDetails.length;
                                            ++j) {
                                          if (i != j) {
                                            batchDetails[j]['isSelect'] = false;
                                          }
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 16,
                                            top: 14,
                                            bottom: 22,
                                            right: 16),
                                        margin: EdgeInsets.only(bottom: 30.h),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: batchDetails[i]['isSelect']
                                                  ? Color.fromARGB(
                                                      255, 228, 181, 26)
                                                  : Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: batchDetails[i]['isSelect']
                                              ? Color.fromARGB(
                                                  255, 228, 181, 26)
                                              : Color.fromARGB(
                                                  255, 255, 255, 255),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  batchDetails[i]['days']
                                                      .substring(0, 9),
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: batchDetails[i]
                                                            ['isSelect']
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  batchDetails[i]['start_date'],
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: batchDetails[i]
                                                            ['isSelect']
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                              batchDetails[i]['start_at'],
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: batchDetails[i]
                                                        ['isSelect']
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              else
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        batchId = batchDetails[i]['id'];
                                        setState(() {
                                          batchDetails[i]['isSelect'] =
                                              !batchDetails[i]['isSelect'];
                                        });
                                        for (int j = 0;
                                            j < batchDetails.length;
                                            ++j) {
                                          if (i != j) {
                                            batchDetails[j]['isSelect'] = false;
                                          }
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 16,
                                            top: 14,
                                            bottom: 22,
                                            right: 16),
                                        margin: EdgeInsets.only(bottom: 30.h),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: batchDetails[i]['isSelect']
                                                  ? Color.fromARGB(
                                                      255, 228, 181, 26)
                                                  : Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: batchDetails[i]['isSelect']
                                              ? Color.fromARGB(
                                                  255, 228, 181, 26)
                                              : Color.fromARGB(
                                                  255, 255, 255, 255),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  batchDetails[i]['days']
                                                      .substring(0, 9),
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: batchDetails[i]
                                                            ['isSelect']
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  batchDetails[i]['start_date'],
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: batchDetails[i]
                                                            ['isSelect']
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                              batchDetails[i]['start_at'],
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: batchDetails[i]
                                                        ['isSelect']
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        batchId = batchDetails[i + 1]['id'];
                                        setState(() {
                                          batchDetails[i + 1]['isSelect'] =
                                              !batchDetails[i + 1]['isSelect'];
                                        });
                                        for (int j = 0;
                                            j < batchDetails.length;
                                            ++j) {
                                          if (i + 1 != j) {
                                            batchDetails[j]['isSelect'] = false;
                                          }
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 16,
                                            top: 14,
                                            bottom: 22,
                                            right: 16),
                                        margin: EdgeInsets.only(bottom: 30.h),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: batchDetails[i + 1]
                                                      ['isSelect']
                                                  ? Color.fromARGB(
                                                      255, 228, 181, 26)
                                                  : Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: batchDetails[i + 1]['isSelect']
                                              ? Color.fromARGB(
                                                  255, 228, 181, 26)
                                              : Color.fromARGB(
                                                  255, 255, 255, 255),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  batchDetails[i + 1]['days']
                                                      .substring(0, 9),
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: batchDetails[i + 1]
                                                            ['isSelect']
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  batchDetails[i + 1]
                                                      ['start_date'],
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: batchDetails[i + 1]
                                                            ['isSelect']
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                              batchDetails[i + 1]['start_at'],
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: batchDetails[i + 1]
                                                        ['isSelect']
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            // Row(
                            //   children: [

                            //     SizedBox(
                            //       width: 20.h,
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              height: 17.h,
                            ),
                            Text(
                              "Have a coupon code?",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 9.h,
                            ),
                            TextFormField(
                              onChanged: ((value) {
                                coupon = value;
                              }),
                              cursorColor: Color.fromARGB(255, 141, 137, 137),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 141, 137, 137)),
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
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
                                fillColor: Colors.white,
                                filled: true,
                                // border: InputBorder.none,

                                hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color.fromARGB(255, 141, 137, 137),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            // Text(
                            //   "Terms & Conditions",
                            //   style: TextStyle(
                            //     fontSize: 14.sp,
                            //     fontWeight: FontWeight.w700,
                            //   ),
                            // ),
                            CheckboxListTile(
                              title: Text("I Agree"),
                              value: checkedValue,
                              onChanged: (newValue) {
                                setState(() {
                                  checkedValue = newValue!;
                                });
                              },
                              controlAffinity: ListTileControlAffinity
                                  .leading, //  <-- leading Checkbox
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(TermsScreen());
                              },
                              child: Text(
                                "Terms & Conditions",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blue),
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50.h,
                color: primaryColor,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        color: Color.fromARGB(255, 228, 181, 26),
                        child: Center(
                          child: Text(
                            "Back",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: InkWell(
                        onTap: () async {
                          if (batchId == null) {
                            showToastMessage("please select a batch!");
                            return;
                          }
                          if (!checkedValue) {
                            showToastMessage(
                                "Please accept terms and conditions!");
                            return;
                          }
                          var prefs = await SharedPreferences.getInstance();
                          var _token = prefs.getString("token");
                          // courseController.cart
                          //     .add(courseController.courseList[widget.id]);
                          // prefs.remove('cart');
                          // prefs.remove('batch');
                          // prefs.remove('cartIndex');
                          // prefs.remove('batchIndex');
                          // print("data removed");
                          // return;
                          // List<String>? cart = prefs.getStringList("cart");
                          // List<String>? cartIn =
                          //     prefs.getStringList("cartIndex");
                          // List<String>? batchIn =
                          //     prefs.getStringList("batchIndex");
                          // cart != null
                          //     ? print("cart not null")
                          //     : print("cart null");

                          // cartIn != null
                          //     ? print("cartIn not null")
                          //     : print("cartIn null");
                          // batchIn != null
                          //     ? print("batchIn not null")
                          //     : print("batchIn null");

                          //  no need to store data in local storage for multiple course order

                          // if (cart == null &&
                          //     cartIn == null &&
                          //     batchIn == null) {
                          //   print("come here");
                          //   // prefs.setStringList('cart', stringList);
                          //   List<String> cartString = [];
                          //   List<String> batchString = [];
                          //   List<String> cartIndex = [];
                          //   List<String> batchIndex = [];
                          //   cartString.add(courseController
                          //       .courseList[widget.id]['id']
                          //       .toString());
                          //   batchString.add(courseController
                          //       .courseList[widget.id]['id']
                          //       .toString());
                          //   cartIndex.add(widget.id.toString());
                          //   batchIndex.add(widget.id.toString());

                          //   prefs.setStringList("cart", cartString);
                          //   prefs.setStringList("batch", batchString);
                          //   prefs.setStringList("cartIndex", cartIndex);
                          //   prefs.setStringList("batchIndex", batchIndex);
                          //   List<String>? cartTemp =
                          //       prefs.getStringList("cart");
                          //   List<String>? batchTemp =
                          //       prefs.getStringList("batch");
                          //   print("LOG::: test cart 2");
                          //   print("LOG::: cart");
                          //   print(cartTemp);
                          //   print("LOG::: batch");
                          //   print(batchTemp);
                          // } else {
                          //   print("come here 2");
                          //   List<String>? cartString = cart;
                          //   cartString?.add(courseController
                          //       .courseList[widget.id]['id']
                          //       .toString());

                          //   List<String>? cartIndex = cartIn;
                          //   cartIndex?.add(widget.id.toString());
                          //   List<String>? batchIndex = batchIn;
                          //   batchIndex?.add(batchId.toString());
                          //   prefs.setStringList("batchIndex", batchIndex!);

                          //   prefs.setStringList("cartIndex", cartIndex!);
                          //   prefs.setStringList("cart", cartString!);
                          //   List<String>? cartTemp =
                          //       prefs.getStringList("cart");
                          //   List<String>? _cartIn =
                          //       prefs.getStringList("cartIndex");
                          //   List<String>? _batchIn =
                          //       prefs.getStringList("batchIndex");
                          //   List<String>? _batch = prefs.getStringList("batch");
                          //   // print("LOG::: test cart");
                          //   // print("LOG::: cart");
                          //   // print(cartTemp);
                          //   // //   cart -> server
                          //   // // cartIndex -> local
                          //   // // batchIndex -> server
                          //   // print("LOG::: cart index");
                          //   // print(_cartIn);
                          //   // print("LOG::: batch index");
                          //   // print(_batchIn);
                          //   // print("LOG::: batch index local");
                          //   // print(_batch);
                          // }
                          if (_token != null) {
                            var coupon_id;
                            var discount;
                            if (coupon != null) {
                              var response =
                                  await courseController.applyCoupon(coupon);
                              if (response != null) {
                                coupon_id = response['coupon_id'];
                                discount = response['discount'];
                                Get.to(CheckOutScreen(
                                  course_id: widget.courseId,
                                  schedule_id: batchId,
                                  coupon_id: coupon_id,
                                  discount: discount,
                                  local_course_id: widget.id,
                                ));
                              }
                              Get.to(CheckOutScreen(
                                course_id: widget.courseId,
                                schedule_id: batchId,
                                local_course_id: widget.id,
                              ));
                              return;
                            }
                            Get.to(CheckOutScreen(
                              course_id: widget.courseId,
                              schedule_id: batchId,
                              local_course_id: widget.id,
                            ));
                          } else {
                            Get.to(SplashScreen());
                            print("LOG::: your are not logged in");
                          }
                          // Get.to(CheckOutScreen());
                        },
                        child: Center(
                          child: !courseController.loadingPay.value
                              ? Text(
                                  "Next",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                )
                              : CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
