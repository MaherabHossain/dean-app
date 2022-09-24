import 'dart:convert';

import 'package:dean/utilities/api.dart';
import 'package:http/http.dart' as http;

class CategoryRemoteServices {
  static var client = http.Client();

  static getCategories() async {
    print("LOG::: Categories api calling..");
    Map data = {};
    String message = "";
    String url = baseUrl + "/categories";
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

      data = {
        "status": false,
        "message": "Something went wrong",
      };
      return data;
    }
    if (response.statusCode == 200) {
      if (jsonData['data'] != null) {
        data = {
          "status": true,
          "message": "success",
          "categories": jsonData['data']['catyegories']
        };

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
