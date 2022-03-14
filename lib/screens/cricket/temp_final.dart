// To parse this JSON data, do
//
//     final cricketFinal = cricketFinalFromJson(jsonString);

import 'dart:convert';

CricketFinal cricketFinalFromJson(String str) => CricketFinal.fromJson(json.decode(str));

String cricketFinalToJson(CricketFinal data) => json.encode(data.toJson());

class CricketFinal {
  CricketFinal({
    this.data,
  });

  Data? data;

  factory CricketFinal.fromJson(Map<String, dynamic> json) => CricketFinal(
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
    this.localteam,
    this.visitorteam,
    this.batting,
    this.bowling,
    this.runs,
    this.scoreboards,
    this.balls,
    this.tosswon,
  });

  String? resource;
  dynamic id;
  dynamic leagueId;
  dynamic seasonId;
  dynamic stageId;
  String? round;
  dynamic localteamId;
  dynamic visitorteamId;
  DateTime? startingAt;
  String? type;
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
  String? elected;
  bool? superOver;
  bool? followOn;
  TeamDlData? localteamDlData;
  TeamDlData? visitorteamDlData;
  dynamic rpcOvers;
  dynamic rpcTarget;
  List<dynamic>? weatherReport;
  Localteam? localteam;
  Localteam? visitorteam;
  List<Batting>? batting;
  List<Bowling>? bowling;
  List<Run>? runs;
  List<ScoreboardElement>? scoreboards;
  List<Ball>? balls;
  Localteam? tosswon;

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
    manOfMatchId: json["man_of_match_id"]==null?"":json["man_of_match_id"],
    manOfSeriesId: json["man_of_series_id"]==null?"":json["man_of_series_id"],
    totalOversPlayed: json["total_overs_played"]==null?"": json["total_overs_played"],
    elected: json["elected"],
    superOver: json["super_over"],
    followOn: json["follow_on"],
    localteamDlData: TeamDlData.fromJson(json["localteam_dl_data"]),
    visitorteamDlData: TeamDlData.fromJson(json["visitorteam_dl_data"]),
    rpcOvers: json["rpc_overs"],
    rpcTarget: json["rpc_target"],
    // weatherReport: List<dynamic>.from(json["weather_report"].map((x) => x)),
     localteam: Localteam.fromJson(json["localteam"]),
     visitorteam: Localteam.fromJson(json["visitorteam"]),
     batting: List<Batting>.from(json["batting"].map((x) => Batting.fromJson(x))),
     bowling: List<Bowling>.from(json["bowling"].map((x) => Bowling.fromJson(x))),
     runs: List<Run>.from(json["runs"].map((x) => Run.fromJson(x))),
     scoreboards: List<ScoreboardElement>.from(json["scoreboards"].map((x) => ScoreboardElement.fromJson(x))),
    balls: List<Ball>.from(json["balls"].map((x) => Ball.fromJson(x))),
    // tosswon: Localteam.fromJson(json["tosswon"]),
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
    "localteam": localteam!.toJson(),
    "visitorteam": visitorteam!.toJson(),
    "batting": List<dynamic>.from(batting!.map((x) => x.toJson())),
    "bowling": List<dynamic>.from(bowling!.map((x) => x.toJson())),
    "runs": List<dynamic>.from(runs!.map((x) => x.toJson())),
    "scoreboards": List<dynamic>.from(scoreboards!.map((x) => x.toJson())),
    "balls": List<dynamic>.from(balls!.map((x) => x.toJson())),
    "tosswon": tosswon!.toJson(),
  };
}

class Ball {
  Ball({
    this.resource,
    this.id,
    this.fixtureId,
    this.teamId,
    this.ball,
    this.scoreboard,
    this.batsmanOneOnCreezeId,
    this.batsmanTwoOnCreezeId,
    this.batsmanId,
    this.bowlerId,
    this.batsmanoutId,
    this.catchstumpId,
    this.runoutById,
    this.scoreId,
    this.batsman,
    this.bowler,
    this.score,
    this.team,
    this.updatedAt,
  });

  String? resource;
  dynamic id;
  dynamic fixtureId;
  dynamic teamId;
  double? ball;
  String? scoreboard;
  dynamic batsmanOneOnCreezeId;
  dynamic batsmanTwoOnCreezeId;
  dynamic batsmanId;
  dynamic bowlerId;
  dynamic batsmanoutId;
  dynamic catchstumpId;
  dynamic runoutById;
  dynamic scoreId;
  Batsman? batsman;
  Batsman? bowler;
  Score? score;
  Localteam? team;
  DateTime? updatedAt;

