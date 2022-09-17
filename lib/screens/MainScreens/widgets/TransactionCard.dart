// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:dean/screens/MainScreens/widgets/Profilecard.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TransactionCard extends StatefulWidget {
  const TransactionCard({super.key});

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      child: Column(
        children: [
          ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            // tileColor: Color.fromARGB(255, 233, 231, 231),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                image: NetworkImage(
                    "https://www.filepicker.io/api/file/sXz6u6kMQzK9uXkCwtPv"),
                height: 55.h,
              ),
            ),
            title: Text(
              "Python Advance Course ",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "04 Sep, 2022",
              style: TextStyle(color: Color.fromARGB(255, 59, 58, 58)),
            ),
            trailing: Container(
              padding: EdgeInsets.only(top: 15.h, bottom: 10.h, right: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$220",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "01:20pm",
                    style: TextStyle(color: Color.fromARGB(255, 59, 58, 58)),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Color.fromARGB(31, 17, 17, 17),
          )
        ],
      ),
    );
  }
}
