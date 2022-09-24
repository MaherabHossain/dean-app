// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:dean/screens/MainScreens/course/AllCoursesScreen.dart';
import 'package:dean/screens/MainScreens/course/BootCampScreen.dart';
import 'package:dean/screens/MainScreens/HomeScreen.dart';

import 'package:dean/screens/MainScreens/course/MyCoursesScreen.dart';
import 'package:dean/screens/MainScreens/profile/profile.dart';
import 'package:dean/screens/MainScreens/profile/profileScreen.dart';
import 'package:dean/screens/splashScreen/splashScreen.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var token;

  var _pages = [
    HomeScreen(),
    AllCourseScreen(),
    BootCampSceen(),
    MyCourcesScreen(),
    ProfileScreen()
  ];
  bool loading = true;
  getToken() async {
    // print("hello");
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      token = prefs.getString("token");
      _pages = [
        HomeScreen(),
        AllCourseScreen(),
        BootCampSceen(),
        MyCourcesScreen(),
        token != null ? ProfileScreen() : SplashScreen(),
      ];
    });
    // print(token);
  }

  @override
  void initState() {
    // TODO: implement initState
    // print("state init");
    getToken();
    setState(() {
      loading = false;
    });

    if (token != null) {
      // print("token is not null");
    } else {
      // print("token is  null");
    }
    super.initState();
  }

  var initialPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: ((value) {
          setState(() {
            initialPage = value;
          });
        }),
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: initialPage,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Bootcamps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grading),
            label: 'My Cources',
          ),
          BottomNavigationBarItem(
            icon: InkWell(child: Icon(Icons.person)),
            label: 'Profile',
          ),
        ],
      ),
      body: _pages[initialPage],
    );
  }
}
