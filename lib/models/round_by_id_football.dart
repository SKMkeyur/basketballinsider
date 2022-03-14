// To parse this JSON data, do
//
//     final roundByIdFootball = roundByIdFootballFromJson(jsonString);

import 'dart:convert';

RoundByIdFootball roundByIdFootballFromJson(String str) => RoundByIdFootball.fromJson(json.decode(str));

String roundByIdFootballToJson(RoundByIdFootball data) => json.encode(data.toJson());

class RoundByIdFootball {
  RoundByIdFootball({
    required this.data,
    required this.meta,
  });

  Data data;
  Meta meta;

  factory RoundByIdFootball.fromJson(Map<String, dynamic> json) => RoundByIdFootball(
    data: Data.fromJson(json["data"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "meta": meta.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.leagueId,
    required this.seasonId,
    required  this.stageId,
    required  this.start,
    required  this.end,
  });

  int id;
  int name;
  int leagueId;
  int seasonId;
  int stageId;
  DateTime start;
  DateTime end;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    leagueId: json["league_id"],
    seasonId: json["season_id"],
    stageId: json["stage_id"],
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "league_id": leagueId,
    "season_id": seasonId,
    "stage_id": stageId,
    "start": "${start.year.toString().padLeft(4, '0')}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}",
    "end": "${end.year.toString().padLeft(4, '0')}-${end.month.toString().padLeft(2, '0')}-${end.day.toString().padLeft(2, '0')}",
  };
}

class Meta {
  Meta({
    required  this.plans,
    required  this.sports,
  });

  List<Plan> plans;
  List<Sport> sports;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    plans: List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))),
    sports: List<Sport>.from(json["sports"].map((x) => Sport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
    "sports": List<dynamic>.from(sports.map((x) => x.toJson())),
  };
}

class Plan {
  Plan({
    required this.name,
    required  this.features,
    required this.requestLimit,
    required this.sport,
  });

  String name;
  String features;
  String requestLimit;
  String sport;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    name: json["name"],
    features: json["features"],
    requestLimit: json["request_limit"],
    sport: json["sport"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "features": features,
    "request_limit": requestLimit,
    "sport": sport,
  };
}

class Sport {
  Sport({
    required  this.id,
    required  this.name,
    required  this.current,
  });

  int id;
  String name;
  bool current;

  factory Sport.fromJson(Map<String, dynamic> json) => Sport(
    id: json["id"],
    name: json["name"],
    current: json["current"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "current": current,
  };
}
