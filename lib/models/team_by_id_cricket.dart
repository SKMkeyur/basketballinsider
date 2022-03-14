// To parse this JSON data, do
//
//     final getTeamByIdCricket = getTeamByIdCricketFromJson(jsonString);

import 'dart:convert';

GetTeamByIdCricket getTeamByIdCricketFromJson(String str) => GetTeamByIdCricket.fromJson(json.decode(str));

String getTeamByIdCricketToJson(GetTeamByIdCricket data) => json.encode(data.toJson());

class GetTeamByIdCricket {
  GetTeamByIdCricket({
    this.data,
  });

  Data? data;

  factory GetTeamByIdCricket.fromJson(Map<String, dynamic> json) => GetTeamByIdCricket(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.resource,
    this.id,
    this.name,
    this.code,
    this.imagePath,
    this.countryId,
    this.nationalTeam,
    this.updatedAt,
  });

  String? resource;
  int? id;
  String? name;
  String? code;
  String? imagePath;
  int? countryId;
  bool? nationalTeam;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    resource: json["resource"],
    id: json["id"],
    name: json["name"],
    code: json["code"],
    imagePath: json["image_path"],
    countryId: json["country_id"],
    nationalTeam: json["national_team"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "resource": resource,
    "id": id,
    "name": name,
    "code": code,
    "image_path": imagePath,
    "country_id": countryId,
    "national_team": nationalTeam,
    "updated_at": updatedAt!.toIso8601String(),
  };
}
