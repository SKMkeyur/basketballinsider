// To parse this JSON data, do
//
//     final fixturesByIdFootball = fixturesByIdFootballFromJson(jsonString);

import 'dart:convert';

FixturesByIdFootball fixturesByIdFootballFromJson(String str) => FixturesByIdFootball.fromJson(json.decode(str));

String fixturesByIdFootballToJson(FixturesByIdFootball data) => json.encode(data.toJson());

class FixturesByIdFootball {
  FixturesByIdFootball({
    this.data,
    this.meta,
  });

  Data? data;
  Meta? meta;

  factory FixturesByIdFootball.fromJson(Map<String, dynamic> json) => FixturesByIdFootball(
    data: Data.fromJson(json["data"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
    "meta": meta!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.leagueId,
    this.seasonId,
    this.stageId,
    this.roundId,
    this.groupId,
    this.aggregateId,
    this.venueId,
    this.refereeId,
    this.localteamId,
    this.visitorteamId,
    this.winnerTeamId,
    this.weatherReport,
    this.commentaries,
    this.attendance,
    this.pitch,
    this.details,
    this.neutralVenue,
    this.winningOddsCalculated,
    this.formations,
    this.scores,
    this.time,
    this.coaches,
    this.standings,
    this.assistants,
    this.leg,
    this.colors,
    this.deleted,
    this.isPlaceholder,
    this.stats,
  });

  int? id;
  int? leagueId;
  int? seasonId;
  int? stageId;
  int? roundId;
  dynamic groupId;
  dynamic aggregateId;
  int? venueId;
  int? refereeId;
  int? localteamId;
  int? visitorteamId;
  int? winnerTeamId;
  WeatherReport? weatherReport;
  bool? commentaries;
  dynamic attendance;
  dynamic pitch;
  dynamic details;
  bool? neutralVenue;
  bool? winningOddsCalculated;
  Formations? formations;
  Scores? scores;
  Time? time;
  Coaches? coaches;
  Standings? standings;
  Assistants? assistants;
  String? leg;
  Colors? colors;
  bool? deleted;
  bool? isPlaceholder;
  Stats? stats;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    leagueId: json["league_id"],
    seasonId: json["season_id"],
    stageId: json["stage_id"],
    roundId: json["round_id"],
    groupId: json["group_id"],
    aggregateId: json["aggregate_id"],
    venueId: json["venue_id"],
    refereeId: json["referee_id"],
    localteamId: json["localteam_id"],
    visitorteamId: json["visitorteam_id"],
    winnerTeamId: json["winner_team_id"],
    // weatherReport: WeatherReport.fromJson(json["weather_report"]),
    commentaries: json["commentaries"],
    attendance: json["attendance"],
    pitch: json["pitch"],
    details: json["details"],
    neutralVenue: json["neutral_venue"],
    winningOddsCalculated: json["winning_odds_calculated"],
    formations: Formations.fromJson(json["formations"]),
    scores: Scores.fromJson(json["scores"]),
    time: Time.fromJson(json["time"]),
    coaches: Coaches.fromJson(json["coaches"]),
    standings: Standings.fromJson(json["standings"]),
    assistants: Assistants.fromJson(json["assistants"]),
    leg: json["leg"],
    // colors: Colors.fromJson(json["colors"]),
    deleted: json["deleted"],
    isPlaceholder: json["is_placeholder"],
     stats: Stats.fromJson(json["stats"])


      // (json["stats"]!=null && json["stats"].isNotEmpty) ?
    // stats: Stats.fromJson(json["stats"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "league_id": leagueId,
    "season_id": seasonId,
    "stage_id": stageId,
    "round_id": roundId,
    "group_id": groupId,
    "aggregate_id": aggregateId,
    "venue_id": venueId,
    "referee_id": refereeId,
    "localteam_id": localteamId,
    "visitorteam_id": visitorteamId,
    "winner_team_id": winnerTeamId,
    "weather_report": weatherReport!.toJson(),
    "commentaries": commentaries,
    "attendance": attendance,
    "pitch": pitch,
    "details": details,
    "neutral_venue": neutralVenue,
    "winning_odds_calculated": winningOddsCalculated,
    "formations": formations!.toJson(),
    "scores": scores!.toJson(),
    "time": time!.toJson(),
    "coaches": coaches!.toJson(),
    "standings": standings!.toJson(),
    "assistants": assistants!.toJson(),
    "leg": leg,
    "colors": colors!.toJson(),
    "deleted": deleted,
    "is_placeholder": isPlaceholder,
    "stats": stats!.toJson(),
  };
}

