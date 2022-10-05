// ignore_for_file: prefer_interpolation_to_compose_strings, unused_local_variable, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dean/utilities/api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CourseRemoteServices {
  static var client = http.Client();

  static getCources() async {
    Map data = {};
    String message = "";
    String url = baseUrl + "/courses";
    var response = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
      },
    );
    var jsonString = response.body;
    print(response.statusCode);
    var jsonData;
    try {
      jsonData = jsonDecode(jsonString);
    } catch (e) {
      jsonData = [];
      print("LOG::: Wrong while decode json");
      data = {
        "status": false,
        "message": "Something went wrong!",
      };
      return data;
    }
    if (response.statusCode == 200) {
      if (jsonData['data'] != null) {
        data = {
          "status": true,
          "message": "success",
          "courses": jsonData['data']['courses']
        };
        print("LOG::: printing the message from api");
        // print(jsonData['data']['courses'].length);
        return data;
      }
    }
    data = {
      "status": false,
      "message": "Something went wrong",
    };
    return data;
  }

  static applyCoupon(coupon) async {
    Map data = {};
    String message = "";
    String url = baseUrl + "/coupon/apply/" + coupon;
    final prefs = await SharedPreferences.getInstance();
    var _token = prefs.getString("token");
    String token = "Bearer " + _token!;
    var response = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        "Authorization": token,
      },
    );
    var jsonString = response.body;
    print(response.statusCode);
    var jsonData;
    try {
      jsonData = jsonDecode(jsonString);
    } catch (e) {
      jsonData = [];
      print("LOG::: Wrong while decode json");
      data = {
        "status": false,
        "message": "Something went wrong!",
      };
      return data;
    }
    if (response.statusCode == 200) {
      if (jsonData['data'] != null) {
        data = {
          "status": true,
          "message": "success",
          "coupon_id": jsonData['data']['coupon']['id'],
          "discount": jsonData['data']['coupon']['discount']
        };
        print("LOG::: printing the message from api");
        // print(jsonData['data']['courses'].length);
        return data;
      }
      if (jsonData['message'] != null) {
        data = {
          "status": false,
          "message": "invalid coupon!",
        };
        return data;
      }
    }
    data = {
      "status": false,
      "message": "Something went wrong",
    };
    return data;
  }

  static placeOrder(orderData) async {
    String message = "";
    Map data = {};
    String url = baseUrl + "/enroll-course";
    final prefs = await SharedPreferences.getInstance();
    var _token = prefs.getString("token");
    String token = "Bearer " + _token!;
    var response = await client.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          "Authorization": token,
        },
        body: jsonEncode(orderData));
    var jsonString = response.body;
    print(jsonString);
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

    if (response.statusCode == 200) {
      // all ok
      print("from ok");
      if (jsonData['data'] != null) {
        // print(jsonData['data']['user']);
        data = {
          "status": true,
          "message": "Order placed sucessfully!",
        };
        return data;
      }
    } else if (response.statusCode == 422) {
      // invalid
      data = {"status": false, "message": "Invalid Card!"};

      return data;
    } else if (response.statusCode == 500) {
      data = {"status": false, "message": "Invalid Card!"};
    } else {
      // something wrong
      data = {"status": false, "message": "Something went wrong! try again"};
    }
    return data;
  }

  static getMyCourses() async {
    Map data = {};
    String message = "";
    String url = baseUrl + "/my-course";
    final prefs = await SharedPreferences.getInstance();
    var _token = prefs.getString("token");
    String token = "Bearer " + _token!;
    var response = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        "Authorization": token,
      },
    );
    var jsonString = response.body;
    print(response.statusCode);
    var jsonData;
    try {
      jsonData = jsonDecode(jsonString);
    } catch (e) {
      jsonData = [];
      print("LOG::: Wrong while decode json");
      data = {
        "status": false,
        "message": "Something went wrong!",
      };
      return data;
    }
    if (response.statusCode == 200) {
      if (jsonData['data'] != null) {
        data = {
          "status": true,
          "message": "success",
          "courses": jsonData["data"]["course"],
        };
        print("LOG::: printing the message from api");
        // print(jsonData['data']['courses'].length);
        return data;
      }
    }
    data = {
      "status": false,
      "message": "Something went wrong",
    };
    return data;
  }
}
