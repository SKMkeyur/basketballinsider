// To parse this JSON data, do
//
//     final squadByTeamidSeasonIdCricket = squadByTeamidSeasonIdCricketFromJson(jsonString);

import 'dart:convert';

SquadByTeamidSeasonIdCricket squadByTeamidSeasonIdCricketFromJson(String str) => SquadByTeamidSeasonIdCricket.fromJson(json.decode(str));

String squadByTeamidSeasonIdCricketToJson(SquadByTeamidSeasonIdCricket data) => json.encode(data.toJson());

class SquadByTeamidSeasonIdCricket {
  SquadByTeamidSeasonIdCricket({
    this.data,
  });

  Data? data;

  factory SquadByTeamidSeasonIdCricket.fromJson(Map<String, dynamic> json) => SquadByTeamidSeasonIdCricket(
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
    this.squad,
  });

  String? resource;
  int? id;
  String? name;
  String? code;
  String? imagePath;
  int? countryId;
  bool? nationalTeam;
  DateTime? updatedAt;
  List<SquadElement>? squad;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    resource: json["resource"],
    id: json["id"],
    name: json["name"],
    code: json["code"],
    imagePath: json["image_path"],
    countryId: json["country_id"],
    nationalTeam: json["national_team"],
    updatedAt: DateTime.parse(json["updated_at"]),
    squad: List<SquadElement>.from(json["squad"].map((x) => SquadElement.fromJson(x))),
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
    "squad": List<dynamic>.from(squad!.map((x) => x.toJson())),
  };
}

class SquadElement {
  SquadElement({
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
    this.squad,
  });

  SquadResource? resource;
  int? id;
  int? countryId;
  String? firstname;
  String? lastname;
  String? fullname;
  String? imagePath;
  DateTime? dateofbirth;
  Gender? gender;
  Battingstyle? battingstyle;
  String? bowlingstyle;
  Position? position;
  DateTime? updatedAt;
  SquadSquad? squad;

  factory SquadElement.fromJson(Map<String, dynamic> json) => SquadElement(
    resource: squadResourceValues.map![json["resource"]],
    id: json["id"],
    countryId: json["country_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    fullname: json["fullname"],
    imagePath: json["image_path"],
    dateofbirth: DateTime.parse(json["dateofbirth"]),
    gender: genderValues.map![json["gender"]],
    battingstyle: battingstyleValues.map![json["battingstyle"]],
    bowlingstyle: json["bowlingstyle"] == null ? null : json["bowlingstyle"],
    position: Position.fromJson(json["position"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    squad: SquadSquad.fromJson(json["squad"]),
  );

  Map<String, dynamic> toJson() => {
    "resource": squadResourceValues.reverse[resource],
    "id": id,
    "country_id": countryId,
    "firstname": firstname,
    "lastname": lastname,
    "fullname": fullname,
    "image_path": imagePath,
    "dateofbirth": "${dateofbirth!.year.toString().padLeft(4, '0')}-${dateofbirth!.month.toString().padLeft(2, '0')}-${dateofbirth!.day.toString().padLeft(2, '0')}",
    "gender": genderValues.reverse[gender],
    "battingstyle": battingstyleValues.reverse[battingstyle],
    "bowlingstyle": bowlingstyle == null ? null : bowlingstyle,
    "position": position!.toJson(),
    "updated_at": updatedAt!.toIso8601String(),
    "squad": squad!.toJson(),
  };
}

enum Battingstyle { RIGHT_HAND_BAT, LEFT_HAND_BAT }

final battingstyleValues = EnumValues({
  "left-hand-bat": Battingstyle.LEFT_HAND_BAT,
  "right-hand-bat": Battingstyle.RIGHT_HAND_BAT
});

enum Gender { M }

final genderValues = EnumValues({
  "m": Gender.M
});

class Position {
  Position({
    this.resource,
    this.id,
    this.name,
  });

  PositionResource? resource;
  int? id;
  Name? name;

  factory Position.fromJson(Map<String, dynamic> json) => Position(
    resource: positionResourceValues.map![json["resource"]],
    id: json["id"],
    name: nameValues.map![json["name"]],
  );

  Map<String, dynamic> toJson() => {
    "resource": positionResourceValues.reverse[resource],
    "id": id,
    "name": nameValues.reverse[name],
  };
}

enum Name { BATSMAN, ALLROUNDER, WICKETKEEPER, BOWLER }

final nameValues = EnumValues({
  "Allrounder": Name.ALLROUNDER,
  "Batsman": Name.BATSMAN,
  "Bowler": Name.BOWLER,
  "Wicketkeeper": Name.WICKETKEEPER
});

enum PositionResource { POSITIONS }

final positionResourceValues = EnumValues({
  "positions": PositionResource.POSITIONS
});

enum SquadResource { PLAYERS }

final squadResourceValues = EnumValues({
  "players": SquadResource.PLAYERS
});

class SquadSquad {
  SquadSquad({
    this.seasonId,
  });

  int? seasonId;

  factory SquadSquad.fromJson(Map<String, dynamic> json) => SquadSquad(
    seasonId: json["season_id"],
  );

  Map<String, dynamic> toJson() => {
    "season_id": seasonId,
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
