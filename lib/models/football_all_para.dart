// To parse this JSON data, do
//
//     final footballFixtureAllPara = footballFixtureAllParaFromJson(jsonString);

import 'dart:convert';

FootballFixtureAllPara footballFixtureAllParaFromJson(String str) => FootballFixtureAllPara.fromJson(json.decode(str));

String footballFixtureAllParaToJson(FootballFixtureAllPara data) => json.encode(data.toJson());

class FootballFixtureAllPara {
  FootballFixtureAllPara({
    this.data,
    this.meta,
  });

  FootballFixtureAllParaData? data;
  Meta? meta;

  factory FootballFixtureAllPara.fromJson(Map<String, dynamic> json) => FootballFixtureAllPara(
    data: FootballFixtureAllParaData.fromJson(json["data"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
    "meta": meta!.toJson(),
  };
}

class FootballFixtureAllParaData {
  FootballFixtureAllParaData({
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
    this.localTeam,
    this.visitorTeam,
    this.league,
    this.round,
    this.venue,
  });

  dynamic id;
  dynamic leagueId;
  dynamic seasonId;
  dynamic stageId;
  dynamic roundId;
  dynamic groupId;
  dynamic aggregateId;
  dynamic venueId;
  dynamic refereeId;
  dynamic localteamId;
  dynamic visitorteamId;
  dynamic winnerTeamId;
  dynamic weatherReport;
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
  LocalTeamClass? localTeam;
  LocalTeamClass? visitorTeam;
  League? league;
  Round? round;
  Venue? venue;

  factory FootballFixtureAllParaData.fromJson(Map<String, dynamic> json) => FootballFixtureAllParaData(
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
    weatherReport: json["weather_report"],
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
    localTeam: LocalTeamClass.fromJson(json["localTeam"]),
    visitorTeam: LocalTeamClass.fromJson(json["visitorTeam"]),
     league:  League.fromJson(json["league"]),
    round: Round.fromJson(json["round"]),
    venue: Venue.fromJson(json["venue"]),
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
    "weather_report": weatherReport,
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
    "localTeam": localTeam!.toJson(),
    "visitorTeam": visitorTeam!.toJson(),
    "league": league!.toJson(),
    "round": round!.toJson(),
    "venue": venue!.toJson(),
  };
}

class Assistants {
  Assistants({
    this.firstAssistantId,
    this.secondAssistantId,
    this.fourthOfficialId,
  });

  dynamic firstAssistantId;
  dynamic secondAssistantId;
  dynamic fourthOfficialId;

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

  dynamic localteamCoachId;
  dynamic visitorteamCoachId;

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

  dynamic color;
  dynamic kitColors;

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

  dynamic localteamFormation;
  dynamic visitorteamFormation;

  factory Formations.fromJson(Map<String, dynamic> json) => Formations(
    localteamFormation: json["localteam_formation"],
    visitorteamFormation: json["visitorteam_formation"],
  );

  Map<String, dynamic> toJson() => {
    "localteam_formation": localteamFormation,
    "visitorteam_formation": visitorteamFormation,
  };
}

class League {
  League({
    this.data,
  });

  LeagueData? data;

  factory League.fromJson(Map<String, dynamic> json) => League(
    data: LeagueData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class LeagueData {
  LeagueData({
    this.id,
    this.active,
    this.type,
    this.legacyId,
    this.countryId,
    this.logoPath,
    this.name,
    this.isCup,
    this.isFriendly,
    this.currentSeasonId,
    this.currentRoundId,
    this.currentStageId,
    this.liveStandings,
    this.coverage,
  });

  dynamic id;
  dynamic active;
  dynamic type;
  dynamic legacyId;
  dynamic countryId;
  dynamic logoPath;
  dynamic name;
  dynamic isCup;
  dynamic isFriendly;
  dynamic currentSeasonId;
  dynamic currentRoundId;
  dynamic currentStageId;
  dynamic liveStandings;
  Coverage? coverage;

  factory LeagueData.fromJson(Map<dynamic, dynamic> json) => LeagueData(
    id: json["id"],
    active: json["active"],
    type: json["type"],
    legacyId: json["legacy_id"],
    countryId: json["country_id"],
    logoPath: json["logo_path"],
    name: json["name"],
    isCup: json["is_cup"],
    isFriendly: json["is_friendly"],
    currentSeasonId: json["current_season_id"],
    currentRoundId: json["current_round_id"],
    currentStageId: json["current_stage_id"],
    liveStandings: json["live_standings"],
     // coverage: Coverage.fromJson(json["coverage"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "type": type,
    "legacy_id": legacyId,
    "country_id": countryId,
    "logo_path": logoPath,
    "name": name,
    "is_cup": isCup,
    "is_friendly": isFriendly,
    "current_season_id": currentSeasonId,
    "current_round_id": currentRoundId,
    "current_stage_id": currentStageId,
    "live_standings": liveStandings,
    "coverage": coverage!.toJson(),
  };
}

class Coverage {
  Coverage({
    this.predictions,
    this.topscorerGoals,
    this.topscorerAssists,
    this.topscorerCards,
  });

  bool? predictions;
  bool? topscorerGoals;
  bool? topscorerAssists;
  bool? topscorerCards;

  factory Coverage.fromJson(Map<String, dynamic> json) => Coverage(
    predictions: json["predictions"],
    topscorerGoals: json["topscorer_goals"],
    topscorerAssists: json["topscorer_assists"],
    topscorerCards: json["topscorer_cards"],
  );

  Map<String, dynamic> toJson() => {
    "predictions": predictions,
    "topscorer_goals": topscorerGoals,
    "topscorer_assists": topscorerAssists,
    "topscorer_cards": topscorerCards,
  };
}

class LocalTeamClass {
  LocalTeamClass({
    this.data,
  });

  LocalTeamData? data;

  factory LocalTeamClass.fromJson(Map<String, dynamic> json) => LocalTeamClass(
    data: LocalTeamData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class LocalTeamData {
  LocalTeamData({
    this.id,
    this.legacyId,
    this.name,
    this.shortCode,
    this.twitter,
    this.countryId,
    this.nationalTeam,
    this.founded,
    this.logoPath,
    this.venueId,
    this.currentSeasonId,
    this.isPlaceholder,
  });

  dynamic id;
  dynamic legacyId;
  dynamic name;
  dynamic shortCode;
  dynamic twitter;
  dynamic countryId;
  bool? nationalTeam;
  dynamic founded;
  dynamic logoPath;
  dynamic venueId;
  dynamic currentSeasonId;
  bool? isPlaceholder;

  factory LocalTeamData.fromJson(Map<String, dynamic> json) => LocalTeamData(
    id: json["id"],
    legacyId: json["legacy_id"] == null ? null : json["legacy_id"],
    name: json["name"],
    shortCode: json["short_code"],
    twitter: json["twitter"],
    countryId: json["country_id"],
    nationalTeam: json["national_team"],
    founded: json["founded"],
    logoPath: json["logo_path"],
    venueId: json["venue_id"],
    currentSeasonId: json["current_season_id"],
    isPlaceholder: json["is_placeholder"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "legacy_id": legacyId == null ? null : legacyId,
    "name": name,
    "short_code": shortCode,
    "twitter": twitter,
    "country_id": countryId,
    "national_team": nationalTeam,
    "founded": founded,
    "logo_path": logoPath,
    "venue_id": venueId,
    "current_season_id": currentSeasonId,
    "is_placeholder": isPlaceholder,
  };
}

class Round {
  Round({
    this.data,
  });

  RoundData? data;

  factory Round.fromJson(Map<String, dynamic> json) => Round(
    data: RoundData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class RoundData {
  RoundData({
    this.id,
    this.name,
    this.leagueId,
    this.seasonId,
    this.stageId,
    this.start,
    this.end,
  });

  dynamic id;
  dynamic name;
  dynamic leagueId;
  dynamic seasonId;
  dynamic stageId;
  DateTime? start;
  DateTime? end;

  factory RoundData.fromJson(Map<String, dynamic> json) => RoundData(
    id: json["id"],
    name: json["name"],
    leagueId: json["league_id"],
    seasonId: json["season_id"],
    stageId: json["stage_id"],
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "league_id": leagueId,
    "season_id": seasonId,
    "stage_id": stageId,
    "start": "${start!.year.toString().padLeft(4, '0')}-${start!.month.toString().padLeft(2, '0')}-${start!.day.toString().padLeft(2, '0')}",
    "end": "${end!.year.toString().padLeft(4, '0')}-${end!.month.toString().padLeft(2, '0')}-${end!.day.toString().padLeft(2, '0')}",
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

  dynamic localteamScore;
  dynamic visitorteamScore;
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

  dynamic localteamPosition;
  dynamic visitorteamPosition;

  factory Standings.fromJson(Map<String, dynamic> json) => Standings(
    localteamPosition: json["localteam_position"],
    visitorteamPosition: json["visitorteam_position"],
  );

  Map<String, dynamic> toJson() => {
    "localteam_position": localteamPosition,
    "visitorteam_position": visitorteamPosition,
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
  dynamic minute;
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
  dynamic timestamp;
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

class Venue {
  Venue({
    this.data,
  });

  VenueData? data;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    data: VenueData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class VenueData {
  VenueData({
    this.id,
    this.name,
    this.surface,
    this.address,
    this.city,
    this.capacity,
    this.imagePath,
    this.coordinates,
  });

  dynamic id;
  String? name;
  String? surface;
  String? address;
  String? city;
  dynamic capacity;
  String? imagePath;
  String? coordinates;

  factory VenueData.fromJson(Map<String, dynamic> json) => VenueData(
    id: json["id"],
    name: json["name"],
    surface: json["surface"],
    address: json["address"],
    city: json["city"],
    capacity: json["capacity"],
    imagePath: json["image_path"],
    coordinates: json["coordinates"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "surface": surface,
    "address": address,
    "city": city,
    "capacity": capacity,
    "image_path": imagePath,
    "coordinates": coordinates,
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

  dynamic id;
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
