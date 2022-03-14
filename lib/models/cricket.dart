// To parse this JSON data, do
//
//     final cricket = cricketFromJson(jsonString);

import 'dart:convert';

Cricket cricketFromJson(String str) => Cricket.fromJson(json.decode(str));

String cricketToJson(Cricket data) => json.encode(data.toJson());

class Cricket {
  Cricket({
    this.data,
    this.links,
    this.meta,
  });

  List<Datum>? data;
  Links? links;
  Meta? meta;

  factory Cricket.fromJson(Map<String, dynamic> json) => Cricket(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links!.toJson(),
    "meta": meta!.toJson(),
  };
}

class Datum {
  Datum({
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
    this.league,
    this.localteam,
    this.visitorteam,
    this.venue,
  });

  DatumResource? resource;
  int? id;
  int? leagueId;
  int? seasonId;
  int? stageId;
  String? round;
  int? localteamId;
  int? visitorteamId;
  DateTime? startingAt;
  DatumType? type;
  bool? live;
  String? status;
  dynamic lastPeriod;
  String? note;
  int? venueId;
  int? tossWonTeamId;
  int? winnerTeamId;
  dynamic drawNoresult;
  int? firstUmpireId;
  int? secondUmpireId;
  int? tvUmpireId;
  int? refereeId;
  int? manOfMatchId;
  int? manOfSeriesId;
  int? totalOversPlayed;
  Elected? elected;
  bool? superOver;
  bool? followOn;
  TeamDlData? localteamDlData;
  TeamDlData? visitorteamDlData;
  String? rpcOvers;
  String? rpcTarget;
  List<dynamic>? weatherReport;
  League? league;
  League? localteam;
  League? visitorteam;
  Venue? venue;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    resource: datumResourceValues.map![json["resource"]],
    id: json["id"],
    leagueId: json["league_id"],
    seasonId: json["season_id"],
    stageId: json["stage_id"],
    round: json["round"],
    localteamId: json["localteam_id"],
    visitorteamId: json["visitorteam_id"],
    startingAt: DateTime.parse(json["starting_at"]),
    type: datumTypeValues.map![json["type"]],
    live: json["live"],
   status: json["status"],
   // status: statusValues.map![json["status"]],
    lastPeriod: json["last_period"],
    note: json["note"],
    venueId: json["venue_id"],
    tossWonTeamId: json["toss_won_team_id"] == null ? null : json["toss_won_team_id"],
    winnerTeamId: json["winner_team_id"] == null ? null : json["winner_team_id"],
    drawNoresult: json["draw_noresult"],
    firstUmpireId: json["first_umpire_id"] == null ? null : json["first_umpire_id"],
    secondUmpireId: json["second_umpire_id"] == null ? null : json["second_umpire_id"],
    tvUmpireId: json["tv_umpire_id"] == null ? null : json["tv_umpire_id"],
    refereeId: json["referee_id"] == null ? null : json["referee_id"],
    manOfMatchId: json["man_of_match_id"] == null ? null : json["man_of_match_id"],
    manOfSeriesId: json["man_of_series_id"] == null ? null : json["man_of_series_id"],
    totalOversPlayed: json["total_overs_played"] == null ? null : json["total_overs_played"],
    elected: json["elected"] == null ? null : electedValues.map![json["elected"]],
    superOver: json["super_over"],
    followOn: json["follow_on"],
    localteamDlData: TeamDlData.fromJson(json["localteam_dl_data"]),
    visitorteamDlData: TeamDlData.fromJson(json["visitorteam_dl_data"]),
    rpcOvers: json["rpc_overs"] == null ? null : json["rpc_overs"],
    rpcTarget: json["rpc_target"] == null ? null : json["rpc_target"],
    weatherReport: List<dynamic>.from(json["weather_report"].map((x) => x)),
    league: League.fromJson(json["league"]),
    localteam: League.fromJson(json["localteam"]),
    visitorteam: League.fromJson(json["visitorteam"]),
    venue: Venue.fromJson(json["venue"]),
  );

  Map<String, dynamic> toJson() => {
    "resource": datumResourceValues.reverse[resource],
    "id": id,
    "league_id": leagueId,
    "season_id": seasonId,
    "stage_id": stageId,
    "round": round,
    "localteam_id": localteamId,
    "visitorteam_id": visitorteamId,
    "starting_at": startingAt!.toIso8601String(),
    "type": datumTypeValues.reverse[type],
    "live": live,
    "status": statusValues.reverse[status],
    "last_period": lastPeriod,
    "note": note,
    "venue_id": venueId,
    "toss_won_team_id": tossWonTeamId == null ? null : tossWonTeamId,
    "winner_team_id": winnerTeamId == null ? null : winnerTeamId,
    "draw_noresult": drawNoresult,
    "first_umpire_id": firstUmpireId == null ? null : firstUmpireId,
    "second_umpire_id": secondUmpireId == null ? null : secondUmpireId,
    "tv_umpire_id": tvUmpireId == null ? null : tvUmpireId,
    "referee_id": refereeId == null ? null : refereeId,
    "man_of_match_id": manOfMatchId == null ? null : manOfMatchId,
    "man_of_series_id": manOfSeriesId == null ? null : manOfSeriesId,
    "total_overs_played": totalOversPlayed == null ? null : totalOversPlayed,
    "elected": elected == null ? null : electedValues.reverse[elected],
    "super_over": superOver,
    "follow_on": followOn,
    "localteam_dl_data": localteamDlData!.toJson(),
    "visitorteam_dl_data": visitorteamDlData!.toJson(),
    "rpc_overs": rpcOvers == null ? null : rpcOvers,
    "rpc_target": rpcTarget == null ? null : rpcTarget,
    "weather_report": List<dynamic>.from(weatherReport!.map((x) => x)),
    "league": league!.toJson(),
    "localteam": localteam!.toJson(),
    "visitorteam": visitorteam!.toJson(),
    "venue": venue!.toJson(),
  };
}

