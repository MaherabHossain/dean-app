// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileCard extends StatefulWidget {
  Icon icon;
  String title;
  String route;
  ProfileCard(this.icon, this.title, this.route);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: InkWell(
        onTap: () {
          Get.toNamed(widget.route);
        },
        child: ListTile(
          tileColor: primaryColor,
          title: Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
          leading: widget.icon,
          iconColor: Colors.white,
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
