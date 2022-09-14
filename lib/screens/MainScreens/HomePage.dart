// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:dean/screens/MainScreens/AllCoursesScreen.dart';
import 'package:dean/screens/MainScreens/BootCampScreen.dart';
import 'package:dean/screens/MainScreens/HomeScreen.dart';
import 'package:dean/screens/MainScreens/MyCoursesScreen.dart';
import 'package:dean/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pages = [
    HomeScreen(),
    AllCourseScreen(),
    BootCampSceen(),
    MyCourcesScreen()
  ];
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
            icon: Icon(Icons.person),
            label: 'My Cources',
          ),
        ],
      ),
      body: _pages[initialPage],
    );
  }
}
