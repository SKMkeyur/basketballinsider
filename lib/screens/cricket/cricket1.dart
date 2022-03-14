class Cricket1 {
  Data? data;

  Cricket1({this.data});

  Cricket1.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? resource;
  int? id;
  int? leagueId;
  int? seasonId;
  int? stageId;
  String? round;
  int? localteamId;
  int? visitorteamId;
  String? startingAt;
  String? type;
  bool? live;
  String? status;
  String? lastPeriod; //null
  String? note;
  int? venueId;
  int? tossWonTeamId;
  int? winnerTeamId;
  String? drawNoresult; //null
  int? firstUmpireId;
  int? secondUmpireId;
  int? tvUmpireId;
  int? refereeId;
  int? manOfMatchId;
  dynamic manOfSeriesId; //null
  dynamic totalOversPlayed;
  String? elected;
  bool? superOver;
  bool? followOn;
  LocalteamDlData? localteamDlData;
  LocalteamDlData? visitorteamDlData;
  String? rpcOvers;  //null
  String? rpcTarget; //null
  // List<Null>? weatherReport;
  Localteam? localteam;
  Localteam? visitorteam;
  List<Batting>? batting;
  List<Bowling>? bowling;
  List<Runs>? runs;
  List<Scoreboards>? scoreboards;
  List<Balls>? balls;
  Localteam? tosswon;

  Data(
      {this.resource,
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
        this.localteam,
        this.visitorteam,
        this.batting,
        this.bowling,
        this.runs,
        this.scoreboards,
        this.balls,
        this.tosswon});

  Data.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    id = json['id'];
    leagueId = json['league_id'];
    seasonId = json['season_id'];
    stageId = json['stage_id'];
    round = json['round'];
    localteamId = json['localteam_id'];
    visitorteamId = json['visitorteam_id'];
    startingAt = json['starting_at'];
    type = json['type'];
    live = json['live'];
    status = json['status'];
    lastPeriod = json['last_period'];
    note = json['note'];
    venueId = json['venue_id'];
    tossWonTeamId = json['toss_won_team_id'];
    winnerTeamId = json['winner_team_id'];
    drawNoresult = json['draw_noresult'];
    firstUmpireId = json['first_umpire_id'];
    secondUmpireId = json['second_umpire_id'];
    tvUmpireId = json['tv_umpire_id'];
    refereeId = json['referee_id'];
    manOfMatchId = json['man_of_match_id']==null ? "" : json['man_of_match_id'];
    manOfSeriesId = json['man_of_series_id']==null ? "" : json['man_of_series_id'];
    totalOversPlayed = json['total_overs_played'];
    elected = json['elected'];
    superOver = json['super_over'];
    followOn = json['follow_on'];
    localteamDlData = json['localteam_dl_data'] != null
        ? new LocalteamDlData.fromJson(json['localteam_dl_data'])
        : null;
    visitorteamDlData = json['visitorteam_dl_data'] != null
        ? new LocalteamDlData.fromJson(json['visitorteam_dl_data'])
        : null;
    rpcOvers = json['rpc_overs'];
    rpcTarget = json['rpc_target'];
    // if (json['weather_report'] != null) {
    //   weatherReport = <Null>[];
    //   json['weather_report'].forEach((v) {
    //     weatherReport!.add(new Null.fromJson(v));
    //   });
    // }
    localteam = json['localteam'] != null
        ? new Localteam.fromJson(json['localteam'])
        : null;
    visitorteam = json['visitorteam'] != null
        ? new Localteam.fromJson(json['visitorteam'])
        : null;
    // if (json['batting'] != null) {
    //   batting = <Batting>[];
    //   json['batting'].forEach((v) {
    //     batting!.add(new Batting.fromJson(v));
    //   });
    // }
    // if (json['bowling'] != null) {
    //   bowling = <Bowling>[];
    //   json['bowling'].forEach((v) {
    //     bowling!.add(new Bowling.fromJson(v));
    //   });
    // }
    // if (json['runs'] != null) {
    //   runs = <Runs>[];
    //   json['runs'].forEach((v) {
    //     runs!.add(new Runs.fromJson(v));
    //   });
    // }
    // if (json['scoreboards'] != null) {
    //   scoreboards = <Scoreboards>[];
    //   json['scoreboards'].forEach((v) {
    //     scoreboards!.add(new Scoreboards.fromJson(v));
    //   });
    // }
    // if (json['balls'] != null) {
    //   balls = <Balls>[];
    //   json['balls'].forEach((v) {
    //     balls!.add(new Balls.fromJson(v));
    //   });
    // }
    // tosswon = json['tosswon'] != null
    //     ? new Localteam.fromJson(json['tosswon'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resource'] = this.resource;
    data['id'] = this.id;
    data['league_id'] = this.leagueId;
    data['season_id'] = this.seasonId;
    data['stage_id'] = this.stageId;
    data['round'] = this.round;
    data['localteam_id'] = this.localteamId;
    data['visitorteam_id'] = this.visitorteamId;
    data['starting_at'] = this.startingAt;
    data['type'] = this.type;
    data['live'] = this.live;
    data['status'] = this.status;
    data['last_period'] = this.lastPeriod;
    data['note'] = this.note;
    data['venue_id'] = this.venueId;
    data['toss_won_team_id'] = this.tossWonTeamId;
    data['winner_team_id'] = this.winnerTeamId;
    data['draw_noresult'] = this.drawNoresult;
    data['first_umpire_id'] = this.firstUmpireId;
    data['second_umpire_id'] = this.secondUmpireId;
    data['tv_umpire_id'] = this.tvUmpireId;
    data['referee_id'] = this.refereeId;
    data['man_of_match_id'] = this.manOfMatchId;
    data['man_of_series_id'] = this.manOfSeriesId;
    data['total_overs_played'] = this.totalOversPlayed;
    data['elected'] = this.elected;
    data['super_over'] = this.superOver;
    data['follow_on'] = this.followOn;
    if (this.localteamDlData != null) {
      data['localteam_dl_data'] = this.localteamDlData!.toJson();
    }
    if (this.visitorteamDlData != null) {
      data['visitorteam_dl_data'] = this.visitorteamDlData!.toJson();
    }
    data['rpc_overs'] = this.rpcOvers;
    data['rpc_target'] = this.rpcTarget;
    // if (this.weatherReport != null) {
    //   data['weather_report'] =
    //       this.weatherReport!.map((v) => v.toJson()).toList();
    // }
    if (this.localteam != null) {
      data['localteam'] = this.localteam!.toJson();
    }
    if (this.visitorteam != null) {
      data['visitorteam'] = this.visitorteam!.toJson();
    }
    if (this.batting != null) {
      data['batting'] = this.batting!.map((v) => v.toJson()).toList();
    }
    if (this.bowling != null) {
      data['bowling'] = this.bowling!.map((v) => v.toJson()).toList();
    }
    if (this.runs != null) {
      data['runs'] = this.runs!.map((v) => v.toJson()).toList();
    }
    if (this.scoreboards != null) {
      data['scoreboards'] = this.scoreboards!.map((v) => v.toJson()).toList();
    }
    if (this.balls != null) {
      data['balls'] = this.balls!.map((v) => v.toJson()).toList();
    }
    if (this.tosswon != null) {
      data['tosswon'] = this.tosswon!.toJson();
    }
    return data;
  }
}

