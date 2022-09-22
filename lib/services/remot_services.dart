// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:dean/models/User.dart';
import 'package:dean/utilities/api.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  // var abc = baseUrl;
  static var client = http.Client();

  static CreateUser(userInfo) async {
    String message = "";
    String url = baseUrl + "/sign-up";
    // String url = 'https://jsonplaceholder.typicode.com/posts';
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
}
