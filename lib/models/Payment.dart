// To parse this JSON data, do
//
//     final Payment = PaymentFromJson(jsonString);

import 'dart:convert';

List<Payment> PaymentFromJson(String str) =>
    List<Payment>.from(json.decode(str).map((x) => Payment.fromJson(x)));

String PaymentToJson(List<Payment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Payment {
  Payment({
    required this.id,
    this.paymentType,
    required this.cardNumber,
    required this.csv,
    required this.expDate,
    this.isDefault,
  });

  int id;
  String? paymentType;
  String cardNumber;
  String csv;
  String expDate;
  int? isDefault;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        paymentType: json["payment_type"],
        cardNumber: json["card_number"],
        csv: json["csv"],
        expDate: json["exp_date"],
        isDefault: json["is_default"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "payment_type": paymentType,
        "card_number": cardNumber,
        "csv": csv,
        "exp_date": expDate,
        "is_default": isDefault,
      };
}