  factory Ball.fromJson(Map<String, dynamic> json) => Ball(
    resource: json["resource"],
    id: json["id"],
    fixtureId: json["fixture_id"],
    teamId: json["team_id"],
    ball: json["ball"].toDouble(),
    scoreboard: json["scoreboard"],
    batsmanOneOnCreezeId: json["batsman_one_on_creeze_id"],
    batsmanTwoOnCreezeId: json["batsman_two_on_creeze_id"],
    batsmanId: json["batsman_id"],
    bowlerId: json["bowler_id"],
    batsmanoutId: json["batsmanout_id"] == null ? null : json["batsmanout_id"],
    catchstumpId: json["catchstump_id"] == null ? null : json["catchstump_id"],
    runoutById: json["runout_by_id"] == null ? null : json["runout_by_id"],
    scoreId: json["score_id"],
    batsman: Batsman.fromJson(json["batsman"]),
    bowler: Batsman.fromJson(json["bowler"]),
    score: Score.fromJson(json["score"]),
    team: Localteam.fromJson(json["team"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "resource": resource,
    "id": id,
    "fixture_id": fixtureId,
    "team_id": teamId,
    "ball": ball,
    "scoreboard": scoreboard,
    "batsman_one_on_creeze_id": batsmanOneOnCreezeId,
    "batsman_two_on_creeze_id": batsmanTwoOnCreezeId,
    "batsman_id": batsmanId,
    "bowler_id": bowlerId,
    "batsmanout_id": batsmanoutId == null ? null : batsmanoutId,
    "catchstump_id": catchstumpId == null ? null : catchstumpId,
    "runout_by_id": runoutById == null ? null : runoutById,
    "score_id": scoreId,
    "batsman": batsman!.toJson(),
    "bowler": bowler!.toJson(),
    "score": score!.toJson(),
    "team": team!.toJson(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class Batsman {
  Batsman({
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
  });

  String? resource;
  dynamic id;
  dynamic countryId;
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

  factory Batsman.fromJson(Map<String, dynamic> json) => Batsman(
    resource: json["resource"],
    id: json["id"],
    countryId: json["country_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    fullname: json["fullname"],
    imagePath: json["image_path"],
    dateofbirth: DateTime.parse(json["dateofbirth"]),
    gender: json["gender"],
    battingstyle: json["battingstyle"] == null ? null : json["battingstyle"],
    bowlingstyle: json["bowlingstyle"] == null ? null : json["bowlingstyle"],
    position: Position.fromJson(json["position"]),
    updatedAt: DateTime.parse(json["updated_at"]),
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
    "battingstyle": battingstyle == null ? null : battingstyle,
    "bowlingstyle": bowlingstyle == null ? null : bowlingstyle,
    "position": position!.toJson(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}




class Position {
  Position({
    this.resource,
    this.id,
    this.name,
  });

  String? resource;
  dynamic id;
  String? name;

  factory Position.fromJson(Map<String, dynamic> json) => Position(
    resource: json["resource"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "resource":resource,
    "id": id,
    "name": name,
  };
}


class Score {
  Score({
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

  factory Score.fromJson(Map<String, dynamic> json) => Score(
    resource: json["resource"],
    id: json["id"],
    name: json["name"],
    runs: json["runs"],
    four: json["four"],
    six: json["six"],
    bye: json["bye"],
    legBye: json["leg_bye"],
    noball: json["noball"],
    noballRuns: json["noball_runs"],
    isWicket: json["is_wicket"],
    ball: json["ball"],
    out: json["out"],
  );

  Map<String, dynamic> toJson() => {
    "resource":resource,
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


class Localteam {
  Localteam({
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
  dynamic id;
  String? name;
  String? code;
  String? imagePath;
  dynamic countryId;
  bool? nationalTeam;
  DateTime? updatedAt;

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
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class Batting {
  Batting({
    this.resource,
    this.id,
    this.sort,
    this.fixtureId,
    this.teamId,
    this.active,
    this.scoreboard,
    this.playerId,
    this.ball,
    this.scoreId,
    this.score,
    this.fourX,
    this.sixX,
    this.catchStumpPlayerId,
    this.runoutById,
    this.batsmanoutId,
    this.bowlingPlayerId,
    this.fowScore,
    this.fowBalls,
    this.rate,
    this.updatedAt,
  });

  String? resource;
  dynamic id;
  dynamic sort;
  dynamic fixtureId;
  dynamic teamId;
  bool? active;
  String? scoreboard;
  dynamic playerId;
  dynamic ball;
  dynamic scoreId;
  dynamic score;
  dynamic fourX;
  dynamic sixX;
  dynamic catchStumpPlayerId;
  dynamic runoutById;
  dynamic batsmanoutId;
  dynamic bowlingPlayerId;
  dynamic fowScore;
  double? fowBalls;
  dynamic rate;
  DateTime? updatedAt;

  factory Batting.fromJson(Map<String, dynamic> json) => Batting(
    resource: json["resource"],
    id: json["id"],
    sort: json["sort"],
    fixtureId: json["fixture_id"],
    teamId: json["team_id"],
    active: json["active"],
    scoreboard: json["scoreboard"],
    playerId: json["player_id"],
    ball: json["ball"],
    scoreId: json["score_id"],
    score: json["score"],
    fourX: json["four_x"],
    sixX: json["six_x"],
    catchStumpPlayerId: json["catch_stump_player_id"] == null ? null : json["catch_stump_player_id"],
    runoutById: json["runout_by_id"] == null ? null : json["runout_by_id"],
    batsmanoutId: json["batsmanout_id"],
    bowlingPlayerId: json["bowling_player_id"] == null ? null : json["bowling_player_id"],
    fowScore: json["fow_score"],
    fowBalls: json["fow_balls"].toDouble(),
    rate: json["rate"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "resource": resource,
    "id": id,
    "sort": sort,
    "fixture_id": fixtureId,
    "team_id": teamId,
    "active": active,
    "scoreboard":scoreboard,
    "player_id": playerId,
    "ball": ball,
    "score_id": scoreId,
    "score": score,
    "four_x": fourX,
    "six_x": sixX,
    "catch_stump_player_id": catchStumpPlayerId == null ? null : catchStumpPlayerId,
    "runout_by_id": runoutById == null ? null : runoutById,
    "batsmanout_id": batsmanoutId,
    "bowling_player_id": bowlingPlayerId == null ? null : bowlingPlayerId,
    "fow_score": fowScore,
    "fow_balls": fowBalls,
    "rate": rate,
    "updated_at": updatedAt!.toIso8601String(),
  };
}


class Bowling {
  Bowling({
    this.resource,
    this.id,
    this.sort,
    this.fixtureId,
    this.teamId,
    this.active,
    this.scoreboard,
    this.playerId,
    this.overs,
    this.medians,
    this.runs,
    this.wickets,
    this.wide,
    this.noball,
    this.rate,
    this.updatedAt,
  });

  String? resource;
  dynamic id;
  dynamic sort;
  dynamic fixtureId;
  dynamic teamId;
  bool? active;
  String? scoreboard;
  dynamic playerId;
  dynamic overs;
  dynamic medians;
  dynamic runs;
  dynamic wickets;
  dynamic wide;
  dynamic noball;
  double? rate;
  DateTime? updatedAt;

  factory Bowling.fromJson(Map<String, dynamic> json) => Bowling(
    resource: json["resource"],
    id: json["id"],
    sort: json["sort"],
    fixtureId: json["fixture_id"],
    teamId: json["team_id"],
    active: json["active"],
    scoreboard: json["scoreboard"],
    playerId: json["player_id"],
    overs: json["overs"],
    medians: json["medians"],
    runs: json["runs"],
    wickets: json["wickets"],
    wide: json["wide"],
    noball: json["noball"],
    rate: json["rate"].toDouble(),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "resource": resource,
    "id": id,
    "sort": sort,
    "fixture_id": fixtureId,
    "team_id": teamId,
    "active": active,
    "scoreboard": scoreboard,
    "player_id": playerId,
    "overs": overs,
    "medians": medians,
    "runs": runs,
    "wickets": wickets,
    "wide": wide,
    "noball": noball,
    "rate": rate,
    "updated_at": updatedAt!.toIso8601String(),
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
  dynamic id;
  dynamic fixtureId;
  dynamic teamId;
  dynamic inning;
  dynamic score;
  dynamic wickets;
  dynamic overs;
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
    overs: json["overs"],
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

class ScoreboardElement {
  ScoreboardElement({
    this.resource,
    this.id,
    this.fixtureId,
    this.teamId,
    this.type,
    this.scoreboard,
    this.wide,
    this.noballRuns,
    this.noballBalls,
    this.bye,
    this.legBye,
    this.penalty,
    this.total,
    this.overs,
    this.wickets,
    this.updatedAt,
  });

  String? resource;
  dynamic id;
  dynamic fixtureId;
  dynamic teamId;
  String? type;
  String? scoreboard;
  dynamic wide;
  dynamic noballRuns;
  dynamic noballBalls;
  dynamic bye;
  dynamic legBye;
  dynamic penalty;
  dynamic total;
  dynamic overs;
  dynamic wickets;
  DateTime? updatedAt;

  factory ScoreboardElement.fromJson(Map<String, dynamic> json) => ScoreboardElement(
    resource: json["resource"],
    id: json["id"],
    fixtureId: json["fixture_id"],
    teamId: json["team_id"],
    type: json["type"],
    scoreboard: json["scoreboard"],
    wide: json["wide"],
    noballRuns: json["noball_runs"],
    noballBalls: json["noball_balls"],
    bye: json["bye"],
    legBye: json["leg_bye"],
    penalty: json["penalty"],
    total: json["total"],
    overs: json["overs"],
    wickets: json["wickets"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "resource": resource,
    "id": id,
    "fixture_id": fixtureId,
    "team_id": teamId,
    "type": type,
    "scoreboard": scoreboard,
    "wide": wide,
    "noball_runs": noballRuns,
    "noball_balls": noballBalls,
    "bye": bye,
    "leg_bye": legBye,
    "penalty": penalty,
    "total": total,
    "overs": overs,
    "wickets": wickets,
    "updated_at": updatedAt!.toIso8601String(),
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
