

class HeadToHeadFootball {
  List<Data>? data;
  Meta? meta;

  HeadToHeadFootball({this.data, this.meta});

  HeadToHeadFootball.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? leagueId;
  int? seasonId;
  int? stageId;
  int? roundId;
  int? groupId;
  Null? aggregateId;
  int? venueId;
  int? refereeId;
  int? localteamId;
  int? visitorteamId;
  int? winnerTeamId;
  WeatherReport? weatherReport;
  bool? commentaries;
  int? attendance;
  String? pitch;
  Null? details;
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

  Data(
      {this.id,
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
        this.isPlaceholder});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leagueId = json['league_id'];
    seasonId = json['season_id'];
    stageId = json['stage_id'];
    roundId = json['round_id'];
    groupId = json['group_id'];
    aggregateId = json['aggregate_id'];
    venueId = json['venue_id'];
    refereeId = json['referee_id'];
    localteamId = json['localteam_id'];
    visitorteamId = json['visitorteam_id'];
    winnerTeamId = json['winner_team_id'];
    weatherReport = json['weather_report'] != null
        ? new WeatherReport.fromJson(json['weather_report'])
        : null;
    commentaries = json['commentaries'];
    attendance = json['attendance'];
    pitch = json['pitch'];
    details = json['details'];
    neutralVenue = json['neutral_venue'];
    winningOddsCalculated = json['winning_odds_calculated'];
    formations = json['formations'] != null
        ? new Formations.fromJson(json['formations'])
        : null;
    scores =
    json['scores'] != null ? new Scores.fromJson(json['scores']) : null;
    time = json['time'] != null ? new Time.fromJson(json['time']) : null;
    coaches =
    json['coaches'] != null ? new Coaches.fromJson(json['coaches']) : null;
    standings = json['standings'] != null
        ? new Standings.fromJson(json['standings'])
        : null;
    assistants = json['assistants'] != null
        ? new Assistants.fromJson(json['assistants'])
        : null;
    leg = json['leg'];
    colors =
    json['colors'] != null ? new Colors.fromJson(json['colors']) : null;
    deleted = json['deleted'];
    isPlaceholder = json['is_placeholder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['league_id'] = this.leagueId;
    data['season_id'] = this.seasonId;
    data['stage_id'] = this.stageId;
    data['round_id'] = this.roundId;
    data['group_id'] = this.groupId;
    data['aggregate_id'] = this.aggregateId;
    data['venue_id'] = this.venueId;
    data['referee_id'] = this.refereeId;
    data['localteam_id'] = this.localteamId;
    data['visitorteam_id'] = this.visitorteamId;
    data['winner_team_id'] = this.winnerTeamId;
    if (this.weatherReport != null) {
      data['weather_report'] = this.weatherReport!.toJson();
    }
    data['commentaries'] = this.commentaries;
    data['attendance'] = this.attendance;
    data['pitch'] = this.pitch;
    data['details'] = this.details;
    data['neutral_venue'] = this.neutralVenue;
    data['winning_odds_calculated'] = this.winningOddsCalculated;
    if (this.formations != null) {
      data['formations'] = this.formations!.toJson();
    }
    if (this.scores != null) {
      data['scores'] = this.scores!.toJson();
    }
    if (this.time != null) {
      data['time'] = this.time!.toJson();
    }
    if (this.coaches != null) {
      data['coaches'] = this.coaches!.toJson();
    }
    if (this.standings != null) {
      data['standings'] = this.standings!.toJson();
    }
    if (this.assistants != null) {
      data['assistants'] = this.assistants!.toJson();
    }
    data['leg'] = this.leg;
    if (this.colors != null) {
      data['colors'] = this.colors!.toJson();
    }
    data['deleted'] = this.deleted;
    data['is_placeholder'] = this.isPlaceholder;
    return data;
  }
}

class WeatherReport {
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
  String? updatedAt;

  WeatherReport(
      {this.code,
        this.type,
        this.icon,
        this.temperature,
        this.temperatureCelcius,
        this.clouds,
        this.humidity,
        this.pressure,
        this.wind,
        this.coordinates,
        this.updatedAt});

