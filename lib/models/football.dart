// To parse this JSON data, do
//
//     final football = footballFromJson(jsonString);

import 'dart:convert';

Football footballFromJson(String str) => Football.fromJson(json.decode(str));

String footballToJson(Football data) => json.encode(data.toJson());

class Football {
  Football({
    this.data,
    this.meta,
  });

  List<Datum>? data;
  Meta? meta;

  factory Football.fromJson(Map<String, dynamic> json) => Football(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "meta": meta!.toJson(),
  };
}

class Datum {
  Datum({
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
    this.venue,
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
  Leg? leg;
  dynamic? colors;
  bool? deleted;
  bool? isPlaceholder;
  Team? localTeam;
  Team? visitorTeam;
  League? league;
  Venue? venue;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    leagueId: json["league_id"],
    seasonId: json["season_id"],
    stageId: json["stage_id"],
    roundId: json["round_id"],
    groupId: json["group_id"],
    aggregateId: json["aggregate_id"],
    venueId: json["venue_id"],
    refereeId: json["referee_id"] == null ? null : json["referee_id"],
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
    leg: legValues.map![json["leg"]],
    colors: json["colors"],
    deleted: json["deleted"],
    isPlaceholder: json["is_placeholder"],
    localTeam: Team.fromJson(json["localTeam"]),
    visitorTeam: Team.fromJson(json["visitorTeam"]),
    league: League.fromJson(json["league"]),
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
    "referee_id": refereeId == null ? null : refereeId,
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
    "leg": legValues.reverse[leg],
    "colors": colors,
    "deleted": deleted,
    "is_placeholder": isPlaceholder,
    "localTeam": localTeam!.toJson(),
    "visitorTeam": visitorTeam!.toJson(),
    "league": league!.toJson(),
    "venue": venue!.toJson(),
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
    firstAssistantId: json["first_assistant_id"] == null ? null : json["first_assistant_id"],
    secondAssistantId: json["second_assistant_id"] == null ? null : json["second_assistant_id"],
    fourthOfficialId: json["fourth_official_id"] == null ? null : json["fourth_official_id"],
  );

  Map<String, dynamic> toJson() => {
    "first_assistant_id": firstAssistantId == null ? null : firstAssistantId,
    "second_assistant_id": secondAssistantId == null ? null : secondAssistantId,
    "fourth_official_id": fourthOfficialId == null ? null : fourthOfficialId,
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

  int? id;
  bool? active;
  Type? type;
  int? legacyId;
  int? countryId;
  String? logoPath;
  String? name;
  bool? isCup;
  bool? isFriendly;
  int? currentSeasonId;
  int? currentRoundId;
  int? currentStageId;
  bool? liveStandings;
  Coverage? coverage;

  factory LeagueData.fromJson(Map<String, dynamic> json) => LeagueData(
    id: json["id"],
    active: json["active"],
    type: typeValues.map![json["type"]],
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
    coverage: Coverage.fromJson(json["coverage"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "type": typeValues.reverse[type],
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
//
// enum Name { SUPERLIGA, PREMIERSHIP }
//
// final nameValues = EnumValues({
//   "Premiership": Name.PREMIERSHIP,
//   "Superliga": Name.SUPERLIGA
// });

enum Type { DOMESTIC }

final typeValues = EnumValues({
  "domestic": Type.DOMESTIC
});

enum Leg { THE_11 }

final legValues = EnumValues({
  "1/1": Leg.THE_11
});

class Team {
  Team({
    this.data,
  });

  LocalTeamData? data;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
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

  int? id;
  int? legacyId;
  String? name;
  String? shortCode;
  String? twitter;
  int? countryId;
  bool? nationalTeam;
  int? founded;
  String? logoPath;
  int? venueId;
  int? currentSeasonId;
  bool? isPlaceholder;

  factory LocalTeamData.fromJson(Map<String, dynamic> json) => LocalTeamData(
    id: json["id"],
    legacyId: json["legacy_id"] == null ? null : json["legacy_id"],
    name: json["name"],
    shortCode: json["short_code"] == null ? null : json["short_code"],
    twitter: json["twitter"] == null ? null : json["twitter"],
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
    "short_code": shortCode == null ? null : shortCode,
    "twitter": twitter == null ? null : twitter,
    "country_id": countryId,
    "national_team": nationalTeam,
    "founded": founded,
    "logo_path": logoPath,
    "venue_id": venueId,
    "current_season_id": currentSeasonId,
    "is_placeholder": isPlaceholder,
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
  dynamic htScore;
  dynamic ftScore;
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
    "status": statusValues.reverse[status],
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
  Timezone? timezone;

  factory StartingAt.fromJson(Map<String, dynamic> json) => StartingAt(
    dateTime: DateTime.parse(json["date_time"]),
    date: DateTime.parse(json["date"]),
    time: json["time"],
    timestamp: json["timestamp"],
    timezone: timezoneValues.map![json["timezone"]],
  );

  Map<String, dynamic> toJson() => {
    "date_time": dateTime!.toIso8601String(),
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time,
    "timestamp": timestamp,
    "timezone": timezoneValues.reverse[timezone],
  };
}

enum Timezone { UTC }

final timezoneValues = EnumValues({
  "UTC": Timezone.UTC
});

enum Status { FT, NS }

final statusValues = EnumValues({
  "FT": Status.FT,
  "NS": Status.NS
});

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

  int? id;
  String? name;
  Surface? surface;
  String? address;
  String? city;
  int? capacity;
  String? imagePath;
  String? coordinates;

  factory VenueData.fromJson(Map<String, dynamic> json) => VenueData(
    id: json["id"],
    name: json["name"],
    surface: surfaceValues.map![json["surface"]],
    address: json["address"],
    city: json["city"],
    capacity: json["capacity"],
    imagePath: json["image_path"] == null ? null : json["image_path"],
    coordinates: json["coordinates"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "surface": surfaceValues.reverse[surface],
    "address": address,
    "city": city,
    "capacity": capacity,
    "image_path": imagePath == null ? null : imagePath,
    "coordinates": coordinates,
  };
}

enum Surface { GRASS }

final surfaceValues = EnumValues({
  "grass": Surface.GRASS
});

class Meta {
  Meta({
    this.plans,
    this.sports,
    this.pagination,
  });

  List<Plan>? plans;
  List<Sport>? sports;
  Pagination? pagination;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    plans: List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))),
    sports: List<Sport>.from(json["sports"].map((x) => Sport.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "plans": List<dynamic>.from(plans!.map((x) => x.toJson())),
    "sports": List<dynamic>.from(sports!.map((x) => x.toJson())),
    "pagination": pagination!.toJson(),
  };
}

class Pagination {
  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.links,
  });

  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;
  Links? links;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    count: json["count"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
    links: Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "count": count,
    "per_page": perPage,
    "current_page": currentPage,
    "total_pages": totalPages,
    "links": links!.toJson(),
  };
}

class Links {
  Links();

  factory Links.fromJson(Map<String, dynamic> json) => Links(
  );

  Map<String, dynamic> toJson() => {
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
