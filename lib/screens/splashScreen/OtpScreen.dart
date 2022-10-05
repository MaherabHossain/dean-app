// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:dean/controllers/AuthController.dart';
import 'package:dean/screens/splashScreen/ChangePassScreen.dart';
import 'package:dean/utilities/showToastMessage.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreen extends StatefulWidget {
  var email, otp;
  OtpScreen({Key? key, this.email, this.otp}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final authController = Get.put(AuthController());
  var otp = "";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    print(widget.email);
    print(widget.otp);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 139, 43, 43),
      body: Obx(
        () => SingleChildScrollView(
          child: Container(
            color: Color.fromARGB(255, 139, 43, 43),
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.only(top: 20),
            // color: primaryColor,
            child: Column(
              children: [
                Row(
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
                  ],
                ),
                Center(
                  child: Image(
                    image: AssetImage("assets/images/forgotPass.png"),
                    height: 250,
                  ),
                ),
                Text(
                  'OTP',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: ((value) {
                          setState(() {
                            otp = value;
                          });
                        }),
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: Color.fromARGB(255, 233, 223, 223),
                          filled: true,
                          // border: InputBorder.none,
                          hintText: "Enter OTP",
                          hintStyle: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        //height of button
                        width: width / 1.2,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (otp.isNotEmpty) {
                              var response = await authController.verifyOtp(
                                  widget.email, otp);
                              if (response != null) {
                                Get.to(ChangePassScreen(
                                  token: response['token'],
                                ));
                              }
                            } else {
                              showToastMessage("Please enter email!");
                            }
                          },
                          child: authController.isLoading.value
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Verify OTP',
                                  style: TextStyle(fontSize: 20),
                                ),
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor, // background
                            onPrimary: Colors.white, // foreground
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
