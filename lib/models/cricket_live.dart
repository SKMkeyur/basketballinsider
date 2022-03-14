// To parse this JSON data, do
//
//     final cricketLiveScore = cricketLiveScoreFromJson(jsonString);

import 'dart:convert';

CricketLiveScore cricketLiveScoreFromJson(String str) => CricketLiveScore.fromJson(json.decode(str));

String cricketLiveScoreToJson(CricketLiveScore data) => json.encode(data.toJson());

class CricketLiveScore {
  CricketLiveScore({
    required this.data,
  });

  List<Datum> data;

  factory CricketLiveScore.fromJson(Map<String, dynamic> json) => CricketLiveScore(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required  this.resource,
    required  this.id,
    required  this.leagueId,
    required  this.seasonId,
    required  this.stageId,
    required  this.round,
    required this.localteamId,
    required  this.visitorteamId,
    required  this.startingAt,
    required  this.type,
    required  this.live,
    required   this.status,
    required   this.lastPeriod,
    required   this.note,
    required  this.venueId,
    required   this.tossWonTeamId,
    required   this.winnerTeamId,
    required   this.drawNoresult,
    required  this.firstUmpireId,
    required  this.secondUmpireId,
    required   this.tvUmpireId,
    required  this.refereeId,
    required  this.manOfMatchId,
    required   this.manOfSeriesId,
    required  this.totalOversPlayed,
    required  this.elected,
    required   this.superOver,
    required   this.followOn,
    required   this.localteamDlData,
    required   this.visitorteamDlData,
    required    this.rpcOvers,
    required    this.rpcTarget,
    required   this.weatherReport,
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
  String lastPeriod;
  String note;
  int venueId;
  int tossWonTeamId;
  int winnerTeamId;
  int drawNoresult;
  int firstUmpireId;
  int secondUmpireId;
  int tvUmpireId;
  int refereeId;
  int manOfMatchId;
  int manOfSeriesId;
  int totalOversPlayed;
  String elected;
  bool superOver;
  bool followOn;
  TeamDlData localteamDlData;
  TeamDlData visitorteamDlData;
  int rpcOvers;
  int rpcTarget;
  List<dynamic> weatherReport;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    localteamDlData: TeamDlData.fromJson(json["localteam_dl_data"]),
    visitorteamDlData: TeamDlData.fromJson(json["visitorteam_dl_data"]),
    rpcOvers: json["rpc_overs"],
    rpcTarget: json["rpc_target"],
    weatherReport: List<dynamic>.from(json["weather_report"].map((x) => x)),
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
    "weather_report": List<dynamic>.from(weatherReport.map((x) => x)),
  };
}

class TeamDlData {
  TeamDlData({
    required  this.score,
    required  this.overs,
    required  this.wicketsOut,
  });

  int score;
  int overs;
  int wicketsOut;

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
