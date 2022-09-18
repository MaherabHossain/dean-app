// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:dean/screens/MainScreens/widgets/Profilecard.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentMethodCard extends StatefulWidget {
  const PaymentMethodCard({super.key});

  @override
  State<PaymentMethodCard> createState() => _PaymentMethodCardState();
}

class _PaymentMethodCardState extends State<PaymentMethodCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Color.fromARGB(255, 233, 231, 231),
        leading: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 233, 231, 231),
          child: Image(image: AssetImage("assets/images/masterCard.png")),
        ),
        title: Text(
          "MASTERCARD",
          style: TextStyle(
              fontSize: 14.sp, color: Color.fromARGB(255, 170, 169, 166)),
        ),
        subtitle: Text(
          "127 ** **** **",
          style: TextStyle(color: Color.fromARGB(255, 59, 58, 58)),
        ),
        trailing: Container(
          padding: EdgeInsets.only(top: 15.h, right: 22.w),
          child: Column(
            children: [
              Text(
                "VALID",
                style: TextStyle(
                    fontSize: 14.sp, color: Color.fromARGB(255, 170, 169, 166)),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "14/3",
                style: TextStyle(color: Color.fromARGB(255, 59, 58, 58)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
