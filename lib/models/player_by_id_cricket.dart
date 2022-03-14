// To parse this JSON data, do
//
//     final playerByIdCricket = playerByIdCricketFromJson(jsonString);

import 'dart:convert';

PlayerByIdCricket playerByIdCricketFromJson(String str) => PlayerByIdCricket.fromJson(json.decode(str));

String playerByIdCricketToJson(PlayerByIdCricket data) => json.encode(data.toJson());

class PlayerByIdCricket {
  PlayerByIdCricket({
    this.data,
  });

  Data? data;

  factory PlayerByIdCricket.fromJson(Map<String, dynamic> json) => PlayerByIdCricket(
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
    this.countryId,
    this.firstname,
    this.lastname,
    this.fullname,
    this.imagePath,
    this.dateofbirth,
    this.gender,
    this.battingstyle,
    this.bowlingstyle,
    this.position,
    this.updatedAt,
    this.career,
  });

  String? resource;
  int? id;
  int? countryId;
  String? firstname;
  String? lastname;
  String? fullname;
  String? imagePath;
  DateTime? dateofbirth;
  String? gender;
  String? battingstyle;
  String? bowlingstyle;
  Position? position;
  DateTime? updatedAt;
  List<Career>? career;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    resource: json["resource"],
    id: json["id"],
    countryId: json["country_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    fullname: json["fullname"],
    imagePath: json["image_path"],
    dateofbirth: DateTime.parse(json["dateofbirth"]),
    gender: json["gender"],
    battingstyle: json["battingstyle"],
    bowlingstyle: json["bowlingstyle"],
    position: Position.fromJson(json["position"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    career: List<Career>.from(json["career"].map((x) => Career.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "resource": resource,
    "id": id,
    "country_id": countryId,
    "firstname": firstname,
    "lastname": lastname,
    "fullname": fullname,
    "image_path": imagePath,
    "dateofbirth": "${dateofbirth!.year.toString().padLeft(4, '0')}-${dateofbirth!.month.toString().padLeft(2, '0')}-${dateofbirth!.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "battingstyle": battingstyle,
    "bowlingstyle": bowlingstyle,
    "position": position!.toJson(),
    "updated_at": updatedAt!.toIso8601String(),
    "career": List<dynamic>.from(career!.map((x) => x.toJson())),
  };
}

class Career {
  Career({
    this.resource,
    this.type,
    this.seasonId,
    this.playerId,
    this.bowling,
    this.batting,
    this.updatedAt,
  });

  Resource? resource;
  Type? type;
  int? seasonId;
  int? playerId;
  Map<String, double>? bowling;
  Map<String, double>? batting;
  DateTime? updatedAt;

  factory Career.fromJson(Map<String, dynamic> json) => Career(
    resource: resourceValues.map![json["resource"]],
    type: typeValues.map![json["type"]],
    seasonId: json["season_id"],
    playerId: json["player_id"],
    bowling: json["bowling"] == null ? null : Map.from(json["bowling"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
    batting: Map.from(json["batting"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "resource": resourceValues.reverse[resource],
    "type": typeValues.reverse[type],
    "season_id": seasonId,
    "player_id": playerId,
    "bowling": bowling == null ? null : Map.from(bowling!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "batting": Map.from(batting!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

enum Resource { CAREERS }

final resourceValues = EnumValues({
  "careers": Resource.CAREERS
});

enum Type { T20, ODI, T20_I, TEST_5_DAY, TEST }

final typeValues = EnumValues({
  "ODI": Type.ODI,
  "T20": Type.T20,
  "T20I": Type.T20_I,
  "Test": Type.TEST,
  "Test/5day": Type.TEST_5_DAY
});

class Position {
  Position({
    this.resource,
    this.id,
    this.name,
  });

  String? resource;
  int? id;
  String? name;

  factory Position.fromJson(Map<String, dynamic> json) => Position(
    resource: json["resource"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "resource": resource,
    "id": id,
    "name": name,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