  WeatherReport.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    type = json['type'];
    icon = json['icon'];
    temperature = json['temperature'] != null
        ? new Temperature.fromJson(json['temperature'])
        : null;
    temperatureCelcius = json['temperature_celcius'] != null
        ? new Temperature.fromJson(json['temperature_celcius'])
        : null;
    clouds = json['clouds'];
    humidity = json['humidity'];
    pressure = json['pressure'];
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['type'] = this.type;
    data['icon'] = this.icon;
    if (this.temperature != null) {
      data['temperature'] = this.temperature!.toJson();
    }
    if (this.temperatureCelcius != null) {
      data['temperature_celcius'] = this.temperatureCelcius!.toJson();
    }
    data['clouds'] = this.clouds;
    data['humidity'] = this.humidity;
    data['pressure'] = this.pressure;
    if (this.wind != null) {
      data['wind'] = this.wind!.toJson();
    }
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates!.toJson();
    }
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Temperature {
  double? temp;
  String? unit;

  Temperature({this.temp, this.unit});

  Temperature.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['unit'] = this.unit;
    return data;
  }
}

class Wind {
  String? speed;
  int? degree;

  Wind({this.speed, this.degree});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    degree = json['degree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this.speed;
    data['degree'] = this.degree;
    return data;
  }
}

class Coordinates {
  double? lat;
  double? lon;

  Coordinates({this.lat, this.lon});

  Coordinates.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}

class Formations {
  String? localteamFormation;
  String? visitorteamFormation;

  Formations({this.localteamFormation, this.visitorteamFormation});

  Formations.fromJson(Map<String, dynamic> json) {
    localteamFormation = json['localteam_formation'];
    visitorteamFormation = json['visitorteam_formation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localteam_formation'] = this.localteamFormation;
    data['visitorteam_formation'] = this.visitorteamFormation;
    return data;
  }
}

class Scores {
  int? localteamScore;
  int? visitorteamScore;
  Null? localteamPenScore;
  int? visitorteamPenScore;
  String? htScore;
  String? ftScore;
  Null? etScore;
  Null? psScore;

  Scores(
      {this.localteamScore,
        this.visitorteamScore,
        this.localteamPenScore,
        this.visitorteamPenScore,
        this.htScore,
        this.ftScore,
        this.etScore,
        this.psScore});

  Scores.fromJson(Map<String, dynamic> json) {
    localteamScore = json['localteam_score'];
    visitorteamScore = json['visitorteam_score'];
    localteamPenScore = json['localteam_pen_score'];
    visitorteamPenScore = json['visitorteam_pen_score'];
    htScore = json['ht_score'];
    ftScore = json['ft_score'];
    etScore = json['et_score'];
    psScore = json['ps_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localteam_score'] = this.localteamScore;
    data['visitorteam_score'] = this.visitorteamScore;
    data['localteam_pen_score'] = this.localteamPenScore;
    data['visitorteam_pen_score'] = this.visitorteamPenScore;
    data['ht_score'] = this.htScore;
    data['ft_score'] = this.ftScore;
    data['et_score'] = this.etScore;
    data['ps_score'] = this.psScore;
    return data;
  }
}

class Time {
  String? status;
  StartingAt? startingAt;
  int? minute;
  int? second;
  int? addedTime;
  Null? extraMinute;
  Null? injuryTime;

  Time(
      {this.status,
        this.startingAt,
        this.minute,
        this.second,
        this.addedTime,
        this.extraMinute,
        this.injuryTime});

  Time.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    startingAt = json['starting_at'] != null
        ? new StartingAt.fromJson(json['starting_at'])
        : null;
    minute = json['minute'];
    second = json['second'];
    addedTime = json['added_time'];
    extraMinute = json['extra_minute'];
    injuryTime = json['injury_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.startingAt != null) {
      data['starting_at'] = this.startingAt!.toJson();
    }
    data['minute'] = this.minute;
    data['second'] = this.second;
    data['added_time'] = this.addedTime;
    data['extra_minute'] = this.extraMinute;
    data['injury_time'] = this.injuryTime;
    return data;
  }
}

class StartingAt {
  String? dateTime;
  String? date;
  String? time;
  int? timestamp;
  String? timezone;

