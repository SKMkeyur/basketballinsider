// To parse this JSON data, do
//
//     final status = statusFromJson(jsonString);

import 'dart:convert';

Status statusFromJson(String str) => Status.fromJson(json.decode(str));

String statusToJson(Status data) => json.encode(data.toJson());

class Status {
  Status({
    this.status,
    this.data,
  });

  String? status;
  Data? data;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.ip,
    this.matchId,
    this.matchType,
  });

  String? id;
  String? ip;
  String? matchId;
  String? matchType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    ip: json["ip"],
    matchId: json["match_id"],
    matchType: json["matchType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ip": ip,
    "match_id": matchId,
    "matchType": matchType,
  };
}