class LocalteamDlData {
  String? score; //null
  String? overs; //null
  String? wicketsOut; //null

  LocalteamDlData({this.score, this.overs, this.wicketsOut});

  LocalteamDlData.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    overs = json['overs'];
    wicketsOut = json['wickets_out'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['overs'] = this.overs;
    data['wickets_out'] = this.wicketsOut;
    return data;
  }
}

class Localteam {
  String? resource;
  int? id;
  String? name;
  String? code;
  String? imagePath;
  int? countryId;
  bool? nationalTeam;
  String? updatedAt;

  Localteam(
      {this.resource,
        this.id,
        this.name,
        this.code,
        this.imagePath,
        this.countryId,
        this.nationalTeam,
        this.updatedAt});

  Localteam.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    id = json['id'];
    name = json['name'];
    code = json['code'];
    imagePath = json['image_path'];
    countryId = json['country_id'];
    nationalTeam = json['national_team'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resource'] = this.resource;
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['image_path'] = this.imagePath;
    data['country_id'] = this.countryId;
    data['national_team'] = this.nationalTeam;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Batting {
  String? resource;
  int? id;
  int? sort;
  int? fixtureId;
  int? teamId;
  bool? active;
  String? scoreboard;
  int? playerId;
  int? ball;
  int? scoreId;
  int? score;
  int? fourX;
  int? sixX;
  int? catchStumpPlayerId;
  String? runoutById; //null
  String? batsmanoutId; //null
  int? bowlingPlayerId;
  int? fowScore;
  double? fowBalls;
  int? rate;
  String? updatedAt;

  Batting(
      {this.resource,
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
        this.updatedAt});

  Batting.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    id = json['id'];
    sort = json['sort'];
    fixtureId = json['fixture_id'];
    teamId = json['team_id'];
    active = json['active'];
    scoreboard = json['scoreboard'];
    playerId = json['player_id'];
    ball = json['ball'];
    scoreId = json['score_id'];
    score = json['score'];
    fourX = json['four_x'];
    sixX = json['six_x'];
    catchStumpPlayerId = json['catch_stump_player_id'];
    runoutById = json['runout_by_id']==null ? "" :json['runout_by_id'] ;
    batsmanoutId = json['batsmanout_id']==null ? "" :json['runout_by_id'];
    bowlingPlayerId = json['bowling_player_id'];
    fowScore = json['fow_score'];
    fowBalls = json['fow_balls'];
    rate = json['rate'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resource'] = this.resource;
    data['id'] = this.id;
    data['sort'] = this.sort;
    data['fixture_id'] = this.fixtureId;
    data['team_id'] = this.teamId;
    data['active'] = this.active;
    data['scoreboard'] = this.scoreboard;
    data['player_id'] = this.playerId;
    data['ball'] = this.ball;
    data['score_id'] = this.scoreId;
    data['score'] = this.score;
    data['four_x'] = this.fourX;
    data['six_x'] = this.sixX;
    data['catch_stump_player_id'] = this.catchStumpPlayerId;
    data['runout_by_id'] = this.runoutById;
    data['batsmanout_id'] = this.batsmanoutId;
    data['bowling_player_id'] = this.bowlingPlayerId;
    data['fow_score'] = this.fowScore;
    data['fow_balls'] = this.fowBalls;
    data['rate'] = this.rate;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Bowling {
  String? resource;
  int? id;
  int? sort;
  int? fixtureId;
  int? teamId;
  bool? active;
  String? scoreboard;
  int? playerId;
  int? overs;
  int? medians;
  int? runs;
  int? wickets;
  int? wide;
  int? noball;
  double? rate;
  String? updatedAt;

  Bowling(
      {this.resource,
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
        this.updatedAt});

  Bowling.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    id = json['id'];
    sort = json['sort'];
    fixtureId = json['fixture_id'];
    teamId = json['team_id'];
    active = json['active'];
    scoreboard = json['scoreboard'];
    playerId = json['player_id'];
    overs = json['overs'];
    medians = json['medians'];
    runs = json['runs'];
    wickets = json['wickets'];
    wide = json['wide'];
    noball = json['noball'];
    rate = json['rate'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resource'] = this.resource;
    data['id'] = this.id;
    data['sort'] = this.sort;
    data['fixture_id'] = this.fixtureId;
    data['team_id'] = this.teamId;
    data['active'] = this.active;
    data['scoreboard'] = this.scoreboard;
    data['player_id'] = this.playerId;
    data['overs'] = this.overs;
    data['medians'] = this.medians;
    data['runs'] = this.runs;
    data['wickets'] = this.wickets;
    data['wide'] = this.wide;
    data['noball'] = this.noball;
    data['rate'] = this.rate;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Runs {
  String? resource;
  int? id;
  int? fixtureId;
  int? teamId;
  int? inning;
  int? score;
  int? wickets;
  int? overs;
  String? pp1;
  String? pp2; //null
  String? pp3; //null
  String? updatedAt;

  Runs(
      {this.resource,
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
        this.updatedAt});

  Runs.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    id = json['id'];
    fixtureId = json['fixture_id'];
    teamId = json['team_id'];
    inning = json['inning'];
    score = json['score'];
    wickets = json['wickets'];
    overs = json['overs'];
    pp1 = json['pp1'];
    pp2 = json['pp2'];
    pp3 = json['pp3'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resource'] = this.resource;
    data['id'] = this.id;
    data['fixture_id'] = this.fixtureId;
    data['team_id'] = this.teamId;
    data['inning'] = this.inning;
    data['score'] = this.score;
    data['wickets'] = this.wickets;
    data['overs'] = this.overs;
    data['pp1'] = this.pp1;
    data['pp2'] = this.pp2;
    data['pp3'] = this.pp3;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Scoreboards {
  String? resource;
  int? id;
  int? fixtureId;
  int? teamId;
  String? type;
  String? scoreboard;
  int? wide;
  int? noballRuns;
  int? noballBalls;
  int? bye;
  int? legBye;
  int? penalty;
  int? total;
  int? overs;
  int? wickets;
  String? updatedAt;

  Scoreboards(
      {this.resource,
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
        this.updatedAt});

  Scoreboards.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    id = json['id'];
    fixtureId = json['fixture_id'];
    teamId = json['team_id'];
    type = json['type'];
    scoreboard = json['scoreboard'];
    wide = json['wide'];
    noballRuns = json['noball_runs'];
    noballBalls = json['noball_balls'];
    bye = json['bye'];
    legBye = json['leg_bye'];
    penalty = json['penalty'];
    total = json['total'];
    overs = json['overs'];
    wickets = json['wickets'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resource'] = this.resource;
    data['id'] = this.id;
    data['fixture_id'] = this.fixtureId;
    data['team_id'] = this.teamId;
    data['type'] = this.type;
    data['scoreboard'] = this.scoreboard;
    data['wide'] = this.wide;
    data['noball_runs'] = this.noballRuns;
    data['noball_balls'] = this.noballBalls;
    data['bye'] = this.bye;
    data['leg_bye'] = this.legBye;
    data['penalty'] = this.penalty;
    data['total'] = this.total;
    data['overs'] = this.overs;
    data['wickets'] = this.wickets;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Balls {
  String? resource;
  int? id;
  int? fixtureId;
  int? teamId;
  double? ball;
  String? scoreboard;
  int? batsmanOneOnCreezeId;
  int? batsmanTwoOnCreezeId;
  int? batsmanId;
  int? bowlerId;
  int? batsmanoutId;
  int? catchstumpId;
  String? runoutById; //null
  int? scoreId;
  Batsman? batsman;
  Batsman? bowler;
  Score? score;
  Localteam? team;
  String? updatedAt;

  Balls(
      {this.resource,
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
        this.updatedAt});

  Balls.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    id = json['id'];
    fixtureId = json['fixture_id'];
    teamId = json['team_id'];
    ball = json['ball'];
    scoreboard = json['scoreboard'];
    batsmanOneOnCreezeId = json['batsman_one_on_creeze_id'];
    batsmanTwoOnCreezeId = json['batsman_two_on_creeze_id'];
    batsmanId = json['batsman_id'];
    bowlerId = json['bowler_id'];
    batsmanoutId = json['batsmanout_id'];
    catchstumpId = json['catchstump_id'];
    runoutById = json['runout_by_id'];
    scoreId = json['score_id'];
    batsman =
    json['batsman'] != null ? new Batsman.fromJson(json['batsman']) : null;
    bowler =
    json['bowler'] != null ? new Batsman.fromJson(json['bowler']) : null;
    score = json['score'] != null ? new Score.fromJson(json['score']) : null;
    team = json['team'] != null ? new Localteam.fromJson(json['team']) : null;
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resource'] = this.resource;
    data['id'] = this.id;
    data['fixture_id'] = this.fixtureId;
    data['team_id'] = this.teamId;
    data['ball'] = this.ball;
    data['scoreboard'] = this.scoreboard;
    data['batsman_one_on_creeze_id'] = this.batsmanOneOnCreezeId;
    data['batsman_two_on_creeze_id'] = this.batsmanTwoOnCreezeId;
    data['batsman_id'] = this.batsmanId;
    data['bowler_id'] = this.bowlerId;
    data['batsmanout_id'] = this.batsmanoutId;
    data['catchstump_id'] = this.catchstumpId;
    data['runout_by_id'] = this.runoutById;
    data['score_id'] = this.scoreId;
    if (this.batsman != null) {
      data['batsman'] = this.batsman!.toJson();
    }
    if (this.bowler != null) {
      data['bowler'] = this.bowler!.toJson();
    }
    if (this.score != null) {
      data['score'] = this.score!.toJson();
    }
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Batsman {
  String? resource;
  int? id;
  int? countryId;
  String? firstname;
  String? lastname;
  String? fullname;
  String? imagePath;
  String? dateofbirth;
  String? gender;
  String? battingstyle;
  String? bowlingstyle;
  Position? position;
  String? updatedAt;

  Batsman(
      {this.resource,
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
        this.updatedAt});

  Batsman.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    id = json['id'];
    countryId = json['country_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    fullname = json['fullname'];
    imagePath = json['image_path'];
    dateofbirth = json['dateofbirth'];
    gender = json['gender'];
    battingstyle = json['battingstyle'];
    bowlingstyle = json['bowlingstyle'];
    position = json['position'] != null
        ? new Position.fromJson(json['position'])
        : null;
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resource'] = this.resource;
    data['id'] = this.id;
    data['country_id'] = this.countryId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['fullname'] = this.fullname;
    data['image_path'] = this.imagePath;
    data['dateofbirth'] = this.dateofbirth;
    data['gender'] = this.gender;
    data['battingstyle'] = this.battingstyle;
    data['bowlingstyle'] = this.bowlingstyle;
    if (this.position != null) {
      data['position'] = this.position!.toJson();
    }
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Position {
  String? resource;
  int? id;
  String? name;

  Position({this.resource, this.id, this.name});

  Position.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resource'] = this.resource;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Score {
  String? resource;
  int? id;
  String? name;
  int? runs;
  bool? four;
  bool? six;
  int? bye;
  int? legBye;
  int? noball;
  int? noballRuns;
  bool? isWicket;
  bool? ball;
  bool? out;

  Score(
      {this.resource,
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
        this.out});

  Score.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    id = json['id'];
    name = json['name'];
    runs = json['runs'];
    four = json['four'];
    six = json['six'];
    bye = json['bye'];
    legBye = json['leg_bye'];
    noball = json['noball'];
    noballRuns = json['noball_runs'];
    isWicket = json['is_wicket'];
    ball = json['ball'];
    out = json['out'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resource'] = this.resource;
    data['id'] = this.id;
    data['name'] = this.name;
    data['runs'] = this.runs;
    data['four'] = this.four;
    data['six'] = this.six;
    data['bye'] = this.bye;
    data['leg_bye'] = this.legBye;
    data['noball'] = this.noball;
    data['noball_runs'] = this.noballRuns;
    data['is_wicket'] = this.isWicket;
    data['ball'] = this.ball;
    data['out'] = this.out;
    return data;
  }
}