  StartingAt(
      {this.dateTime, this.date, this.time, this.timestamp, this.timezone});

  StartingAt.fromJson(Map<String, dynamic> json) {
    dateTime = json['date_time'];
    date = json['date'];
    time = json['time'];
    timestamp = json['timestamp'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_time'] = this.dateTime;
    data['date'] = this.date;
    data['time'] = this.time;
    data['timestamp'] = this.timestamp;
    data['timezone'] = this.timezone;
    return data;
  }
}

class Coaches {
  int? localteamCoachId;
  int? visitorteamCoachId;

  Coaches({this.localteamCoachId, this.visitorteamCoachId});

  Coaches.fromJson(Map<String, dynamic> json) {
    localteamCoachId = json['localteam_coach_id'];
    visitorteamCoachId = json['visitorteam_coach_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localteam_coach_id'] = this.localteamCoachId;
    data['visitorteam_coach_id'] = this.visitorteamCoachId;
    return data;
  }
}

class Standings {
  int? localteamPosition;
  int? visitorteamPosition;

  Standings({this.localteamPosition, this.visitorteamPosition});

  Standings.fromJson(Map<String, dynamic> json) {
    localteamPosition = json['localteam_position'];
    visitorteamPosition = json['visitorteam_position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localteam_position'] = this.localteamPosition;
    data['visitorteam_position'] = this.visitorteamPosition;
    return data;
  }
}

class Assistants {
  int? firstAssistantId;
  int? secondAssistantId;
  int? fourthOfficialId;

  Assistants(
      {this.firstAssistantId, this.secondAssistantId, this.fourthOfficialId});

  Assistants.fromJson(Map<String, dynamic> json) {
    firstAssistantId = json['first_assistant_id'];
    secondAssistantId = json['second_assistant_id'];
    fourthOfficialId = json['fourth_official_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_assistant_id'] = this.firstAssistantId;
    data['second_assistant_id'] = this.secondAssistantId;
    data['fourth_official_id'] = this.fourthOfficialId;
    return data;
  }
}

class Colors {
  Localteam? localteam;
  Localteam? visitorteam;

  Colors({this.localteam, this.visitorteam});

  Colors.fromJson(Map<String, dynamic> json) {
    localteam = json['localteam'] != null
        ? new Localteam.fromJson(json['localteam'])
        : null;
    visitorteam = json['visitorteam'] != null
        ? new Localteam.fromJson(json['visitorteam'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.localteam != null) {
      data['localteam'] = this.localteam!.toJson();
    }
    if (this.visitorteam != null) {
      data['visitorteam'] = this.visitorteam!.toJson();
    }
    return data;
  }
}

class Localteam {
  String? color;
  String? kitColors;

  Localteam({this.color, this.kitColors});

  Localteam.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    kitColors = json['kit_colors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['kit_colors'] = this.kitColors;
    return data;
  }
}

class Meta {
  List<Plans>? plans;
  List<Sports>? sports;

  Meta({this.plans, this.sports});

  Meta.fromJson(Map<String, dynamic> json) {
    if (json['plans'] != null) {
      plans = <Plans>[];
      json['plans'].forEach((v) {
        plans!.add(new Plans.fromJson(v));
      });
    }
    if (json['sports'] != null) {
      sports = <Sports>[];
      json['sports'].forEach((v) {
        sports!.add(new Sports.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.plans != null) {
      data['plans'] = this.plans!.map((v) => v.toJson()).toList();
    }
    if (this.sports != null) {
      data['sports'] = this.sports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plans {
  String? name;
  String? features;
  String? requestLimit;
  String? sport;

  Plans({this.name, this.features, this.requestLimit, this.sport});

  Plans.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    features = json['features'];
    requestLimit = json['request_limit'];
    sport = json['sport'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['features'] = this.features;
    data['request_limit'] = this.requestLimit;
    data['sport'] = this.sport;
    return data;
  }
}

class Sports {
  int? id;
  String? name;
  bool? current;

  Sports({this.id, this.name, this.current});

  Sports.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    current = json['current'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['current'] = this.current;
    return data;
  }
}
