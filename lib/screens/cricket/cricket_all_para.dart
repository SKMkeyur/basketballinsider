// To parse this JSON data, do
//
//     final cricketFixtureAllPara = cricketFixtureAllParaFromJson(jsonString);

import 'dart:convert';

CricketFixtureAllPara cricketFixtureAllParaFromJson(String str) => CricketFixtureAllPara.fromJson(json.decode(str));

String cricketFixtureAllParaToJson(CricketFixtureAllPara data) => json.encode(data.toJson());

class CricketFixtureAllPara {
  CricketFixtureAllPara({
    this.data,
  });

  Data? data;

  factory CricketFixtureAllPara.fromJson(Map<String, dynamic> json) => CricketFixtureAllPara(
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
    // this.weatherReport,
    this.league,
    this.localteam,
    this.visitorteam,
    this.venue,
  });

  dynamic resource;
  dynamic id;
  dynamic leagueId;
  dynamic seasonId;
  dynamic stageId;
  dynamic round;
  dynamic localteamId;
  dynamic visitorteamId;
  DateTime? startingAt;
  dynamic type;
  bool? live;
  String? status;
  dynamic lastPeriod;
  String? note;
  dynamic venueId;
  dynamic tossWonTeamId;
  dynamic winnerTeamId;
  dynamic drawNoresult;
  dynamic firstUmpireId;
  dynamic secondUmpireId;
  dynamic tvUmpireId;
  dynamic refereeId;
  dynamic manOfMatchId;
  dynamic manOfSeriesId;
  dynamic totalOversPlayed;
  dynamic elected;
  bool? superOver;
  bool? followOn;
  TeamDlData? localteamDlData;
  TeamDlData? visitorteamDlData;
  dynamic rpcOvers;
  dynamic rpcTarget;
  // List<dynamic> weatherReport;
  League? league;
  League? localteam;
  League? visitorteam;
  Venue? venue;

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
    localteamDlData: TeamDlData.fromJson(json["localteam_dl_data"]),
    visitorteamDlData: TeamDlData.fromJson(json["visitorteam_dl_data"]),
    rpcOvers: json["rpc_overs"],
    rpcTarget: json["rpc_target"],
    // weatherReport: List<dynamic>.from(json["weather_report"].map((x) => x)),
    league: League.fromJson(json["league"]),
    localteam: League.fromJson(json["localteam"]),
    visitorteam: League.fromJson(json["visitorteam"]),
    venue: Venue.fromJson(json["venue"]),
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
    // "weather_report": List<dynamic>.from(weatherReport.map((x) => x)),
    "league": league!.toJson(),
    "localteam": localteam!.toJson(),
    "visitorteam": visitorteam!.toJson(),
    "venue": venue!.toJson(),
  };
}

class League {
  League({
    this.resource,
    this.id,
    this.seasonId,
    this.countryId,
    this.name,
    this.code,
    this.imagePath,
    this.type,
    this.updatedAt,
    this.nationalTeam,
  });

  String? resource;
  dynamic id;
  dynamic seasonId;
  dynamic countryId;
  String? name;
  String? code;
  String? imagePath;
  String? type;
  DateTime? updatedAt;
  bool? nationalTeam;

  factory League.fromJson(Map<String, dynamic> json) => League(
    resource: json["resource"],
    id: json["id"],
    seasonId: json["season_id"] == null ? null : json["season_id"],
    countryId: json["country_id"],
    name: json["name"],
    code: json["code"],
    imagePath: json["image_path"],
    type: json["type"] == null ? null : json["type"],
    updatedAt: DateTime.parse(json["updated_at"]),
    nationalTeam: json["national_team"] == null ? null : json["national_team"],
  );

  Map<String, dynamic> toJson() => {
    "resource": resource,
    "id": id,
    "season_id": seasonId == null ? null : seasonId,
    "country_id": countryId,
    "name": name,
    "code": code,
    "image_path": imagePath,
    "type": type == null ? null : type,
    "updated_at": updatedAt!.toIso8601String(),
    "national_team": nationalTeam == null ? null : nationalTeam,
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

class Venue {
  Venue({
    this.resource,
    this.id,
    this.countryId,
    this.name,
    this.city,
    this.imagePath,
    this.capacity,
    this.floodlight,
    this.updatedAt,
  });

  String? resource;
  dynamic id;
  dynamic countryId;
  String? name;
  String? city;
  String? imagePath;
  dynamic capacity;
  bool? floodlight;
  DateTime? updatedAt;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    resource: json["resource"],
    id: json["id"],
    countryId: json["country_id"],
    name: json["name"],
    city: json["city"],
    imagePath: json["image_path"],
    capacity: json["capacity"],
    floodlight: json["floodlight"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "resource": resource,
    "id": id,
    "country_id": countryId,
    "name": name,
    "city": city,
    "image_path": imagePath,
    "capacity": capacity,
    "floodlight": floodlight,
    "updated_at": updatedAt!.toIso8601String(),
  };
}
