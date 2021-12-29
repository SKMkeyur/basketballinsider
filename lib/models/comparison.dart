// To parse this JSON data, do
//
//     final comparison = comparisonFromJson(jsonString);

import 'dart:convert';

List<Comparison> comparisonFromJson(String str) => List<Comparison>.from(json.decode(str).map((x) => Comparison.fromJson(x)));

String comparisonToJson(List<Comparison> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comparison {


  late String id;
  late String title;
  late String promocode;
  late String bonus;


  Comparison({
    required this.id,
    required this.title,
    required this.promocode,
    required this.bonus,
  });
  factory Comparison.fromJson(Map<String, dynamic> json) => Comparison(
    id: json["id"],
    title: json["title"],
    promocode: json["promocode"],
    bonus: json["bonus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "promocode": promocode,
    "bonus": bonus,
  };
}
