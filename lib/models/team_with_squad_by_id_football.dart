// To parse this JSON data, do
//
//     final teamWithSquadByIdFootball = teamWithSquadByIdFootballFromJson(jsonString);

import 'dart:convert';

TeamWithSquadByIdFootball teamWithSquadByIdFootballFromJson(String str) => TeamWithSquadByIdFootball.fromJson(json.decode(str));

String teamWithSquadByIdFootballToJson(TeamWithSquadByIdFootball data) => json.encode(data.toJson());

class TeamWithSquadByIdFootball {
  TeamWithSquadByIdFootball({
    this.data,
    this.meta,
  });

  TeamWithSquadByIdFootballData? data;
  Meta? meta;

  factory TeamWithSquadByIdFootball.fromJson(Map<String, dynamic> json) => TeamWithSquadByIdFootball(
    data: TeamWithSquadByIdFootballData.fromJson(json["data"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
    "meta": meta!.toJson(),
  };
}

class TeamWithSquadByIdFootballData {
  TeamWithSquadByIdFootballData({
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
    this.squad,
  });

  int? id;
  int? legacyId;
  String? name;
  String? shortCode;
  dynamic twitter;
  int? countryId;
  bool? nationalTeam;
  int? founded;
  String? logoPath;
  int? venueId;
  int? currentSeasonId;
  bool? isPlaceholder;
  Squad? squad;

  factory TeamWithSquadByIdFootballData.fromJson(Map<String, dynamic> json) => TeamWithSquadByIdFootballData(
    id: json["id"],
    legacyId: json["legacy_id"],
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
    squad: Squad.fromJson(json["squad"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "legacy_id": legacyId,
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
    "squad": squad!.toJson(),
  };
}

class Squad {
  Squad({
    this.data,
  });

  List<Datum>? data;

  factory Squad.fromJson(Map<String, dynamic> json) => Squad(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.playerId,
    this.positionId,
    this.number,
    this.captain,
    this.injured,
    this.minutes,
    this.appearences,
    this.lineups,
    this.substituteIn,
    this.substituteOut,
    this.substitutesOnBench,
    this.goals,
    this.owngoals,
    this.assists,
    this.saves,
    this.insideBoxSaves,
    this.dispossesed,
    this.interceptions,
    this.yellowcards,
    this.yellowred,
    this.redcards,
    this.tackles,
    this.blocks,
    this.hitPost,
    this.cleansheets,
    this.rating,
    this.fouls,
    this.crosses,
    this.dribbles,
    this.duels,
    this.passes,
    this.penalties,
    this.shots,
    this.player,
  });

  int? playerId;
  int? positionId;
  int? number;
  int? captain;
  bool? injured;
  int? minutes;
  int? appearences;
  int? lineups;
  int? substituteIn;
  int? substituteOut;
  int? substitutesOnBench;
  int? goals;
  int? owngoals;
  int? assists;
  int? saves;
  int? insideBoxSaves;
  int? dispossesed;
  int? interceptions;
  int? yellowcards;
  dynamic yellowred;
  dynamic redcards;
  int? tackles;
  int? blocks;
  int? hitPost;
  int? cleansheets;
  String? rating;
  Fouls? fouls;
  Crosses? crosses;
  Dribbles? dribbles;
  Duels? duels;
  Passes? passes;
  Penalties? penalties;
  Shots? shots;
  Player? player;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    playerId: json["player_id"],
    positionId: json["position_id"],
    number: json["number"] == null ? null : json["number"],
    captain: json["captain"],
    injured: json["injured"],
    minutes: json["minutes"] == null ? null : json["minutes"],
    appearences: json["appearences"] == null ? null : json["appearences"],
    lineups: json["lineups"] == null ? null : json["lineups"],
    substituteIn: json["substitute_in"] == null ? null : json["substitute_in"],
    substituteOut: json["substitute_out"] == null ? null : json["substitute_out"],
    substitutesOnBench: json["substitutes_on_bench"] == null ? null : json["substitutes_on_bench"],
    goals: json["goals"] == null ? null : json["goals"],
    owngoals: json["owngoals"] == null ? null : json["owngoals"],
    assists: json["assists"] == null ? null : json["assists"],
    saves: json["saves"] == null ? null : json["saves"],
    insideBoxSaves: json["inside_box_saves"] == null ? null : json["inside_box_saves"],
    dispossesed: json["dispossesed"] == null ? null : json["dispossesed"],
    interceptions: json["interceptions"] == null ? null : json["interceptions"],
    yellowcards: json["yellowcards"] == null ? null : json["yellowcards"],
    yellowred: json["yellowred"],
    redcards: json["redcards"],
    tackles: json["tackles"] == null ? null : json["tackles"],
    blocks: json["blocks"] == null ? null : json["blocks"],
    hitPost: json["hit_post"] == null ? null : json["hit_post"],
    cleansheets: json["cleansheets"] == null ? null : json["cleansheets"],
    rating: json["rating"] == null ? null : json["rating"],
    fouls: Fouls.fromJson(json["fouls"]),
    crosses: Crosses.fromJson(json["crosses"]),
    dribbles: Dribbles.fromJson(json["dribbles"]),
    duels: Duels.fromJson(json["duels"]),
    passes: Passes.fromJson(json["passes"]),
    penalties: Penalties.fromJson(json["penalties"]),
    shots: Shots.fromJson(json["shots"]),
    player: Player.fromJson(json["player"]),
  );

  Map<String, dynamic> toJson() => {
    "player_id": playerId,
    "position_id": positionId,
    "number": number == null ? null : number,
    "captain": captain,
    "injured": injured,
    "minutes": minutes == null ? null : minutes,
    "appearences": appearences == null ? null : appearences,
    "lineups": lineups == null ? null : lineups,
    "substitute_in": substituteIn == null ? null : substituteIn,
    "substitute_out": substituteOut == null ? null : substituteOut,
    "substitutes_on_bench": substitutesOnBench == null ? null : substitutesOnBench,
    "goals": goals == null ? null : goals,
    "owngoals": owngoals == null ? null : owngoals,
    "assists": assists == null ? null : assists,
    "saves": saves == null ? null : saves,
    "inside_box_saves": insideBoxSaves == null ? null : insideBoxSaves,
    "dispossesed": dispossesed == null ? null : dispossesed,
    "interceptions": interceptions == null ? null : interceptions,
    "yellowcards": yellowcards == null ? null : yellowcards,
    "yellowred": yellowred,
    "redcards": redcards,
    "tackles": tackles == null ? null : tackles,
    "blocks": blocks == null ? null : blocks,
    "hit_post": hitPost == null ? null : hitPost,
    "cleansheets": cleansheets == null ? null : cleansheets,
    "rating": rating == null ? null : rating,
    "fouls": fouls!.toJson(),
    "crosses": crosses!.toJson(),
    "dribbles": dribbles!.toJson(),
    "duels": duels!.toJson(),
    "passes": passes!.toJson(),
    "penalties": penalties!.toJson(),
    "shots": shots!.toJson(),
    "player": player!.toJson(),
  };
}

class Crosses {
  Crosses({
    this.total,
    this.accurate,
  });

  int? total;
  int? accurate;

  factory Crosses.fromJson(Map<String, dynamic> json) => Crosses(
    total: json["total"] == null ? null : json["total"],
    accurate: json["accurate"] == null ? null : json["accurate"],
  );

  Map<String, dynamic> toJson() => {
    "total": total == null ? null : total,
    "accurate": accurate == null ? null : accurate,
  };
}

class Dribbles {
  Dribbles({
    this.attempts,
    this.success,
    this.dribbledPast,
  });

  int? attempts;
  int? success;
  int? dribbledPast;

  factory Dribbles.fromJson(Map<String, dynamic> json) => Dribbles(
    attempts: json["attempts"] == null ? null : json["attempts"],
    success: json["success"] == null ? null : json["success"],
    dribbledPast: json["dribbled_past"] == null ? null : json["dribbled_past"],
  );

  Map<String, dynamic> toJson() => {
    "attempts": attempts == null ? null : attempts,
    "success": success == null ? null : success,
    "dribbled_past": dribbledPast == null ? null : dribbledPast,
  };
}

class Duels {
  Duels({
    this.total,
    this.won,
  });

  int? total;
  int? won;

  factory Duels.fromJson(Map<String, dynamic> json) => Duels(
    total: json["total"] == null ? null : json["total"],
    won: json["won"] == null ? null : json["won"],
  );

  Map<String, dynamic> toJson() => {
    "total": total == null ? null : total,
    "won": won == null ? null : won,
  };
}

class Fouls {
  Fouls({
    this.committed,
    this.drawn,
  });

  int? committed;
  int? drawn;

  factory Fouls.fromJson(Map<String, dynamic> json) => Fouls(
    committed: json["committed"] == null ? null : json["committed"],
    drawn: json["drawn"] == null ? null : json["drawn"],
  );

  Map<String, dynamic> toJson() => {
    "committed": committed == null ? null : committed,
    "drawn": drawn == null ? null : drawn,
  };
}

class Passes {
  Passes({
    this.total,
    this.accuracy,
    this.keyPasses,
  });

  int? total;
  int? accuracy;
  int? keyPasses;

  factory Passes.fromJson(Map<String, dynamic> json) => Passes(
    total: json["total"] == null ? null : json["total"],
    accuracy: json["accuracy"] == null ? null : json["accuracy"],
    keyPasses: json["key_passes"] == null ? null : json["key_passes"],
  );

  Map<String, dynamic> toJson() => {
    "total": total == null ? null : total,
    "accuracy": accuracy == null ? null : accuracy,
    "key_passes": keyPasses == null ? null : keyPasses,
  };
}

class Penalties {
  Penalties({
    this.won,
    this.scores,
    this.missed,
    this.committed,
    this.saves,
  });

  int? won;
  int? scores;
  int? missed;
  dynamic committed;
  dynamic saves;

  factory Penalties.fromJson(Map<String, dynamic> json) => Penalties(
    won: json["won"] == null ? null : json["won"],
    scores: json["scores"] == null ? null : json["scores"],
    missed: json["missed"] == null ? null : json["missed"],
    committed: json["committed"],
    saves: json["saves"],
  );

  Map<String, dynamic> toJson() => {
    "won": won == null ? null : won,
    "scores": scores == null ? null : scores,
    "missed": missed == null ? null : missed,
    "committed": committed,
    "saves": saves,
  };
}

class Player {
  Player({
    this.data,
  });

  PlayerData? data;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    data: PlayerData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class PlayerData {
  PlayerData({
    this.playerId,
    this.teamId,
    this.countryId,
    this.positionId,
    this.commonName,
    this.displayName,
    this.fullname,
    this.firstname,
    this.lastname,
    this.nationality,
    this.birthdate,
    this.birthcountry,
    this.birthplace,
    this.height,
    this.weight,
    this.imagePath,
  });

  int? playerId;
  int? teamId;
  int? countryId;
  int? positionId;
  String? commonName;
  String? displayName;
  String? fullname;
  String? firstname;
  String? lastname;
  String? nationality;
  String? birthdate;
  String? birthcountry;
  String? birthplace;
  String? height;
  String? weight;
  String? imagePath;

  factory PlayerData.fromJson(Map<String, dynamic> json) => PlayerData(
    playerId: json["player_id"],
    teamId: json["team_id"],
    countryId: json["country_id"],
    positionId: json["position_id"],
    commonName: json["common_name"],
    displayName: json["display_name"],
    fullname: json["fullname"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    nationality: json["nationality"],
    birthdate: json["birthdate"],
    birthcountry: json["birthcountry"],
    birthplace: json["birthplace"] == null ? null : json["birthplace"],
    height: json["height"] == null ? null : json["height"],
    weight: json["weight"] == null ? null : json["weight"],
    imagePath: json["image_path"],
  );

  Map<String, dynamic> toJson() => {
    "player_id": playerId,
    "team_id": teamId,
    "country_id": countryId,
    "position_id": positionId,
    "common_name": commonName,
    "display_name": displayName,
    "fullname": fullname,
    "firstname": firstname,
    "lastname": lastname,
    "nationality": nationality,
    "birthdate": birthdate,
    "birthcountry": birthcountry,
    "birthplace": birthplace == null ? null : birthplace,
    "height": height == null ? null : height,
    "weight": weight == null ? null : weight,
    "image_path": imagePath,
  };
}

class Shots {
  Shots({
    this.shotsTotal,
    this.shotsOnTarget,
    this.shotsOffTarget,
  });

  int? shotsTotal;
  int? shotsOnTarget;
  dynamic shotsOffTarget;

  factory Shots.fromJson(Map<String, dynamic> json) => Shots(
    shotsTotal: json["shots_total"] == null ? null : json["shots_total"],
    shotsOnTarget: json["shots_on_target"] == null ? null : json["shots_on_target"],
    shotsOffTarget: json["shots_off_target"],
  );

  Map<String, dynamic> toJson() => {
    "shots_total": shotsTotal == null ? null : shotsTotal,
    "shots_on_target": shotsOnTarget == null ? null : shotsOnTarget,
    "shots_off_target": shotsOffTarget,
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
