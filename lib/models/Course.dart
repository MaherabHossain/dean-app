// To parse this JSON data, do
//
//     final Course = CourseFromJson(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

List<Course> CourseFromJson(String str) =>
    List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));

String CourseToJson(List<Course> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Course {
  Course({
    this.id,
    this.title,
    this.slug,
    this.category,
    this.subCategory,
    this.description,
    this.image,
    this.classType,
    this.video,
    this.enroll,
    this.hours,
    this.meetingLink,
    this.classStartTime,
    this.referenceLink,
    this.materialLink,
    this.regularClass,
    this.reviewClass,
    this.sellingPrice,
    this.discountType,
    this.discount,
    this.discountPrice,
    this.priceActive,
    this.seoDescription,
    this.order,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.currculums,
    this.shcedules,
    this.faqs,
    this.videos,
    this.reviews,
    this.rating,
    this.reviewAble,
  });

  int? id;
  String? title;
  String? slug;
  Category? category;
  Category? subCategory;
  String? description;
  String? image;
  String? classType;
  dynamic? video;
  String? enroll;
  String? hours;
  dynamic? meetingLink;
  String? classStartTime;
  dynamic? referenceLink;
  dynamic? materialLink;
  RegularClass? regularClass;
  ReviewClass? reviewClass;
  String? sellingPrice;
  String? discountType;
  String? discount;
  String? discountPrice;
  String? priceActive;
  dynamic? seoDescription;
  String? order;
  String? status;
  String? createdBy;
  String? updatedBy;
  List<Currculum>? currculums;
  List<Shcedule>? shcedules;
  List<Faq>? faqs;
  List<dynamic>? videos;
  List<Review>? reviews;
  int? rating;
  bool? reviewAble;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        category: Category.fromJson(json["category"]),
        subCategory: json["subCategory"] == null
            ? null
            : Category.fromJson(json["subCategory"]),
        description: json["description"],
        image: json["image"],
        classType: json["class_type"],
        video: json["video"],
        enroll: json["enroll"] ?? null,
        hours: json["hours"] ?? null,
        meetingLink: json["meeting_link"],
        classStartTime: json["class_start_time"] ?? null,
        referenceLink: json["reference_link"],
        materialLink: json["material_link"],
        regularClass: regularClassValues.map[json["regular_class"]],
        reviewClass: reviewClassValues.map[json["review_class"]],
        sellingPrice: json["selling_price"],
        discountType: json["discount_type"] ?? null,
        discount: json["discount"],
        discountPrice: json["discount_price"],
        priceActive: json["price_active"],
        seoDescription: json["seo_description"],
        order: json["order"] ?? null,
        status: json["status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"] ?? null,
        currculums: List<Currculum>.from(
            json["currculums"].map((x) => Currculum.fromJson(x))),
        shcedules: List<Shcedule>.from(
            json["shcedules"].map((x) => Shcedule.fromJson(x))),
        faqs: List<Faq>.from(json["faqs"].map((x) => Faq.fromJson(x))),
        videos: List<dynamic>.from(json["videos"].map((x) => x)),
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        rating: json["rating"],
        reviewAble: json["reviewAble"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "category": category?.toJson(),
        "subCategory": subCategory == null ? null : subCategory?.toJson(),
        "description": description,
        "image": image,
        "class_type": classType,
        "video": video,
        "enroll": enroll ?? null,
        "hours": hours ?? null,
        "meeting_link": meetingLink,
        "class_start_time": classStartTime ?? null,
        "reference_link": referenceLink,
        "material_link": materialLink,
        "regular_class": regularClassValues.reverse[regularClass],
        "review_class": reviewClassValues.reverse[reviewClass],
        "selling_price": sellingPrice,
        "discount_type": discountType ?? null,
        "discount": discount,
        "discount_price": discountPrice,
        "price_active": priceActive,
        "seo_description": seoDescription,
        "order": order ?? null,
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy ?? null,
        "currculums": List<dynamic>.from(currculums!.map((x) => x.toJson())),
        "shcedules": List<dynamic>.from(shcedules!.map((x) => x.toJson())),
        "faqs": List<dynamic>.from(faqs!.map((x) => x.toJson())),
        "videos": List<dynamic>.from(videos!.map((x) => x)),
        "reviews": List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "rating": rating,
        "reviewAble": reviewAble,
      };
}

class Category {
  Category({
    required this.id,
    this.name,
    this.logo,
    this.slug,
    this.order,
  });

  int id;
  String? name;
  Logo? logo;
  String? slug;
  int? order;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        logo: json["logo"] == null ? null : logoValues.map[json["logo"]],
        slug: json["slug"],
        order: json["order"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo == null ? null : logoValues.reverse[logo],
        "slug": slug,
        "order": order ?? null,
      };
}

enum Logo {
  UPLOADED_CATEGORY_16310738666138364_AE5_DFD_PNG,
  UPLOADED_CATEGORY_16310731246138336485_EF3_PNG,
  UPLOADED_CATEGORY_16310734036138347_B92528_PNG,
  UPLOADED_CATEGORY_16310726706138319_E09_B5_B_PNG
}

final logoValues = EnumValues({
  "/uploaded/category/1631072670_6138319e09b5b.png":
      Logo.UPLOADED_CATEGORY_16310726706138319_E09_B5_B_PNG,
  "/uploaded/category/1631073124_6138336485ef3.png":
      Logo.UPLOADED_CATEGORY_16310731246138336485_EF3_PNG,
  "/uploaded/category/1631073403_6138347b92528.png":
      Logo.UPLOADED_CATEGORY_16310734036138347_B92528_PNG,
  "/uploaded/category/1631073866_6138364ae5dfd.png":
      Logo.UPLOADED_CATEGORY_16310738666138364_AE5_DFD_PNG
});

class Currculum {
  Currculum({
    this.id,
    this.time,
    this.startDate,
    this.endDate,
    this.title,
    this.description,
    this.status,
  });

  int? id;
  String? time;
  DateTime? startDate;
  DateTime? endDate;
  String? title;
  String? description;
  String? status;

  factory Currculum.fromJson(Map<String, dynamic> json) => Currculum(
        id: json["id"],
        time: json["time"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        title: json["title"],
        description: json["description"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "time": time,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate?.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "description": description,
        "status": status,
      };
}

class Faq {
  Faq({
    required this.id,
    this.title,
    this.description,
  });

  int id;
  String? title;
  String? description;

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        id: json["id"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
      };
}

enum RegularClass { SUNDAY_MONDAY_10_AM_2_PM, SATURDAY_SUNDAY_10_AM_2_PM }

final regularClassValues = EnumValues({
  "Saturday & Sunday, 10am – 2pm": RegularClass.SATURDAY_SUNDAY_10_AM_2_PM,
  "Sunday & Monday, 10am – 2pm": RegularClass.SUNDAY_MONDAY_10_AM_2_PM
});

enum ReviewClass {
  THURSDAY_9_AM_10_AM,
  THURSDAY_9_PM_10_PM,
  THURSDAY_5_PM_9_PM
}

final reviewClassValues = EnumValues({
  "Thursday, 5pm-9pm": ReviewClass.THURSDAY_5_PM_9_PM,
  "Thursday, 9am-10am": ReviewClass.THURSDAY_9_AM_10_AM,
  "Thursday, 9pm-10pm": ReviewClass.THURSDAY_9_PM_10_PM
});

class Review {
  Review({
    this.rating,
    this.comment,
    this.isApprove,
  });

  String? rating;
  String? comment;
  String? isApprove;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json["rating"],
        comment: json["comment"],
        isApprove: json["is_approve"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "comment": comment,
        "is_approve": isApprove,
      };
}

class Shcedule {
  Shcedule({
    this.id,
    this.startDate,
    this.days,
    this.startAt,
  });

  int? id;
  String? startDate;
  String? days;
  String? startAt;

  factory Shcedule.fromJson(Map<String, dynamic> json) => Shcedule(
        id: json["id"],
        startDate: json["start_date"],
        days: json["days"],
        startAt: json["start_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start_date": startDate,
        "days": days,
        "start_at": startAt,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
