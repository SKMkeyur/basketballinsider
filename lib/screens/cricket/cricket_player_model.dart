class CricketPlayer {
  Data? data;

  CricketPlayer({this.data});

  CricketPlayer.fromJson(Map<String, dynamic> json) {
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
  List<Career>? career;

  Data(
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
        this.updatedAt,
        this.career});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (json['career'] != null) {
      career = <Career>[];
      json['career'].forEach((v) {
        career!.add(new Career.fromJson(v));
      });
    }
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
    if (this.career != null) {
      data['career'] = this.career!.map((v) => v.toJson()).toList();
    }
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

class Career {
  String? resource;
  String? type;
  dynamic seasonId;
  dynamic playerId;
  Bowling? bowling;
  Batting? batting;
  String? updatedAt;

  Career(
      {this.resource,
        this.type,
        this.seasonId,
        this.playerId,
        this.bowling,
        this.batting,
        this.updatedAt});

  Career.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    type = json['type'];
    seasonId = json['season_id']==null?"": json['season_id'];
    playerId = json['player_id']==null?"":json['player_id'];
    bowling =
    json['bowling'] != null ? new Bowling.fromJson(json['bowling']) : null;
    batting =
    json['batting'] != null ? new Batting.fromJson(json['batting']) : null;
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resource'] = this.resource;
    data['type'] = this.type;
    data['season_id'] = this.seasonId;
    data['player_id'] = this.playerId;
    if (this.bowling != null) {
      data['bowling'] = this.bowling!.toJson();
    }
    if (this.batting != null) {
      data['batting'] = this.batting!.toJson();
    }
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Bowling {
  dynamic matches;
  dynamic overs;
  dynamic innings;
  dynamic average;
  dynamic econRate;
  dynamic medians;
  dynamic runs;
  dynamic wickets;
  dynamic wide;
  dynamic noball;
  dynamic strikeRate;
  dynamic fourWickets;
  dynamic fiveWickets;
  dynamic tenWickets;
  dynamic rate;

  Bowling(
      {this.matches,
        this.overs,
        this.innings,
        this.average,
        this.econRate,
        this.medians,
        this.runs,
        this.wickets,
        this.wide,
        this.noball,
        this.strikeRate,
        this.fourWickets,
        this.fiveWickets,
        this.tenWickets,
        this.rate});

  Bowling.fromJson(Map<String, dynamic> json) {
    matches = json['matches']==null ? "" : json['matches'];
    overs = json['overs']==null ? "" : json['overs'];
    innings = json['innings']==null ? "" : json['innings'] ;
    average = json['average'];
    econRate = json['econ_rate'];
    medians = json['medians']==null ? "" : json['medians'];
    runs = json['runs']==null ? "" : json['runs'];
    wickets = json['wickets']==null ? "" : json['wickets'];
    wide = json['wide']==null ? "" : json['wide'];
    noball = json['noball']==null ? "" : json['noball'];
    strikeRate = json['strike_rate'];
    fourWickets = json['four_wickets']==null ? "" :json['four_wickets'] ;
    fiveWickets = json['five_wickets']==null ? "" : json['five_wickets'];
    tenWickets = json['ten_wickets']==null ? "" :json['ten_wickets'] ;
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matches'] = this.matches;
    data['overs'] = this.overs;
    data['innings'] = this.innings;
    data['average'] = this.average;
    data['econ_rate'] = this.econRate;
    data['medians'] = this.medians;
    data['runs'] = this.runs;
    data['wickets'] = this.wickets;
    data['wide'] = this.wide;
    data['noball'] = this.noball;
    data['strike_rate'] = this.strikeRate;
    data['four_wickets'] = this.fourWickets;
    data['five_wickets'] = this.fiveWickets;
    data['ten_wickets'] = this.tenWickets;
    data['rate'] = this.rate;
    return data;
  }
}

class Batting {
  dynamic matches;
  dynamic innings;
  dynamic runsScored;
  dynamic notOuts;
  dynamic highestInningScore;
  dynamic strikeRate;
  dynamic ballsFaced;
  dynamic average;
  dynamic fourX;
  dynamic sixX;
  dynamic fowScore;
  dynamic fowBalls;
  dynamic hundreds;
  dynamic fifties;

  Batting(
      {this.matches,
        this.innings,
        this.runsScored,
        this.notOuts,
        this.highestInningScore,
        this.strikeRate,
        this.ballsFaced,
        this.average,
        this.fourX,
        this.sixX,
        this.fowScore,
        this.fowBalls,
        this.hundreds,
        this.fifties});

  Batting.fromJson(Map<String, dynamic> json) {
    matches = json['matches']==null ? "" : json['matches'];
    innings = json['innings']==null ? "" : json['innings'];
    runsScored = json['runs_scored']==null ? "" : json['runs_scored'];
    notOuts = json['not_outs']==null ? "" :json['not_outs'] ;
    highestInningScore = json['highest_inning_score']==null ? "" : json['highest_inning_score'];
    strikeRate = json['strike_rate'];
    ballsFaced = json['balls_faced']==null ? "" :json['balls_faced'] ;
    average = json['average'];
    fourX = json['four_x']==null ? "" :  json['four_x'];
    sixX = json['six_x']==null ? "" :json['six_x'] ;
    fowScore = json['fow_score']==null ? "" :json['fow_score'] ;
    fowBalls = json['fow_balls'];
    hundreds = json['hundreds']==null ? "" : json['hundreds'];
    fifties = json['fifties']==null ? "" :json['fifties'] ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matches'] = this.matches;
    data['innings'] = this.innings;
    data['runs_scored'] = this.runsScored;
    data['not_outs'] = this.notOuts;
    data['highest_inning_score'] = this.highestInningScore;
    data['strike_rate'] = this.strikeRate;
    data['balls_faced'] = this.ballsFaced;
    data['average'] = this.average;
    data['four_x'] = this.fourX;
    data['six_x'] = this.sixX;
    data['fow_score'] = this.fowScore;
    data['fow_balls'] = this.fowBalls;
    data['hundreds'] = this.hundreds;
    data['fifties'] = this.fifties;
    return data;
  }
}