class Assistants {
  Assistants({
    this.firstAssistantId,
    this.secondAssistantId,
    this.fourthOfficialId,
  });

  int? firstAssistantId;
  int? secondAssistantId;
  int? fourthOfficialId;

  factory Assistants.fromJson(Map<String, dynamic> json) => Assistants(
    firstAssistantId: json["first_assistant_id"],
    secondAssistantId: json["second_assistant_id"],
    fourthOfficialId: json["fourth_official_id"],
  );

  Map<String, dynamic> toJson() => {
    "first_assistant_id": firstAssistantId,
    "second_assistant_id": secondAssistantId,
    "fourth_official_id": fourthOfficialId,
  };
}

class Coaches {
  Coaches({
    this.localteamCoachId,
    this.visitorteamCoachId,
  });

  int? localteamCoachId;
  int? visitorteamCoachId;

  factory Coaches.fromJson(Map<String, dynamic> json) => Coaches(
    localteamCoachId: json["localteam_coach_id"],
    visitorteamCoachId: json["visitorteam_coach_id"],
  );

  Map<String, dynamic> toJson() => {
    "localteam_coach_id": localteamCoachId,
    "visitorteam_coach_id": visitorteamCoachId,
  };
}

class Colors {
  Colors({
    this.localteam,
    this.visitorteam,
  });

  Team? localteam;
  Team? visitorteam;

  factory Colors.fromJson(Map<String, dynamic> json) => Colors(
    localteam: Team.fromJson(json["localteam"]),
    visitorteam: Team.fromJson(json["visitorteam"]),
  );

  Map<String, dynamic> toJson() => {
    "localteam": localteam!.toJson(),
    "visitorteam": visitorteam!.toJson(),
  };
}

class Team {
  Team({
    this.color,
    this.kitColors,
  });

  String? color;
  String? kitColors;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    color: json["color"],
    kitColors: json["kit_colors"],
  );

  Map<String, dynamic> toJson() => {
    "color": color,
    "kit_colors": kitColors,
  };
}

class Formations {
  Formations({
    this.localteamFormation,
    this.visitorteamFormation,
  });

  String? localteamFormation;
  String? visitorteamFormation;

  factory Formations.fromJson(Map<String, dynamic> json) => Formations(
    localteamFormation: json["localteam_formation"],
    visitorteamFormation: json["visitorteam_formation"],
  );

  Map<String, dynamic> toJson() => {
    "localteam_formation": localteamFormation,
    "visitorteam_formation": visitorteamFormation,
  };
}

class Scores {
  Scores({
    this.localteamScore,
    this.visitorteamScore,
    this.localteamPenScore,
    this.visitorteamPenScore,
    this.htScore,
    this.ftScore,
    this.etScore,
    this.psScore,
  });

  int? localteamScore;
  int? visitorteamScore;
  dynamic localteamPenScore;
  dynamic visitorteamPenScore;
  String? htScore;
  String? ftScore;
  dynamic etScore;
  dynamic psScore;

  factory Scores.fromJson(Map<String, dynamic> json) => Scores(
    localteamScore: json["localteam_score"],
    visitorteamScore: json["visitorteam_score"],
    localteamPenScore: json["localteam_pen_score"],
    visitorteamPenScore: json["visitorteam_pen_score"],
    htScore: json["ht_score"],
    ftScore: json["ft_score"],
    etScore: json["et_score"],
    psScore: json["ps_score"],
  );

  Map<String, dynamic> toJson() => {
    "localteam_score": localteamScore,
    "visitorteam_score": visitorteamScore,
    "localteam_pen_score": localteamPenScore,
    "visitorteam_pen_score": visitorteamPenScore,
    "ht_score": htScore,
    "ft_score": ftScore,
    "et_score": etScore,
    "ps_score": psScore,
  };
}

class Standings {
  Standings({
    this.localteamPosition,
    this.visitorteamPosition,
  });

  int? localteamPosition;
  int? visitorteamPosition;

  factory Standings.fromJson(Map<String, dynamic> json) => Standings(
    localteamPosition: json["localteam_position"],
    visitorteamPosition: json["visitorteam_position"],
  );

