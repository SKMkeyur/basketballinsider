// To parse this JSON data, do
//
//     final cricket = cricketFromJson(jsonString);

import 'dart:convert';

Cricket5 cricket5FromJson(String str) => Cricket5.fromJson(json.decode(str));

String cricketToJson(Cricket5 data) => json.encode(data.toJson());

class Cricket5 {
  Cricket5({
    required this.data,
  });

  Data data;

  factory Cricket5.fromJson(Map<String, dynamic> json) => Cricket5(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.resource,
    required this.id,
    required this.leagueId,
    required this.seasonId,
    required this.stageId,
    required this.round,
    required this.localteamId,
    required this.visitorteamId,
    required this.startingAt,
    required this.type,
    required this.live,
    required this.status,
    required this.lastPeriod,
    required this.note,
    required this.venueId,
    required this.tossWonTeamId,
    required this.winnerTeamId,
    required this.drawNoresult,
    required this.firstUmpireId,
    required this.secondUmpireId,
    required this.tvUmpireId,
    required this.refereeId,
    required this.manOfMatchId,
    required this.manOfSeriesId,
    required this.totalOversPlayed,
    required this.elected,
    required this.superOver,
    required this.followOn,
    required this.localteamDlData,
    required this.visitorteamDlData,
    required this.rpcOvers,
    required this.rpcTarget,
  //  required this.weatherReport,
    required this.localteam,
  });

  String resource;
  int id;
  int leagueId;
  int seasonId;
  int stageId;
  String round;
  int localteamId;
  int visitorteamId;
  DateTime startingAt;
  String type;
  bool live;
  String status;
  dynamic lastPeriod; //
  String note;
  int venueId;
  int tossWonTeamId;
  int winnerTeamId;
  dynamic drawNoresult; //
  int firstUmpireId;
  int secondUmpireId;
  int tvUmpireId;
  int refereeId;
  dynamic manOfMatchId; //
  dynamic manOfSeriesId; //
  dynamic totalOversPlayed;
  String elected;
  bool superOver;
  bool followOn;
  TeamDlData localteamDlData;
  TeamDlData visitorteamDlData;
  dynamic rpcOvers; //
  dynamic rpcTarget; //
 // List<dynamic> weatherReport;
  Localteam localteam;

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
    lastPeriod: json["last_period"]==null ? "" : json["last_period"],
    note: json["note"],
    venueId: json["venue_id"],
    tossWonTeamId: json["toss_won_team_id"],
    winnerTeamId: json["winner_team_id"],
    drawNoresult: json["draw_noresult"]==null ? "" : json["draw_noresult"],
    firstUmpireId: json["first_umpire_id"],
    secondUmpireId: json["second_umpire_id"],
    tvUmpireId: json["tv_umpire_id"],
    refereeId: json["referee_id"],
    manOfMatchId: json["man_of_match_id"]==null ? "" : json["man_of_match_id"],
    manOfSeriesId: json["man_of_series_id"]==null ? "" :  json["man_of_series_id"],
    totalOversPlayed: json["total_overs_played"]==null ? "" : json["total_overs_played"],
    elected: json["elected"],
    superOver: json["super_over"],
    followOn: json["follow_on"],
    localteamDlData: TeamDlData.fromJson(json["localteam_dl_data"]),
    visitorteamDlData: TeamDlData.fromJson(json["visitorteam_dl_data"]),
    rpcOvers: json["rpc_overs"]==null ? "" : json["rpc_overs"],
    rpcTarget: json["rpc_target"]==null ? "" : json["rpc_target"],
    // weatherReport: List<dynamic>.from(json["weather_report"].map((x) => x)),
    localteam: Localteam.fromJson(json["localteam"]),
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
    "starting_at": startingAt.toIso8601String(),
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
    "localteam_dl_data": localteamDlData.toJson(),
    "visitorteam_dl_data": visitorteamDlData.toJson(),
    "rpc_overs": rpcOvers,
    "rpc_target": rpcTarget,
    // "weather_report": List<dynamic>.from(weatherReport.map((x) => x)),
    "localteam": localteam.toJson(),
  };
}

class Localteam {
  Localteam({
    required this.resource,
    required this.id,
    required this.name,
    required this.code,
    required this.imagePath,
    required this.countryId,
    required this.nationalTeam,
    required this.updatedAt,
  });

  String resource;
  int id;
  String name;
  String code;
  String imagePath;
  int countryId;
  bool nationalTeam;
  DateTime updatedAt;

  factory Localteam.fromJson(Map<String, dynamic> json) => Localteam(
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
    "updated_at": updatedAt.toIso8601String(),
  };
}

class TeamDlData {
  TeamDlData({
    required this.score,
    required this.overs,
    required this.wicketsOut,
  });

  dynamic score;
  dynamic overs;
  dynamic wicketsOut;

  factory TeamDlData.fromJson(Map<String, dynamic> json) => TeamDlData(
    score: json["score"]==null ? "" : json["score"],
    overs: json["overs"]==null ? "" : json["overs"],
    wicketsOut: json["wickets_out"]==null? "" : json["wickets_out"],
  );

  Map<String, dynamic> toJson() => {
    "score": score,
    "overs": overs,
    "wickets_out": wicketsOut,
  };
}
