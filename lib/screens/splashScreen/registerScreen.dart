// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:dean/screens/splashScreen/loginScreen.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passVisibility = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width / 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: height / 19),
                child: Center(
                  child: Image(
                    image: AssetImage("assets/images/splashLogo.png"),
                    height: 200,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 216, 216, 216),
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Enter your name",
                  hintStyle: TextStyle(
                      fontSize: 18.0, color: Color.fromARGB(255, 0, 0, 0)),
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Email',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 216, 216, 216),
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Enter your email",
                  hintStyle: TextStyle(
                      fontSize: 18.0, color: Color.fromARGB(255, 0, 0, 0)),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Password',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                cursorColor: Colors.black,
                obscureText: passVisibility,
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 216, 216, 216),
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Enter your password",
                  hintStyle: TextStyle(
                      fontSize: 18.0, color: Color.fromARGB(255, 0, 0, 0)),
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: primaryColor,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        passVisibility = !passVisibility;
                      });
                    },
                    child: Icon(
                      passVisibility ? Icons.visibility_off : Icons.visibility,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                //height of button
                width: width / 1.2,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Register'),
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor, // background
                    onPrimary: Colors.white, // foreground
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "OR",
                  style: TextStyle(color: Color.fromARGB(255, 194, 194, 194)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                //height of button
                width: width / 1.2,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(data)
                      Image(
                        image: AssetImage("assets/images/google.png"),
                        height: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('JOIN WITH GOOGLE')
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 230, 230, 230), // background
                    onPrimary: Colors.black, // foreground
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(data)
                  Text(
                    'Joined us before?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAll(LoginScreen());
                    },
                    child: Text(
                      ' Login',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
