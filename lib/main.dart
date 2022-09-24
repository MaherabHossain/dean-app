// ignore_for_file: prefer_const_constructors

import 'package:dean/screens/MainScreens/HomePage.dart';
import 'package:dean/screens/MainScreens/author/AuthorScreen.dart';
import 'package:dean/screens/MainScreens/course/AllCoursesScreen.dart';
import 'package:dean/screens/MainScreens/course/BootCampScreen.dart';
import 'package:dean/screens/MainScreens/HomeScreen.dart';
import 'package:dean/screens/MainScreens/course/CheckOutScreen.dart';
import 'package:dean/screens/MainScreens/course/CourseDetailsScreen.dart';
import 'package:dean/screens/MainScreens/course/CourseVideoScreen.dart';
import 'package:dean/screens/MainScreens/course/MyCoursesScreen.dart';
import 'package:dean/screens/MainScreens/course/SelectBatchScreen.dart';
import 'package:dean/screens/MainScreens/explore/ExploreDetailsScreen.dart';
import 'package:dean/screens/MainScreens/explore/ExploreScreen.dart';
import 'package:dean/screens/MainScreens/profile/EditProfileScreen.dart';
import 'package:dean/screens/MainScreens/profile/PaymentMathodScreen.dart';
import 'package:dean/screens/MainScreens/profile/TransactionScreen.dart';
import 'package:dean/screens/MainScreens/profile/profileScreen.dart';
import 'package:dean/screens/splashScreen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dean',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Dean'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: ((context, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
            getPages: [
              GetPage(
                name: '/splash',
                page: () => SplashScreen(),
              ), // Dynamic route
              GetPage(
                name: '/home',
                page: () => HomeScreen(),
              ),
              GetPage(
                name: '/all-cources',
                page: () => AllCourseScreen(),
              ),

              /// Dynamic route
              GetPage(
                name: '/all-bootcamp',
                page: () => BootCampSceen(),
              ),

              /// Dynamic route
              GetPage(
                name: '/my-cources',
                page: () => MyCourcesScreen(),
              ),

              /// Dynamic route
              GetPage(
                name: '/profile',
                page: () => ProfileScreen(),
              ),

              //Dynamic route
              GetPage(
                name: '/edit-profile',
                page: () => EditProfileScreen(),
              ),
              GetPage(
                name: '/payment-method',
                page: () => PaymentMethodScreen(),
              ),
              GetPage(
                name: '/transaction-history',
                page: () => TransactionScreen(),
              ),
              // GetPage(
              //   name: '/course-details',
              //   page: () => CoursedetailsScreen(),
              // ),
              GetPage(
                name: '/select-batch',
                page: () => SelectBatchScreen(),
              ),
              GetPage(
                name: '/check-out',
                page: () => CheckOutScreen(),
              ),
              GetPage(
                name: '/explore',
                page: () => ExploreScreen(),
              ),
              GetPage(
                name: '/explore-details',
                page: () => ExploreDetailsScreen(),
              ),
              GetPage(
                name: '/course-video',
                page: () => CourseVideoScreen(),
              ),
              GetPage(
                name: '/author',
                page: () => AuthorScreen(),
              ),

              /// Dynamic route
            ],
          )),
    );
  }
}
