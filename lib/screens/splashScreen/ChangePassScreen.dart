// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:dean/controllers/AuthController.dart';
import 'package:dean/utilities/showToastMessage.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassScreen extends StatefulWidget {
  var token;
  ChangePassScreen({Key? key, this.token}) : super(key: key);

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  final authController = Get.put(AuthController());
  var pass = "";
  var confPass = "";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    print(widget.token);
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
                  'Change Password',
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
                        obscureText: true,
                        onChanged: ((value) {
                          setState(() {
                            pass = value;
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
                          hintText: "Password",
                          hintStyle: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        obscureText: true,
                        onChanged: ((value) {
                          setState(() {
                            confPass = value;
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
                          hintText: "Confirm password",
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
                          onPressed: () {
                            if (pass.length < 6) {
                              showToastMessage("minimum password length is 6");
                              return;
                            }
                            if (pass.length > 5 && pass == confPass) {
                              // authController.verifyOtp(widget.email, otp);
                              authController.changePassword(
                                  widget.token, pass, confPass);
                            } else {
                              showToastMessage(
                                  "Password and confirm password are not same!");
                            }
                          },
                          child: authController.isLoading.value
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Change Password',
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
