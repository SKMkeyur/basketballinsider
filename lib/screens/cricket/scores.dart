// To parse this JSON data, do
//
//     final scores = scoresFromJson(jsonString);

import 'dart:convert';

Scores01 scoresFromJson(String str) => Scores01.fromJson(json.decode(str));

String scoresToJson(Scores01 data) => json.encode(data.toJson());

class Scores01 {
  Scores01({
    this.data,
  });

  List<DatumScore>? data;

  factory Scores01.fromJson(Map<String, dynamic> json) => Scores01(
    data: List<DatumScore>.from(json["data"].map((x) => DatumScore.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumScore {
  DatumScore({
    this.resource,
    this.id,
    this.name,
    this.runs,
    this.four,
    this.six,
    this.bye,
    this.legBye,
    this.noball,
    this.noballRuns,
    this.isWicket,
    this.ball,
    this.out,
  });

  String? resource;
  dynamic id;
  String? name;
  dynamic runs;
  bool? four;
  bool? six;
  dynamic bye;
  dynamic legBye;
  dynamic noball;
  dynamic noballRuns;
  bool? isWicket;
  bool? ball;
  bool? out;

  factory DatumScore.fromJson(Map<String, dynamic> json) => DatumScore(
    resource: json["resource"],
    id: json["id"]==null?"":json["id"],
    name: json["name"],
    runs: json["runs"]==null?"":json["runs"],
    four: json["four"],
    six: json["six"],
    bye: json["bye"]==null?"":json["bye"],
    legBye: json["leg_bye"]==null?"":json["leg_bye"],
    noball: json["noball"]==null?"":json["noball"],
    noballRuns: json["noball_runs"]==null?"":json["noball_runs"],
    isWicket: json["is_wicket"],
    ball: json["ball"],
    out: json["out"],
  );

  Map<String, dynamic> toJson() => {
    "resource": resource,
    "id": id,
    "name": name,
    "runs": runs,
    "four": four,
    "six": six,
    "bye": bye,
    "leg_bye": legBye,
    "noball": noball,
    "noball_runs": noballRuns,
    "is_wicket": isWicket,
    "ball": ball,
    "out": out,
  };
}
