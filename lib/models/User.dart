// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.user,
  });

  User user;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.name,
    required this.email,
    this.provider,
    this.mobile,
    this.address,
    this.image,
    this.gender,
    this.phoneNo,
    this.creditLimit,
  });

  String name;
  String email;
  dynamic provider;
  dynamic mobile;
  dynamic address;
  dynamic image;
  dynamic gender;
  dynamic phoneNo;
  dynamic creditLimit;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        provider: json["provider"],
        mobile: json["mobile"],
        address: json["address"],
        image: json["image"],
        gender: json["gender"],
        phoneNo: json["phone_no"],
        creditLimit: json["credit_limit"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "provider": provider,
        "mobile": mobile,
        "address": address,
        "image": image,
        "gender": gender,
        "phone_no": phoneNo,
        "credit_limit": creditLimit,
      };
}
