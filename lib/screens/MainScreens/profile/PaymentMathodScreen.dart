// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:dean/controllers/PaymentController.dart';
import 'package:dean/screens/MainScreens/widgets/PaymentMethodCard.dart';
import 'package:dean/screens/MainScreens/widgets/Profilecard.dart';
import 'package:dean/utilities/showToastMessage.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final paymentController = Get.put(PaymentController());

  @override
  void initState() {
    paymentController.getCard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String cardNumber = "";
    String csv = "";
    String expDate = "";
    return SafeArea(
      child: Scaffold(
          body: Obx(
        () => SingleChildScrollView(
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
                      "Payment Method",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                    Container()
                  ],
                ),
              ),
              !paymentController.isLoading.value
                  ? Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 36.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cards",
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          for (int i = 0;
                              i < paymentController.paymentList.length;
                              ++i)
                            Dismissible(
                              onDismissed: (direction) {
                                paymentController.deleteCard(
                                    paymentController.paymentList[i]['id']);
                                paymentController.paymentList
                                    .remove(paymentController.paymentList[i]);
                              },
                              key: ObjectKey(
                                  paymentController.paymentList[i]['id']),
                              child: PaymentMethodCard(
                                id: i,
                              ),
                            ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
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
                                                backgroundColor:
                                                    deepPrimaryColor,
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
                                                  onPressed: () {
                                                    if (cardNumber.isEmpty &&
                                                        csv.isEmpty &&
                                                        expDate.isEmpty) {
                                                      showToastMessage(
                                                          "All Field are required!");
                                                    } else {
                                                      Map data = {
                                                        "payment_type":
                                                            "stripe",
                                                        "card_number":
                                                            cardNumber,
                                                        "csv": csv,
                                                        "exp_date": expDate,
                                                        "is_default": 1
                                                      };

                                                      paymentController
                                                          .addCard(data);

                                                      Navigator.of(context)
                                                          .pop();
                                                      Get.back();
                                                    }
                                                  },
                                                  child: !paymentController
                                                          .isLoadingAdd.value
                                                      ? Text("Add card")
                                                      : SizedBox(
                                                          height: 20.h,
                                                          width: 20.w,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                  style:
                                                      ElevatedButton.styleFrom(
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
                          )
                        ],
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 2.5),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: deepPrimaryColor,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      )),
    );
  }
}
