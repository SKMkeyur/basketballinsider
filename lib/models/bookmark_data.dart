// To parse this JSON data, do
//
//     final value = valueFromJson(jsonString);

import 'dart:convert';

List<Value> valueFromJson(String str) => List<Value>.from(json.decode(str).map((x) => Value.fromJson(x)));

String valueToJson(List<Value> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Value {
  Value({
    required this.id,
    required this.siteId,
    required  this.siteTitle,
    required this.siteUrl,
    required this.sitePromocode,
    required this.siteRatings,
    required  this.siteFeature1,
    required this.siteFeature2,
    required this.siteFeature3,
    required this.siteFeature4,
    required this.siteFeature5,
    required this.siteFeature6,
    required this.siteLogo,
    required this.siteAddedDate,
    required this.siteCons1,
    required  this.siteCons2,
    required  this.siteCons3,
    required this.siteCons4,
    required this.siteCons5,
    required this.siteCons6,
    required  this.siteShortDescription,
    required  this.siteLongDescrtiption,
    required this.siteBonus,
    required this.siteBgImage,
  });

  int? id;
  String? siteId;
  String? siteTitle;
  String? siteUrl;
  String? sitePromocode;
  String? siteRatings;
  String? siteFeature1;
  String? siteFeature2;
  String? siteFeature3;
  String? siteFeature4;
  String? siteFeature5;
  String? siteFeature6;
  String? siteLogo;
  String? siteAddedDate;
  String? siteCons1;
  String? siteCons2;
  String? siteCons3;
  String? siteCons4;
  String? siteCons5;
  String? siteCons6;
  String? siteShortDescription;
  String? siteLongDescrtiption;
  String? siteBonus;
  String? siteBgImage;

  factory Value.fromJson(Map<String, Object?> json) => Value(
    id: json["id"] == null ? null : json["id"] as int?,
    siteId: json["siteId"] as String?,
    siteTitle: json["siteTitle"] as String?,
    siteUrl: json["siteUrl"] as String?,
    sitePromocode: json["sitePromocode"] as String?,
    siteRatings: json["siteRatings"]  as String?,
    siteFeature1: json["siteFeature1"] as String?,
    siteFeature2: json["siteFeature2"] as String?,
    siteFeature3: json["siteFeature3"] as String?,
    siteFeature4: json["siteFeature4"] as String?,
    siteFeature5: json["siteFeature5"] as String?,
    siteFeature6: json["siteFeature6"] as String?,
    siteLogo: json["siteLogo"] as String?,
    siteAddedDate: json["siteAddedDate"].toString() as String?,
    siteCons1: json["siteCons1"] as String?,
    siteCons2: json["siteCons2"] as String?,
    siteCons3: json["siteCons3"] as String?,
    siteCons4: json["siteCons4"] as String?,
    siteCons5: json["siteCons5"] as String?,
    siteCons6: json["siteCons6"] as String?,
    siteShortDescription: json["siteShortDescription"] as String?,
    siteLongDescrtiption: json["siteLongDescrtiption"] as String?,
    siteBonus: json["siteBonus"] as String?,
    siteBgImage: json["siteBgImage"] as String?,
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "siteId": siteId,
    "siteTitle": siteTitle,
    "siteUrl": siteUrl,
    "sitePromocode": sitePromocode,
    "siteRatings": siteRatings,
    "siteFeature1": siteFeature1,
    "siteFeature2": siteFeature2,
    "siteFeature3": siteFeature3,
    "siteFeature4": siteFeature4,
    "siteFeature5": siteFeature5,
    "siteFeature6": siteFeature6,
    "siteAddedDate": siteAddedDate,
    "siteLogo": siteLogo,
    "siteCons1": siteCons1,
    "siteCons2": siteCons2,
    "siteCons3": siteCons3,
    "siteCons4": siteCons4,
    "siteCons5": siteCons5,
    "siteCons6": siteCons6,
    "siteShortDescription": siteShortDescription,
    "siteLongDescrtiption": siteLongDescrtiption,
    "siteBonus": siteBonus,
    "siteBgImage": siteBgImage,
  };
}
