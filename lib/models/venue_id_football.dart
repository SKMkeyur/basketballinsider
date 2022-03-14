// To parse this JSON data, do
//
//     final venueByIdFootball = venueByIdFootballFromJson(jsonString);

import 'dart:convert';

VenueByIdFootball venueByIdFootballFromJson(String str) => VenueByIdFootball.fromJson(json.decode(str));

String venueByIdFootballToJson(VenueByIdFootball data) => json.encode(data.toJson());

class VenueByIdFootball {
  VenueByIdFootball({
    required this.data,
    required this.meta,
  });

  Data data;
  Meta meta;

  factory VenueByIdFootball.fromJson(Map<String, dynamic> json) => VenueByIdFootball(
    data: Data.fromJson(json["data"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "meta": meta.toJson(),
  };
}

class Data {
  Data({
    required  this.id,
    required  this.name,
    required  this.surface,
    required  this.address,
    required  this.city,
    required  this.capacity,
    required  this.imagePath,
    required  this.coordinates,
  });

  int id;
  String name;
  String surface;
  String address;
  String city;
  int capacity;
  String imagePath;
  String coordinates;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    required this.plans,
    required this.sports,
  });

  List<Plan> plans;
  List<Sport> sports;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    plans: List<Plan>.from(json["plans"].map((x) => Plan.fromJson(x))),
    sports: List<Sport>.from(json["sports"].map((x) => Sport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "plans": List<dynamic>.from(plans.map((x) => x.toJson())),
    "sports": List<dynamic>.from(sports.map((x) => x.toJson())),
  };
}

class Plan {
  Plan({
    required this.name,
    required  this.features,
    required  this.requestLimit,
    required  this.sport,
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
