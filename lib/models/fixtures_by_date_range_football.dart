// To parse this JSON data, do
//
//     final fixturesByDateRangeFootball = fixturesByDateRangeFootballFromJson(jsonString);

import 'dart:convert';

FixturesByDateRangeFootball fixturesByDateRangeFootballFromJson(String str) => FixturesByDateRangeFootball.fromJson(json.decode(str));

String fixturesByDateRangeFootballToJson(FixturesByDateRangeFootball data) => json.encode(data.toJson());

class FixturesByDateRangeFootball {
  FixturesByDateRangeFootball({
    this.data,
    this.meta,
  });

  List<Datum>? data;
  Meta? meta;

  factory FixturesByDateRangeFootball.fromJson(Map<String, dynamic> json) => FixturesByDateRangeFootball(
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
  dynamic winnerTeamId;
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
  Leg? leg;
  dynamic colors;
  bool? deleted;
  bool? isPlaceholder;
  Stats? stats;

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
    // weatherReport: json["weather_report"] == null ? null : WeatherReport.fromJson(json["weather_report"]),
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
    leg: legValues.map[json["leg"]],
    // colors: json["colors"],
    deleted: json["deleted"],
    isPlaceholder: json["is_placeholder"],
    stats: Stats.fromJson(json["stats"]),
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
    "weather_report": weatherReport == null ? null : weatherReport!.toJson(),
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

enum Leg { THE_11 }

final legValues = EnumValues({
  "1/1": Leg.THE_11
});

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

class Stats {
  Stats({
    this.data,
  });

  List<dynamic>? data;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
    data: List<dynamic>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x)),
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

  Status? status;
  StartingAt? startingAt;
  dynamic minute;
  dynamic second;
  dynamic addedTime;
  dynamic extraMinute;
  dynamic injuryTime;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    status: statusValues.map[json["status"]],
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
    timezone: timezoneValues.map[json["timezone"]],
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

enum Status { NS }

final statusValues = EnumValues({
  "NS": Status.NS
});

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
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
