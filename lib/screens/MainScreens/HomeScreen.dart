// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:dean/screens/MainScreens/widgets/Categories.dart';
import 'package:dean/screens/MainScreens/widgets/CourseCard.dart';
import 'package:dean/screens/MainScreens/widgets/HeroSection.dart';
import 'package:dean/screens/MainScreens/widgets/Programs.dart';
import 'package:dean/screens/MainScreens/widgets/Slider.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List categoriesList = [
    {"name": "ALL", "selected": true},
    {"name": "Programming", "selected": false},
    {"name": "Software Testing", "selected": false},
    {"name": "JavaScript", "selected": false},
    {"name": "Economics", "selected": false},
    {"name": "Cyber Security", "selected": false},
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var gridView = GridView(
      // physics: NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 180, crossAxisSpacing: 10),
      children: [
        CourseCard(),
        CourseCard(),
        CourseCard(),
        CourseCard(),
        CourseCard(),
        CourseCard(),
      ],
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            SizedBox(
              height: 135.h,
              child: ListView(
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  ImageSlider(),
                  ImageSlider(),
                  ImageSlider(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: SizedBox(
                height: 50.h,
                child: ListView(
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Programs(),
                    Programs(),
                    Programs(),
                    Programs(),
                    Programs(),
                    Programs(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 15.h),
              child: SizedBox(
                height: 25.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            categoriesList[index]['selected'] = true;
                          });

                          for (var i = 0; i < categoriesList.length; i++) {
                            if (i != index) {
                              setState(() {
                                categoriesList[i]['selected'] = false;
                              });
                            }
                          }
                          print(categoriesList[index]['name']);
                          print(categoriesList[index]['selected']);
                        },
                        child: Categories(categoriesList[index]['selected'],
                            categoriesList[index]['name']));
                  }),
                  itemCount: categoriesList.length,
                ),
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 139, 139, 139), //color of divider
              height: 1, //height spacing of divider
              thickness: 1, //thickness of divier line
              indent: 15.w, //spacing at the start of divider
            ),
            // Expanded(
            //   child: ListView(
            //     children: [
            //       GridView.count(
            //         childAspectRatio: MediaQuery.of(context).size.width /
            //             (MediaQuery.of(context).size.height / 4),
            //         crossAxisCount: 2,
            //         physics:
            //             NeverScrollableScrollPhysics(), // to disable GridView's scrolling
            //         shrinkWrap: true, // You won't see infinite size error
            //         children: <Widget>[
            //           CourseCard(),
            //           CourseCard(),
            //           CourseCard(),
            //         ],
            //       ),
            //     ],
            //   ),
            // )
            // Expanded(
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 20.w),
            //     child: Container(
            //       child: gridView,
            //     ),
            //   ),
            // )

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Column(
                children: [
                  for (int i = 0; i < 10; i += 2)
                    Row(
                      children: [
                        CourseCard(),
                        SizedBox(
                          width: 10.w,
                        ),
                        CourseCard(),
                      ],
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
