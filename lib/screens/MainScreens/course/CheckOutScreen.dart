// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, prefer_interpolation_to_compose_strings, unused_local_variable, use_build_context_synchronously, unnecessary_null_comparison

import 'dart:async';
import 'dart:ui';

import 'package:dean/controllers/CourseController.dart';
import 'package:dean/controllers/PaymentController.dart';
import 'package:dean/screens/MainScreens/course/SelectBatchScreen.dart';
import 'package:dean/screens/MainScreens/widgets/PaymentMethodCard.dart';
import 'package:dean/screens/MainScreens/widgets/Profilecard.dart';
import 'package:dean/utilities/showToastMessage.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:video_player/video_player.dart';

class CheckOutScreen extends StatefulWidget {
  var course_id;
  var coupon_id;
  var discount;
  var schedule_id;
  var local_course_id;

  CheckOutScreen(
      {super.key,
      this.course_id,
      this.coupon_id,
      this.discount,
      this.schedule_id,
      this.local_course_id});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final courseController = Get.put(CourseController());
  final paymentController = Get.put(PaymentController());
  var cardId;
  var cardList;
  var selected = [];

  String cardNumber = "";
  String csv = "";
  String expDate = "";
  var response;
  getCardData() async {
    response = await paymentController.getCard();
    if (response != null) {
      setState(() {
        cardList = response;
        for (int i = 0; i < cardList.length; ++i) {
          selected.add(false);
        }
      });
    }
  }

  var displayCourse = [];
  getDisplayCourse() {
    for (int i = 0; i < courseController.courseList.length; ++i) {
      if (courseController.courseList[i]["id"] == widget.course_id) {
        setState(() {
          displayCourse.add(courseController.courseList[i]);
        });
      }
    }
  }

