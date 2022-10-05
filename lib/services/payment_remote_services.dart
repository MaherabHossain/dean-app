// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:dean/utilities/api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PaymentRemoteServices {
  static var client = http.Client();
  static getCard() async {
    String url = baseUrl + "/cards";
    Map data = {};
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
    String jsonString = response.body;
    print(jsonString);
    var jsonData;
    try {
      jsonData = jsonDecode(jsonString);
    } catch (e) {
      jsonData = [];
      data = {
        "status": false,
        "message": "Something went wrong !1 ",
      };
      return data;
    }

    if (response.statusCode == 200) {
      // remove token from local storage
      if (jsonData['data'] != null) {
        data = {
          "status": true,
          "message": "Successfully Fetch Card data!",
          "card": jsonData["data"]["card"]
        };
        return data;
      }
    }
    data = {
      "status": false,
      "message": "Something went wrong !2",
    };
    return data;
  }

  static addCard(cardData) async {
    String url = baseUrl + "/add-card";
    Map data = {};
    final prefs = await SharedPreferences.getInstance();
    var _token = prefs.getString("token");
    String token = "Bearer " + _token!;
    var response = await client.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          "Authorization": token,
        },
        body: jsonEncode(cardData));
    String jsonString = response.body;
    print(jsonString);
    var jsonData;
    try {
      jsonData = jsonDecode(jsonString);
    } catch (e) {
      jsonData = [];
      data = {
        "status": false,
        "message": "Something went wrong ! try again",
      };
      return data;
    }

    if (response.statusCode == 200) {
      // remove token from local storage
      if (jsonData['data'] != null) {
        data = {
          "status": true,
          "message": "Successfully Added Card!",
          "card": jsonData["data"]["card"]
        };
        return data;
      }
    }
    data = {
      "status": false,
      "message": "Something went wrong ! try again",
    };
    return data;
  }

  static deleteCard(id) async {
    String url = baseUrl + "/cards/" + id.toString();
    Map data = {};
    final prefs = await SharedPreferences.getInstance();
    var _token = prefs.getString("token");
    String token = "Bearer " + _token!;
    var response = await client.delete(
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
        "message": "Something went wrong !1 ",
      };
      return data;
    }

    if (response.statusCode == 200) {
      // remove token from local storage
      if (jsonData['message'] != null) {
        data = {
          "status": true,
          "message": "Successfully Deleted Card !",
        };
        return data;
      }
    }
    data = {
      "status": false,
      "message": "Something went wrong !2",
    };
    return data;
  }

  static getTransaction() async {
    String url = baseUrl + "/transactions";
    Map data = {};
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
    String jsonString = response.body;
    print(jsonString);
    var jsonData;
    try {
      jsonData = jsonDecode(jsonString);
    } catch (e) {
      jsonData = [];
      data = {
        "status": false,
        "message": "Something went wrong !",
      };
      return data;
    }

    if (response.statusCode == 200) {
      // remove token from local storage
      if (jsonData['data'] != null) {
        data = {
          "status": true,
          "message": "Trnsaction history",
          "transactions": jsonData['data']['transactions'],
        };
        return data;
      }
    }
    data = {
      "status": false,
      "message": "Something went wrong !",
    };
    return data;
  }
}
