
import 'dart:convert';

List<Site> siteFromJson(String str) => List<Site>.from(json.decode(str).map((x) => Site.fromJson(x)));

String siteToJson(List<Site> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Site {
  Site({
    required this.id,
    required this.title,
    required this.url,
    required this.promocode,
    required this.ratings,
    required this.feature1,
    required this.feature2,
    required this.feature3,
    required this.feature4,
    required this.logo,
    required this.addedDate,
    required this.feature5,
    required this.feature6,
    required this.cons1,
    required this.cons2,
    required this.cons3,
    required this.cons4,
    required this.cons5,
    required this.cons6,
    required this.shortDescription,
    required this.longDescription,
    required this.bonus,
    required this.bgImage,
  });

  late String id;
  String title;
  String url;
  String promocode;
  String ratings;
  String feature1;
  String feature2;
  String feature3;
  String feature4;
  String logo;
  DateTime addedDate;
  String feature5;
  String feature6;
  String cons1;
  String cons2;
  String cons3;
  String cons4;
  String cons5;
  String cons6;
  String shortDescription;
  String longDescription;
  String bonus;
  String bgImage;

  factory Site.fromJson(Map<String, dynamic> json) => Site(
    id: json["id"],
    title: json["title"],
    url: json["url"],
    promocode: json["promocode"],
    ratings: json["ratings"],
    feature1: json["feature1"],
    feature2: json["feature2"],
    feature3: json["feature3"],
    feature4: json["feature4"],
    logo: json["logo"],
    addedDate: DateTime.parse(json["added_date"]),
    feature5: json["feature5"],
    feature6: json["feature6"],
    cons1: json["cons1"],
    cons2: json["cons2"],
    cons3: json["cons3"],
    cons4: json["cons4"],
    cons5: json["cons5"],
    cons6: json["cons6"],
    shortDescription: json["short_description"],
    longDescription: json["long_description"],
    bonus: json["bonus"],
    bgImage: json["bg_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "url": url,
    "promocode": promocode,
    "ratings": ratings,
    "feature1": feature1,
    "feature2": feature2,
    "feature3": feature3,
    "feature4": feature4,
    "logo": logo,
    "added_date": addedDate.toIso8601String(),
    "feature5": feature5,
    "feature6": feature6,
    "cons1": cons1,
    "cons2": cons2,
    "cons3": cons3,
    "cons4": cons4,
    "cons5": cons5,
    "cons6": cons6,
    "short_description": shortDescription,
    "long_description": longDescription,
    "bonus": bonus,
    "bg_image": bgImage,
  };
}