  @override
  void initState() {
    getDisplayCourse();
    getCardData();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var discount = 0;
    var total = 0;
    if (displayCourse != null) {
      print("LOG::Check cards");
      print(cardList);
      discount = widget.discount ?? 0;
      var totaltotal = widget.discount != null
          ? double.parse(displayCourse[0]["discount_price"]) -
              double.parse(widget.discount.toString())
          : displayCourse[0]["discount_price"];
      print("LOG:::checking course id/...");
      print(widget.course_id);
      print(widget.schedule_id);
    }
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Stack(children: [
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
                        "Checkout",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                      Container()
                      // InkWell(
                      //   onTap: () {},
                      //   child: Container(
                      //     padding: EdgeInsets.all(7),
                      //     decoration: BoxDecoration(
                      //       color: Color.fromARGB(255, 168, 69, 69),
                      //       shape: BoxShape.circle,
                      //     ),
                      //     child: Icon(
                      //       Icons.done,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment method",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      paymentController.isLoading.value
                          ? Column(
                              children: [
                                Center(
                                  child: CircularProgressIndicator(
                                    color: deepPrimaryColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                )
                              ],
                            )
                          : cardList != null
                              ? Column(
                                  children: [
                                    for (int i = 0; i < cardList.length; ++i)
                                      Column(
                                        children: [
                                          InkWell(
                                            onTap: (() {
                                              setState(() {
                                                cardId = cardList[i]["id"];
                                                selected[i] = true;
                                                for (int j = 0;
                                                    j < selected.length;
                                                    ++j) {
                                                  if (i != j) {
                                                    selected[j] = false;
                                                  }
                                                }
                                              });
                                            }),
                                            child: ListTile(
                                              shape: RoundedRectangleBorder(
                                                // side: ,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              tileColor: Color.fromARGB(
                                                  255, 233, 231, 231),
                                              leading: CircleAvatar(
                                                backgroundColor: Color.fromARGB(
                                                    255, 233, 231, 231),
                                                child: Image(
                                                    image: AssetImage(
                                                        "assets/images/masterCard.png")),
                                              ),
                                              title: Text(
                                                cardList[i]['card_number'],
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0)),
                                              ),
                                              trailing: Icon(
                                                Icons.radio_button_checked,
                                                color: selected[i]
                                                    ? Colors.orange
                                                    : Color.fromARGB(
                                                        255, 112, 106, 105),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                        ],
                                      )
                                  ],
                                )
                              : Center(
                                  child: Text("No Card available!"),
                                ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                var loading = false;
                                return AlertDialog(
                                  content: Stack(
                                    clipBehavior: Clip.none,
                                    children: <Widget>[
                                      Positioned(
                                        right: -40.0,
                                        top: -40.0,
                                        child: InkResponse(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: CircleAvatar(
                                            child: Icon(Icons.close),
                                            backgroundColor: deepPrimaryColor,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 250.h,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Add Card",
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            TextField(
                                              onChanged: ((value) {
                                                setState(() {
                                                  cardNumber = value;
                                                });
                                              }),
                                              cursorColor: Colors.black,
                                              decoration: InputDecoration(
                                                fillColor: Color.fromARGB(
                                                    255, 216, 216, 216),
                                                filled: true,
                                                border: InputBorder.none,
                                                hintText: " Card number",
                                                hintStyle: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0)),
                                                prefixIcon: Icon(
                                                  Icons.credit_card,
                                                  color: primaryColor,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            TextField(
                                              onChanged: ((value) {
                                                setState(() {
                                                  csv = value;
                                                });
                                              }),
                                              cursorColor: Colors.black,
                                              decoration: InputDecoration(
                                                fillColor: Color.fromARGB(
                                                    255, 216, 216, 216),
                                                filled: true,
                                                border: InputBorder.none,
                                                hintText: "CSV",
                                                hintStyle: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0)),
                                                prefixIcon: Icon(
                                                  Icons.star,
                                                  color: primaryColor,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            TextField(
                                              onChanged: ((value) {
                                                setState(() {
                                                  expDate = value;
                                                });
                                              }),
                                              cursorColor: Colors.black,
                                              decoration: InputDecoration(
                                                fillColor: Color.fromARGB(
                                                    255, 216, 216, 216),
                                                filled: true,
                                                border: InputBorder.none,
                                                hintText:
                                                    "Exp Date (Ex: 2025-5)",
                                                hintStyle: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0)),
                                                prefixIcon: Icon(
                                                  Icons.date_range,
                                                  color: primaryColor,
                                                ),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () async {
                                                if (cardNumber.isEmpty &&
                                                    csv.isEmpty &&
                                                    expDate.isEmpty) {
                                                  showToastMessage(
                                                      "All Field are required!");
                                                } else {
                                                  setState(() {
                                                    loading = true;
                                                  });
                                                  Navigator.of(context).pop();
                                                  Map data = {
                                                    "payment_type": "stripe",
                                                    "card_number": cardNumber,
                                                    "csv": csv,
                                                    "exp_date": expDate,
                                                    "is_default": 1
                                                  };

                                                  var response =
                                                      await paymentController
                                                          .addCard(data);

                                                  print(response);
                                                  setState(() {
                                                    loading = false;
                                                  });
                                                  getCardData();
                                                }
                                              },
                                              child: loading
                                                  ? SizedBox(
                                                      height: 20.h,
                                                      width: 20.w,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  : Text("Add Card"),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      deepPrimaryColor),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Text("Add card"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: deepPrimaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color.fromARGB(255, 128, 128, 128),
                          ),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                "Price",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    // fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              trailing: Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                "\$" +
                                    displayCourse[0]["discount_price"]
                                        .toString(),
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    // fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            Divider(),
                            ListTile(
                              title: Text(
                                "Discount",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    // fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              trailing: Text(
                                "-\$" + discount.toString(),
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    // fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            Divider(),
                            ListTile(
                              title: Text(
                                "Total",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              trailing: Text(
                                "\$" + total.toString(),
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.h,
                )
              ],
            ),
          ),
          Positioned(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    print("LOG:: co");
                    print(widget.course_id);
                    print(widget.coupon_id);
                    print(cardId);
                    print(widget.schedule_id);
                    Map orderData = {
                      "course_id": widget.course_id,
                      "schedule_id": widget.schedule_id,
                      "coupon_id": widget.coupon_id,
                      "card_id": cardId,
                    };
                    if (cardId == null) {
                      showToastMessage("Please select a card!");
                    } else {
                      courseController.placeeOrder(orderData);
                    }
                  },
                  child: Container(
                    height: 50.h,
                    color: primaryColor,
                    child: Center(
                      child: !courseController.loadingPay.value
                          ? Text(
                              "Pay Now",
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
                )),
          ),
        ]),
      ),
    ));
  }
}
