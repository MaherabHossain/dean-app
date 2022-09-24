// ignore_for_file: prefer_const_constructors

import 'package:dean/screens/MainScreens/profile/EditProfileScreen.dart';
import 'package:dean/screens/MainScreens/profile/profileScreen.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return ProfileScreen();
                case '/edit-profile':
                  return EditProfileScreen();
                case '/payment-method':
                // return EditProfileScreen();
              }
              return ProfileScreen();
            });
      },
    );
  }
}
