// To parse this JSON data, do
//
//     final fixtureByIdCricket = fixtureByIdCricketFromJson(jsonString);

import 'dart:convert';

FixtureByIdCricket fixtureByIdCricketFromJson(String str) => FixtureByIdCricket.fromJson(json.decode(str));

String fixtureByIdCricketToJson(FixtureByIdCricket data) => json.encode(data.toJson());

class FixtureByIdCricket {
  FixtureByIdCricket({
    this.data,
  });

  Data? data;

  factory FixtureByIdCricket.fromJson(Map<String, dynamic> json) => FixtureByIdCricket(
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
    this.leagueId,
    this.seasonId,
    this.stageId,
    this.round,
    this.localteamId,
    this.visitorteamId,
    this.startingAt,
    this.type,
    this.live,
    this.status,
    this.lastPeriod,
    this.note,
    this.venueId,
    this.tossWonTeamId,
    this.winnerTeamId,
    this.drawNoresult,
    this.firstUmpireId,
    this.secondUmpireId,
    this.tvUmpireId,
    this.refereeId,
    this.manOfMatchId,
    this.manOfSeriesId,
    this.totalOversPlayed,
    this.elected,
    this.superOver,
    this.followOn,
    this.localteamDlData,
    this.visitorteamDlData,
    this.rpcOvers,
    this.rpcTarget,
    this.weatherReport,
    this.batting,
    this.bowling,
    this.runs,
    this.scoreboards,
    this.balls,
    this.tosswon,
  });

  String? resource;
  int? id;
  int? leagueId;
  int? seasonId;
  int? stageId;
  String? round;
  int? localteamId;
  int? visitorteamId;
  DateTime? startingAt;
  String? type;
  bool? live;
  String? status;
  dynamic lastPeriod;
  String? note;
  int? venueId;
  int? tossWonTeamId;
  int? winnerTeamId;
  dynamic drawNoresult;
  int? firstUmpireId;
  int? secondUmpireId;
  int? tvUmpireId;
  int? refereeId;
  int? manOfMatchId;
  dynamic manOfSeriesId;
  dynamic totalOversPlayed;
  String? elected;
  bool? superOver;
  bool? followOn;
  TeamDlData? localteamDlData;
  TeamDlData? visitorteamDlData;
  dynamic rpcOvers;
  dynamic rpcTarget;
  List<dynamic>? weatherReport;
  List<dynamic>? batting;
  List<dynamic>? bowling;
  List<Run>? runs;
  List<dynamic>? scoreboards;
  List<dynamic>? balls;
  Tosswon? tosswon;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    resource: json["resource"],
    id: json["id"],
    leagueId: json["league_id"],
    seasonId: json["season_id"],
    stageId: json["stage_id"],
    round: json["round"],
    localteamId: json["localteam_id"],
    visitorteamId: json["visitorteam_id"],
    startingAt: DateTime.parse(json["starting_at"]),
    type: json["type"],
    live: json["live"],
    status: json["status"],
    lastPeriod: json["last_period"],
    note: json["note"],
    venueId: json["venue_id"],
    tossWonTeamId: json["toss_won_team_id"],
    winnerTeamId: json["winner_team_id"],
    drawNoresult: json["draw_noresult"],
    firstUmpireId: json["first_umpire_id"],
    secondUmpireId: json["second_umpire_id"],
    tvUmpireId: json["tv_umpire_id"],
    refereeId: json["referee_id"],
    manOfMatchId: json["man_of_match_id"],
    manOfSeriesId: json["man_of_series_id"],
    totalOversPlayed: json["total_overs_played"],
    elected: json["elected"],
    superOver: json["super_over"],
    followOn: json["follow_on"],
  //  localteamDlData: TeamDlData.fromJson(json["localteam_dl_data"]),
   // visitorteamDlData: TeamDlData.fromJson(json["visitorteam_dl_data"]),
   //  rpcOvers: json["rpc_overs"],
   //  rpcTarget: json["rpc_target"],
    // weatherReport: List<dynamic>.from(json["weather_report"].map((x) => x)),
    // batting: List<dynamic>.from(json["batting"].map((x) => x)),
    // bowling: List<dynamic>.from(json["bowling"].map((x) => x)),
    // runs: List<Run>.from(json["runs"].map((x) => Run.fromJson(x))),
    // scoreboards: List<dynamic>.from(json["scoreboards"].map((x) => x)),
    // balls: List<dynamic>.from(json["balls"].map((x) => x)),
    // tosswon: Tosswon.fromJson(json["tosswon"]),
  );

  Map<String, dynamic> toJson() => {
    "resource": resource,
    "id": id,
    "league_id": leagueId,
    "season_id": seasonId,
    "stage_id": stageId,
    "round": round,
    "localteam_id": localteamId,
    "visitorteam_id": visitorteamId,
    "starting_at": startingAt!.toIso8601String(),
    "type": type,
    "live": live,
    "status": status,
    "last_period": lastPeriod,
    "note": note,
    "venue_id": venueId,
    "toss_won_team_id": tossWonTeamId,
    "winner_team_id": winnerTeamId,
    "draw_noresult": drawNoresult,
    "first_umpire_id": firstUmpireId,
    "second_umpire_id": secondUmpireId,
    "tv_umpire_id": tvUmpireId,
    "referee_id": refereeId,
    "man_of_match_id": manOfMatchId,
    "man_of_series_id": manOfSeriesId,
    "total_overs_played": totalOversPlayed,
    "elected": elected,
    "super_over": superOver,
    "follow_on": followOn,
    "localteam_dl_data": localteamDlData!.toJson(),
    "visitorteam_dl_data": visitorteamDlData!.toJson(),
    "rpc_overs": rpcOvers,
    "rpc_target": rpcTarget,
    "weather_report": List<dynamic>.from(weatherReport!.map((x) => x)),
    "batting": List<dynamic>.from(batting!.map((x) => x)),
    "bowling": List<dynamic>.from(bowling!.map((x) => x)),
    "runs": List<dynamic>.from(runs!.map((x) => x.toJson())),
    "scoreboards": List<dynamic>.from(scoreboards!.map((x) => x)),
    "balls": List<dynamic>.from(balls!.map((x) => x)),
    "tosswon": tosswon!.toJson(),
  };
}