  Map<String, dynamic> toJson() => {
    "localteam_position": localteamPosition,
    "visitorteam_position": visitorteamPosition,
  };
}

class Stats {
  Stats({
    this.data,
  });

  List<Datum>? data;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.teamId,
    this.fixtureId,
    this.shots,
    this.passes,
    this.attacks,
    this.fouls,
    this.corners,
    this.offsides,
    this.possessiontime,
    this.yellowcards,
    this.redcards,
    this.yellowredcards,
    this.saves,
    this.substitutions,
    this.goalKick,
    this.goalAttempts,
    this.freeKick,
    this.throwIn,
    this.ballSafe,
    this.goals,
    this.penalties,
    this.injuries,
    this.tackles,
  });

  int? teamId;
  int? fixtureId;
  Shots? shots;
  Passes? passes;
  Attacks? attacks;
  int? fouls;
  int? corners;
  int? offsides;
  int? possessiontime;
  int? yellowcards;
  int? redcards;
  int? yellowredcards;
  int? saves;
  int? substitutions;
  dynamic goalKick;
  int? goalAttempts;
  dynamic freeKick;
  dynamic throwIn;
  int? ballSafe;
  int? goals;
  int? penalties;
  int? injuries;
  int? tackles;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    teamId: json["team_id"],
    fixtureId: json["fixture_id"],
    shots: Shots.fromJson(json["shots"]),
    passes: Passes.fromJson(json["passes"]),
    // attacks: Attacks.fromJson(json["attacks"]),
    fouls: json["fouls"],
    corners: json["corners"],
    offsides: json["offsides"],
    possessiontime: json["possessiontime"],
    yellowcards: json["yellowcards"],
    redcards: json["redcards"],
    yellowredcards: json["yellowredcards"],
    saves: json["saves"],
    substitutions: json["substitutions"],
    goalKick: json["goal_kick"],
    goalAttempts: json["goal_attempts"],
    freeKick: json["free_kick"],
    throwIn: json["throw_in"],
    ballSafe: json["ball_safe"],
    goals: json["goals"],
    penalties: json["penalties"],
    injuries: json["injuries"],
    tackles: json["tackles"],
  );

  Map<String, dynamic> toJson() => {
    "team_id": teamId,
    "fixture_id": fixtureId,
    "shots": shots!.toJson(),
    "passes": passes!.toJson(),
    "attacks": attacks!.toJson(),
    "fouls": fouls,
    "corners": corners,
    "offsides": offsides,
    "possessiontime": possessiontime,
    "yellowcards": yellowcards,
    "redcards": redcards,
    "yellowredcards": yellowredcards,
    "saves": saves,
    "substitutions": substitutions,
    "goal_kick": goalKick,
    "goal_attempts": goalAttempts,
    "free_kick": freeKick,
    "throw_in": throwIn,
    "ball_safe": ballSafe,
    "goals": goals,
    "penalties": penalties,
    "injuries": injuries,
    "tackles": tackles,
  };
}

class Attacks {
  Attacks({
    this.attacks,
    this.dangerousAttacks,
  });

  int? attacks;
  int? dangerousAttacks;

  factory Attacks.fromJson(Map<String, dynamic> json) => Attacks(
    attacks: json["attacks"],
    dangerousAttacks: json["dangerous_attacks"],
  );

  Map<String, dynamic> toJson() => {
    "attacks": attacks,
    "dangerous_attacks": dangerousAttacks,
  };
}

class Passes {
  Passes({
    this.total,
    this.accurate,
    this.percentage,
  });

  int? total;
  int? accurate;
  double? percentage;

  factory Passes.fromJson(Map<String, dynamic> json) => Passes(
    total: json["total"],
    accurate: json["accurate"],
    percentage: json["percentage"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "accurate": accurate,
    "percentage": percentage,
  };
}

class Shots {
  Shots({
    this.total,
    this.ongoal,
    this.blocked,
    this.offgoal,
    this.insidebox,
    this.outsidebox,
  });

  int? total;
  int? ongoal;
  int? blocked;
  int? offgoal;
  int? insidebox;
  int? outsidebox;

