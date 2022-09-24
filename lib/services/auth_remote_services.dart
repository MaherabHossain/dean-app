// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:dean/models/User.dart';
import 'package:dean/utilities/api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRemoteServices {
  // var abc = baseUrl;
  static var client = http.Client();

  static CreateUser(userInfo) async {
    String message = "";
    String url = baseUrl + "/sign-up";

    Map<String, String> body = {
      "name": userInfo[0],
      "email": userInfo[1],
      "password": userInfo[2],
    };
    var response = await client.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
        },
        body: jsonEncode(body));
    Map data = {};
    var jsonString = response.body;
    var jsonData;
    try {
      jsonData = jsonDecode(jsonString);
    } catch (e) {
      jsonData = [];
      data = {
        "status": false,
        "message": "Something went wrong",
      };
      return data;
    }
    // print(jsonData['errors']['password'] != null);

    if (response.statusCode == 200) {
      if (jsonData['data'] != null) {
        data = {
          "status": true,
          "message": "Account create successfully",
        };
        return data;
      }
      data = {
        "status": false,
        "message": "Something went wrong",
      };
      return data;
    } else if (response.statusCode == 422) {
      if (jsonData['errors']['email'] != null) {
        message += "| check email again |";
        data = {
          "status": false,
          "message": message,
        };
      }
      if (jsonData['errors']['password'] != null) {
        message += "| password must be 6 charecter |";
        data = {
          "status": false,
          "message": message,
        };
      }
      return data;
    }
  }

  static login(userCredential) async {
    String message = "";
    Map data = {};
    String url = baseUrl + "/login";
    Map<String, String> body = {
      "email": userCredential[0],
      "password": userCredential[1],
    };

    var response = await client.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
        },
        body: jsonEncode(body));
    var jsonString = response.body;

    var jsonData;
    try {
      jsonData = jsonDecode(jsonString);
    } catch (e) {
      jsonData = [];
      data = {
        "status": false,
        "message": "Something went wrong",
      };
    }
    // print(jsonData['data']);
    if (response.statusCode == 200) {
      // all ok
      print("from ok");
      if (jsonData['data'] != null) {
        // print(jsonData['data']['user']);
        data = {
          "status": true,
          "message": "Login Successfull",
          "access": jsonData['data']['access'],
          "user": jsonData['data']['user'],
        };
        return data;
      }
    } else if (response.statusCode == 400) {
      // invalid
      data = {"status": false, "message": "Invalid Email or Password!"};

      return data;
    } else {
      // something wrong
      data = {"status": false, "message": "Something went wrong! try again"};
    }
    return null;
  }

  static logOut() async {
    String url = baseUrl + "/logout";
    Map data = {};
    final prefs = await SharedPreferences.getInstance();
    var _token = prefs.getString("token");
    String token = "Bearer " + _token!;
    var response = await client.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        "Authorization": token,
      },
    );
    String jsonString = response.body;
    print(jsonString);
    var jsonData;
    try {
      jsonData = jsonDecode(jsonString);
    } catch (e) {
      jsonData = [];
      data = {
        "status": false,
        "message": "Something went wrong 1 ",
      };
      return data;
    }

    if (response.statusCode == 200) {
      // remove token from local storage
      final success = await prefs.remove('token');
      final success_user = await prefs.remove('userInfo');
      final token_expires_at = await prefs.remove('token_expires_at');
      if (success_user && success && token_expires_at) {
        if (jsonData['message'] != null) {
          data = {
            "status": true,
            "message": "Successfully logged out!",
          };
          return data;
        }
      }
    }
    data = {
      "status": false,
      "message": "Something went wrong 2",
    };
    return data;
  }
}
