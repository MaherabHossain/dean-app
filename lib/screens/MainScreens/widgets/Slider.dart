// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:dean/utilities/utility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  String url;
  ImageSlider({Key? key, required this.url}) : super(key: key);

  @override
  State<ImageSlider> createState() => _SliderState();
}

class _SliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Container(
      // padding: EdgeInsets.all(15),
      child: Container(
        // height: 135.h,
        // width: 280.h,
        padding: EdgeInsets.all(15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            widget.url,
            fit: BoxFit.cover,
            // height: 200.h,
            // width: 280.h,
          ),
        ),
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(20), color: primaryColor),
      ),
    );
  }
}
