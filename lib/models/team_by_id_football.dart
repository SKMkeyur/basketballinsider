class TeamByIdFootball {
  Data? data;
  Meta? meta;

  TeamByIdFootball({this.data, this.meta});

  TeamByIdFootball.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
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

  Data(
      {this.id,
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
        this.isPlaceholder});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    legacyId = json['legacy_id'];
    name = json['name'];
    shortCode = json['short_code'].toString()==null ? "" : json['short_code'];
    twitter = json['twitter'].toString()==null ? "" : json['twitter'];
    countryId = json['country_id'];
    nationalTeam = json['national_team'];
    founded = json['founded'];
    logoPath = json['logo_path'];
    venueId = json['venue_id'];
    currentSeasonId = json['current_season_id'];
    isPlaceholder = json['is_placeholder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['legacy_id'] = this.legacyId;
    data['name'] = this.name;
    data['short_code'] = this.shortCode;
    data['twitter'] = this.twitter;
    data['country_id'] = this.countryId;
    data['national_team'] = this.nationalTeam;
    data['founded'] = this.founded;
    data['logo_path'] = this.logoPath;
    data['venue_id'] = this.venueId;
    data['current_season_id'] = this.currentSeasonId;
    data['is_placeholder'] = this.isPlaceholder;
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
