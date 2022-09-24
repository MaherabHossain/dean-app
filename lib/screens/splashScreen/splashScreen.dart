// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_propertietos_last, sort_child_properties_last

import 'package:dean/screens/MainScreens/HomePage.dart';
import 'package:dean/screens/MainScreens/HomeScreen.dart';
import 'package:dean/screens/splashScreen/loginScreen.dart';
import 'package:dean/screens/splashScreen/registerScreen.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      // bottomNavigationBar: Container(),
      body: Center(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              margin: EdgeInsets.only(top: 100.h),
              child: Image(
                image: AssetImage('assets/images/splashLogo.png'),
                height: 400.h,
              ),
            ),
            SizedBox(
              //height of button
              width: width / 1.2,
              child: ElevatedButton(
                onPressed: () {
                  Get.off(LoginScreen());
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  primary: primaryColor, // background
                  onPrimary: Colors.white, // foreground
                ),
              ),
            ),
            SizedBox(
              //height of button
              width: width / 1.2,
              child: ElevatedButton(
                onPressed: () {
                  Get.off(RegisterScreen());
                },
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 230, 230, 230), // background
                  onPrimary: Colors.black, // foreground
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