enum Elected { BOWLING, BATTING }

final electedValues = EnumValues({
  "batting": Elected.BATTING,
  "bowling": Elected.BOWLING
});

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

  LeagueResource? resource;
  int? id;
  int? seasonId;
  int? countryId;
  String? name;
  String? code;
  String? imagePath;
  LeagueType? type;
  DateTime? updatedAt;
  bool? nationalTeam;

  factory League.fromJson(Map<String, dynamic> json) => League(
    resource: leagueResourceValues.map![json["resource"]],
    id: json["id"],
    seasonId: json["season_id"] == null ? null : json["season_id"],
    countryId: json["country_id"],
    name: json["name"],
    code: json["code"],
    imagePath: json["image_path"],
    type: json["type"] == null ? null : leagueTypeValues.map![json["type"]],
    updatedAt: DateTime.parse(json["updated_at"]),
    nationalTeam: json["national_team"] == null ? null : json["national_team"],
  );

  Map<String, dynamic> toJson() => {
    "resource": leagueResourceValues.reverse[resource],
    "id": id,
    "season_id": seasonId == null ? null : seasonId,
    "country_id": countryId,
    "name": name,
    "code": code,
    "image_path": imagePath,
    "type": type == null ? null : leagueTypeValues.reverse[type],
    "updated_at": updatedAt!.toIso8601String(),
    "national_team": nationalTeam == null ? null : nationalTeam,
  };
}

enum LeagueResource { LEAGUES, TEAMS }

final leagueResourceValues = EnumValues({
  "leagues": LeagueResource.LEAGUES,
  "teams": LeagueResource.TEAMS
});

enum LeagueType { PHASE, LEAGUE }

final leagueTypeValues = EnumValues({
  "league": LeagueType.LEAGUE,
  "phase": LeagueType.PHASE
});

class TeamDlData {
  TeamDlData({
    this.score,
    this.overs,
    this.wicketsOut,
  });

  String? score;
  String? overs;
  String? wicketsOut;

  factory TeamDlData.fromJson(Map<String, dynamic> json) => TeamDlData(
    score: json["score"] == null ? null : json["score"],
    overs: json["overs"] == null ? null : json["overs"],
    wicketsOut: json["wickets_out"] == null ? null : json["wickets_out"],
  );

  Map<String, dynamic> toJson() => {
    "score": score == null ? null : score,
    "overs": overs == null ? null : overs,
    "wickets_out": wicketsOut == null ? null : wicketsOut,
  };
}

enum DatumResource { FIXTURES }

final datumResourceValues = EnumValues({
  "fixtures": DatumResource.FIXTURES
});

enum Status { Finished, Postponded, Canceled, Upcoming }

final statusValues = EnumValues({
  "Cancl.": Status.Canceled,
  "Finished": Status.Finished,
  "NS": Status.Upcoming,
  "Postp.": Status.Postponded
});

enum DatumType { T20_I, T20 }

final datumTypeValues = EnumValues({
  "T20": DatumType.T20,
  "T20I": DatumType.T20_I
});

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

  VenueResource? resource;
  int? id;
  int? countryId;
  String? name;
  String? city;
  String? imagePath;
  int? capacity;
  bool? floodlight;
  DateTime? updatedAt;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    resource: venueResourceValues.map![json["resource"]],
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
    "resource": venueResourceValues.reverse[resource],
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

enum VenueResource { VENUES }

final venueResourceValues = EnumValues({
  "venues": VenueResource.VENUES
});

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "links": List<dynamic>.from(links!.map((x) => x.toJson())),
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"] == null ? null : json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "label": label,
    "active": active,
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
