// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dean/utilities/utility.dart';

class Categories extends StatefulWidget {
  bool isSelect;
  String name;
  Categories(this.isSelect, this.name);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      margin: EdgeInsets.only(right: 25.w),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                width: widget.isSelect ? 5 : 0, color: primaryColor)),
      ),
      child: Text(
        widget.name,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13.sp,
          color: widget.isSelect
              ? primaryColor
              : Color.fromARGB(255, 139, 139, 139),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