class TeamDlData {
  TeamDlData({
    this.score,
    this.overs,
    this.wicketsOut,
  });

  dynamic score;
  dynamic overs;
  dynamic wicketsOut;

  factory TeamDlData.fromJson(Map<String, dynamic> json) => TeamDlData(
    score: json["score"],
    overs: json["overs"],
    wicketsOut: json["wickets_out"],
  );

  Map<String, dynamic> toJson() => {
    "score": score,
    "overs": overs,
    "wickets_out": wicketsOut,
  };
}

class Run {
  Run({
    this.resource,
    this.id,
    this.fixtureId,
    this.teamId,
    this.inning,
    this.score,
    this.wickets,
    this.overs,
    this.pp1,
    this.pp2,
    this.pp3,
    this.updatedAt,
  });

  String? resource;
  int? id;
  int? fixtureId;
  int? teamId;
  int? inning;
  int? score;
  int? wickets;
  double? overs;
  String? pp1;
  dynamic pp2;
  dynamic pp3;
  DateTime? updatedAt;

  factory Run.fromJson(Map<String, dynamic> json) => Run(
    resource: json["resource"],
    id: json["id"],
    fixtureId: json["fixture_id"],
    teamId: json["team_id"],
    inning: json["inning"],
    score: json["score"],
    wickets: json["wickets"],
    overs: json["overs"].toDouble(),
    pp1: json["pp1"],
    pp2: json["pp2"],
    pp3: json["pp3"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "resource": resource,
    "id": id,
    "fixture_id": fixtureId,
    "team_id": teamId,
    "inning": inning,
    "score": score,
    "wickets": wickets,
    "overs": overs,
    "pp1": pp1,
    "pp2": pp2,
    "pp3": pp3,
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class Tosswon {
  Tosswon({
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

  factory Tosswon.fromJson(Map<String, dynamic> json) => Tosswon(
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
