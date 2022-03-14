
import 'dart:convert';

FootballLiveScore footballLiveScoreFromJson(String str) => FootballLiveScore.fromJson(json.decode(str));

String footballLiveScoreToJson(FootballLiveScore data) => json.encode(data.toJson());

class FootballLiveScore {
  FootballLiveScore({
    required this.data,
    required this.meta,
  });

  List<Datum> data;
  Meta meta;

  factory FootballLiveScore.fromJson(Map<String, dynamic> json) => FootballLiveScore(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": meta.toJson(),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.leagueId,
    required this.seasonId,
    required this.stageId,
    required this.roundId,
    required this.groupId,
    required this.aggregateId,
    required this.venueId,
    required this.refereeId,
    required this.localteamId,
    required this.visitorteamId,
    required this.winnerTeamId,
    required this.weatherReport,
    required this.commentaries,
    required this.attendance,
    required  this.pitch,
    required this.details,
    required this.neutralVenue,
    required this.winningOddsCalculated,
    required this.formations,
    required  this.scores,
    required  this.time,
    required  this.coaches,
    required this.standings,
    required  this.assistants,
    required  this.leg,
    required  this.colors,
    required   this.deleted,
    required this.isPlaceholder,
  });

  int id;
  int leagueId;
  int seasonId;
  int stageId;
  int roundId;
  dynamic groupId;
  dynamic aggregateId;
  int venueId;
  int refereeId;
  int localteamId;
  int visitorteamId;
  dynamic winnerTeamId;
  dynamic weatherReport;
  bool commentaries;
  dynamic attendance;
  dynamic pitch;
  dynamic details;
  bool neutralVenue;
  bool winningOddsCalculated;
  Formations formations;
  Scores scores;
  Time time;
  Coaches coaches;
  Standings standings;
  Assistants assistants;
  String leg;
  dynamic colors;
  bool deleted;
  bool isPlaceholder;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    colors: json["colors"],
    deleted: json["deleted"],
    isPlaceholder: json["is_placeholder"],
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
    "formations": formations.toJson(),
    "scores": scores.toJson(),
    "time": time.toJson(),
    "coaches": coaches.toJson(),
    "standings": standings.toJson(),
    "assistants": assistants.toJson(),
    "leg": leg,
    "colors": colors,
    "deleted": deleted,
    "is_placeholder": isPlaceholder,
  };
}

class Assistants {
  Assistants({
    required  this.firstAssistantId,
    required this.secondAssistantId,
    required this.fourthOfficialId,
  });

  int firstAssistantId;
  int secondAssistantId;
  int fourthOfficialId;

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
    required  this.localteamCoachId,
    required  this.visitorteamCoachId,
  });

  int localteamCoachId;
  int visitorteamCoachId;

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
    required  this.localteamFormation,
    required this.visitorteamFormation,
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

class Scores {
  Scores({
    required  this.localteamScore,
    required  this.visitorteamScore,
    required  this.localteamPenScore,
    required this.visitorteamPenScore,
    required  this.htScore,
    required  this.ftScore,
    required  this.etScore,
    required  this.psScore,
  });

  int localteamScore;
  int visitorteamScore;
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
    required  this.localteamPosition,
    required this.visitorteamPosition,
  });

  int localteamPosition;
  int visitorteamPosition;

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
    required  this.status,
    required  this.startingAt,
    required this.minute,
    required this.second,
    required this.addedTime,
    required this.extraMinute,
    required this.injuryTime,
  });

  String status;
  StartingAt startingAt;
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
    "starting_at": startingAt.toJson(),
    "minute": minute,
    "second": second,
    "added_time": addedTime,
    "extra_minute": extraMinute,
    "injury_time": injuryTime,
  };
}

class StartingAt {
  StartingAt({
    required this.dateTime,
    required this.date,
    required this.time,
    required this.timestamp,
    required this.timezone,
  });

  DateTime dateTime;
  DateTime date;
  String time;
  int timestamp;
  String timezone;

  factory StartingAt.fromJson(Map<String, dynamic> json) => StartingAt(
    dateTime: DateTime.parse(json["date_time"]),
    date: DateTime.parse(json["date"]),
    time: json["time"],
    timestamp: json["timestamp"],
    timezone: json["timezone"],
  );

  Map<String, dynamic> toJson() => {
    "date_time": dateTime.toIso8601String(),
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "time": time,
    "timestamp": timestamp,
    "timezone": timezone,
  };
}

class Meta {
  Meta({
    required this.plans,
    required this.sports,
    required this.pagination,
  });

  List<Plan> plans;
  List<Sport> sports;
  Pagination pagination;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    plans: List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))),
    sports: List<Sport>.from(json["sports"].map((x) => Sport.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
    "sports": List<dynamic>.from(sports.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };
}

class Pagination {
  Pagination({
    required  this.total,
    required  this.count,
    required this.perPage,
    required  this.currentPage,
    required this.totalPages,
    required  this.links,
  });

  int total;
  int count;
  int perPage;
  int currentPage;
  int totalPages;
  Links links;

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
    "links": links.toJson(),
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
    required this.name,
    required this.features,
    required this.requestLimit,
    required this.sport,
  });

  String name;
  String features;
  String requestLimit;
  String sport;

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
    required  this.id,
    required  this.name,
    required  this.current,
  });

  int id;
  String name;
  bool current;

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
