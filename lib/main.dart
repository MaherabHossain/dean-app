// ignore_for_file: prefer_const_constructors

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
            home: SplashScreen(),
            getPages: [
              GetPage(
                name: '/splash',
                page: () => SplashScreen(),
              ), // Dynamic route
            ],
          )),
    );
  }
}