  factory Shots.fromJson(Map<String, dynamic> json) => Shots(
    total: json["total"],
    ongoal: json["ongoal"],
    blocked: json["blocked"],
    offgoal: json["offgoal"],
    insidebox: json["insidebox"],
    outsidebox: json["outsidebox"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "ongoal": ongoal,
    "blocked": blocked,
    "offgoal": offgoal,
    "insidebox": insidebox,
    "outsidebox": outsidebox,
  };
}

class Time {
  Time({
    this.status,
    this.startingAt,
    this.minute,
    this.second,
    this.addedTime,
    this.extraMinute,
    this.injuryTime,
  });

  String? status;
  StartingAt? startingAt;
  int? minute;
  dynamic second;
  dynamic addedTime;
  dynamic extraMinute;
  dynamic injuryTime;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    status: json["status"],
    startingAt: StartingAt.fromJson(json["starting_at"]),
    minute: json["minute"],
    second: json["second"],
    addedTime: json["added_time"],
    extraMinute: json["extra_minute"],
    injuryTime: json["injury_time"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "starting_at": startingAt!.toJson(),
    "minute": minute,
    "second": second,
    "added_time": addedTime,
    "extra_minute": extraMinute,
    "injury_time": injuryTime,
  };
}

class StartingAt {
  StartingAt({
    this.dateTime,
    this.date,
    this.time,
    this.timestamp,
    this.timezone,
  });

  DateTime? dateTime;
  DateTime? date;
  String? time;
  int? timestamp;
  String? timezone;

  factory StartingAt.fromJson(Map<String, dynamic> json) => StartingAt(
    dateTime: DateTime.parse(json["date_time"]),
    date: DateTime.parse(json["date"]),
    time: json["time"],
    timestamp: json["timestamp"],
    timezone: json["timezone"],
  );

  Map<String, dynamic> toJson() => {
    "date_time": dateTime!.toIso8601String(),
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time,
    "timestamp": timestamp,
    "timezone": timezone,
  };
}

class WeatherReport {
  WeatherReport({
    this.code,
    this.type,
    this.icon,
    this.temperature,
    this.temperatureCelcius,
    this.clouds,
    this.humidity,
    this.pressure,
    this.wind,
    this.coordinates,
    this.updatedAt,
  });

  String? code;
  String? type;
  String? icon;
  Temperature? temperature;
  Temperature? temperatureCelcius;
  String? clouds;
  String? humidity;
  int? pressure;
  Wind? wind;
  Coordinates? coordinates;
  DateTime? updatedAt;

  factory WeatherReport.fromJson(Map<String, dynamic> json) => WeatherReport(
    code: json["code"],
    type: json["type"],
    icon: json["icon"],
    temperature: Temperature.fromJson(json["temperature"]),
    temperatureCelcius: Temperature.fromJson(json["temperature_celcius"]),
    clouds: json["clouds"],
    humidity: json["humidity"],
    pressure: json["pressure"],
    wind: Wind.fromJson(json["wind"]),
    coordinates: Coordinates.fromJson(json["coordinates"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "type": type,
    "icon": icon,
    "temperature": temperature!.toJson(),
    "temperature_celcius": temperatureCelcius!.toJson(),
    "clouds": clouds,
    "humidity": humidity,
    "pressure": pressure,
    "wind": wind!.toJson(),
    "coordinates": coordinates!.toJson(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class Coordinates {
  Coordinates({
    this.lat,
    this.lon,
  });

  double? lat;
  double? lon;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
  };
}

class Temperature {
  Temperature({
    this.temp,
    this.unit,
  });

  double? temp;
  String? unit;

  factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
    temp: json["temp"].toDouble(),
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "unit": unit,
  };
}

class Wind {
  Wind({
    this.speed,
    this.degree,
  });

  String? speed;
  int? degree;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json["speed"],
    degree: json["degree"],
  );

  Map<String, dynamic> toJson() => {
    "speed": speed,
    "degree": degree,
  };
}

class Meta {
  Meta({
    this.plans,
    this.sports,
  });

  List<Plan>? plans;
  List<Sport>? sports;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    plans: List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))),
    sports: List<Sport>.from(json["sports"].map((x) => Sport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "plans": List<dynamic>.from(plans!.map((x) => x.toJson())),
    "sports": List<dynamic>.from(sports!.map((x) => x.toJson())),
  };
}

class Plan {
  Plan({
    this.name,
    this.features,
    this.requestLimit,
    this.sport,
  });

  String? name;
  String? features;
  String? requestLimit;
  String? sport;

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
    this.id,
    this.name,
    this.current,
  });

  int? id;
  String? name;
  bool? current;

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
