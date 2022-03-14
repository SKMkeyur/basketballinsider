// // To parse this JSON data, do
// //
// //     final cricket = cricketFromJson(jsonString);
//
// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:json_annotation/json_annotation.dart';
// part 'cricket3.g.dart';
//
// @JsonSerializable(explicitToJson: true)
// class Cricket3 {
//   Cricket3({
//     this.data,
//   });
//
//   Data? data;
//
//
// }
// @JsonSerializable()
// class Data {
//   Data({
//     this.resource,
//     this.id,
//     this.leagueId,
//     this.seasonId,
//     this.stageId,
//     this.round,
//     this.localteamId,
//     this.visitorteamId,
//     this.startingAt,
//     this.type,
//     this.live,
//     this.status,
//     this.lastPeriod,
//     this.note,
//     this.venueId,
//     this.tossWonTeamId,
//     this.winnerTeamId,
//     this.drawNoresult,
//     this.firstUmpireId,
//     this.secondUmpireId,
//     this.tvUmpireId,
//     this.refereeId,
//     this.manOfMatchId,
//     this.manOfSeriesId,
//     this.totalOversPlayed,
//     this.elected,
//     this.superOver,
//     this.followOn,
//     this.localteamDlData,
//     this.visitorteamDlData,
//     this.rpcOvers,
//     this.rpcTarget,
//     // this.weatherReport,
//     this.localteam,
//     this.visitorteam,
//     this.batting,
//     this.bowling,
//     this.runs,
//     this.scoreboards,
//     this.balls,
//     this.tosswon,
//   });
//
//   String? resource;
//   int? id;
//   int? leagueId;
//   int? seasonId;
//   int? stageId;
//   String? round;
//   int? localteamId;
//   int? visitorteamId;
//   DateTime? startingAt;
//   String? type;
//   bool? live;
//   String? status;
//   dynamic lastPeriod;
//   String? note;
//   int? venueId;
//   int? tossWonTeamId;
//   int? winnerTeamId;
//   dynamic drawNoresult;
//   int? firstUmpireId;
//   int? secondUmpireId;
//   int? tvUmpireId;
//   int? refereeId;
//   int? manOfMatchId;
//   dynamic manOfSeriesId;
//   dynamic totalOversPlayed;
//   String? elected;
//   bool? superOver;
//   bool? followOn;
//   TeamDlData? localteamDlData;
//   TeamDlData? visitorteamDlData;
//   dynamic rpcOvers;
//   dynamic rpcTarget;
//   // List<dynamic> weatherReport;
//   Localteam? localteam;
//   Localteam? visitorteam;
//   List<Batting>? batting;
//   List<Bowling>? bowling;
//   List<Run>? runs;
//   List<ScoreboardElement>? scoreboards;
//   List<Ball>? balls;
//   Localteam? tosswon;
//
//
//   factory Data.fromJson(Map<String,dynamic> json) => $DataFromJson(json);
//   Map<String,dynamic> json() => $DataToJson(this);
//
// }
//
//
// @JsonSerializable()
// class Ball {
//   Ball({
//     this.resource,
//     this.id,
//     this.fixtureId,
//     this.teamId,
//     this.ball,
//     this.scoreboard,
//     this.batsmanOneOnCreezeId,
//     this.batsmanTwoOnCreezeId,
//     this.batsmanId,
//     this.bowlerId,
//     this.batsmanoutId,
//     this.catchstumpId,
//     this.runoutById,
//     this.scoreId,
//     this.batsman,
//     this.bowler,
//     this.score,
//     this.team,
//     this.updatedAt,
//   });
//
//   String? resource;
//   int? id;
//   int? fixtureId;
//   int? teamId;
//   double? ball;
//   String? scoreboard;
//   int? batsmanOneOnCreezeId;
//   int? batsmanTwoOnCreezeId;
//   int? batsmanId;
//   int? bowlerId;
//   dynamic? batsmanoutId;
//   dynamic? catchstumpId;
//   dynamic runoutById;
//   int? scoreId;
//   Batsman? batsman;
//   Batsman? bowler;
//   Score? score;
//   Localteam? team;
//   DateTime? updatedAt;
//
//   factory Ball.fromJson(Map<String,dynamic> json) => $BallFromJson(json);
//   Map<String,dynamic> json() => $BallToJson(this);
//
// }
//
// @JsonSerializable()
// class Batsman {
//   Batsman({
//     this.resource,
//     this.id,
//     this.countryId,
//     this.firstname,
//     this.lastname,
//     this.fullname,
//     this.imagePath,
//     this.dateofbirth,
//     this.gender,
//     this.battingstyle,
//     this.bowlingstyle,
//     this.position,
//     this.updatedAt,
//   });
//
//   String? resource;
//   int? id;
//   int? countryId;
//   String? firstname;
//   String? lastname;
//   String? fullname;
//   String? imagePath;
//   DateTime? dateofbirth;
//   String? gender;
//   String? battingstyle;
//   String? bowlingstyle;
//   Position? position;
//   DateTime? updatedAt;
//
//   factory Batsman.fromJson(Map<String,dynamic> json) => $BatsmanFromJson(json);
//   Map<String,dynamic> json() => $BatsmanToJson(this);
// }
//
// @JsonSerializable()
// class Position {
//   Position({
//     this.resource,
//     this.id,
//     this.name,
//   });
//
//   String? resource;
//   int? id;
//   String? name;
//   factory Position.fromJson(Map<String,dynamic> json) => $PositionFromJson(json);
//   Map<String,dynamic> json() => $PositionToJson(this);
// }
//
// @JsonSerializable()
// class Score {
//   Score({
//     this.resource,
//     this.id,
//     this.name,
//     this.runs,
//     this.four,
//     this.six,
//     this.bye,
//     this.legBye,
//     this.noball,
//     this.noballRuns,
//     this.isWicket,
//     this.ball,
//     this.out,
//   });
//
//   String? resource;
//   int? id;
//   String? name;
//   int? runs;
//   bool? four;
//   bool? six;
//   int? bye;
//   int? legBye;
//   int? noball;
//   int? noballRuns;
//   bool? isWicket;
//   bool? ball;
//   bool? out;
//   factory Score.fromJson(Map<String,dynamic> json) => $ScoreFromJson(json);
//   Map<String,dynamic> json() => $ScoreToJson(this);
// }
//
// @JsonSerializable()
// class Localteam {
//   Localteam({
//     this.resource,
//     this.id,
//     this.name,
//     this.code,
//     this.imagePath,
//     this.countryId,
//     this.nationalTeam,
//     this.updatedAt,
//   });
//
//   String? resource;
//   int? id;
//   String? name;
//   String? code;
//   String? imagePath;
//   int? countryId;
//   bool? nationalTeam;
//   DateTime? updatedAt;
//
//   factory Localteam.fromJson(Map<String,dynamic> json) => $LocalteamFromJson(json);
//   Map<String,dynamic> json() => $LocalteamToJson(this);
// }
//
// @JsonSerializable()
// class Batting {
//   Batting({
//     this.resource,
//     this.id,
//     this.sort,
//     this.fixtureId,
//     this.teamId,
//     this.active,
//     this.scoreboard,
//     this.playerId,
//     this.ball,
//     this.scoreId,
//     this.score,
//     this.fourX,
//     this.sixX,
//     this.catchStumpPlayerId,
//     this.runoutById,
//     this.batsmanoutId,
//     this.bowlingPlayerId,
//     this.fowScore,
//     this.fowBalls,
//     this.rate,
//     this.updatedAt,
//   });
//
//   String? resource;
//   int? id;
//   int? sort;
//   int? fixtureId;
//   int? teamId;
//   bool? active;
//   String? scoreboard;
//   int? playerId;
//   int? ball;
//   int? scoreId;
//   int? score;
//   int? fourX;
//   int? sixX;
//   int? catchStumpPlayerId;
//   dynamic runoutById;
//   dynamic batsmanoutId;
//   int? bowlingPlayerId;
//   int? fowScore;
//   double? fowBalls;
//   int? rate;
//   DateTime? updatedAt;
//
//   factory Batting.fromJson(Map<String,dynamic> json) => $BattingFromJson(json);
//   Map<String,dynamic> json() => $BattingToJson(this);
// }
//
// @JsonSerializable()
// class Bowling {
//   Bowling({
//     this.resource,
//     this.id,
//     this.sort,
//     this.fixtureId,
//     this.teamId,
//     this.active,
//     this.scoreboard,
//     this.playerId,
//     this.overs,
//     this.medians,
//     this.runs,
//     this.wickets,
//     this.wide,
//     this.noball,
//     this.rate,
//     this.updatedAt,
//   });
//
//   String? resource;
//   int? id;
//   int? sort;
//   int? fixtureId;
//   int? teamId;
//   bool? active;
//   String? scoreboard;
//   int? playerId;
//   int? overs;
//   int? medians;
//   int? runs;
//   int? wickets;
//   int? wide;
//   int? noball;
//   double? rate;
//   DateTime? updatedAt;
//
//   factory Bowling.fromJson(Map<String,dynamic> json) => $BowlingFromJson(json);
//   Map<String,dynamic> json() => $BowlingToJson(this);
// }
//
// @JsonSerializable()
// class TeamDlData {
//   TeamDlData({
//     this.score,
//     this.overs,
//     this.wicketsOut,
//   });
//
//   dynamic score;
//   dynamic overs;
//   dynamic wicketsOut;
//
//   factory TeamDlData.fromJson(Map<String,dynamic> json) => $TeamDlDataFromJson(json);
//   Map<String,dynamic> json() => $TeamDlDataToJson(this);
// }
//
// @JsonSerializable()
// class Run {
//   Run({
//     this.resource,
//     this.id,
//     this.fixtureId,
//     this.teamId,
//     this.inning,
//     this.score,
//     this.wickets,
//     this.overs,
//     this.pp1,
//     this.pp2,
//     this.pp3,
//     this.updatedAt,
//   });
//
//   String? resource;
//   int? id;
//   int? fixtureId;
//   int? teamId;
//   int? inning;
//   int? score;
//   int? wickets;
//   int? overs;
//   String? pp1;
//   dynamic pp2;
//   dynamic pp3;
//   DateTime? updatedAt;
//
//   factory Run.fromJson(Map<String,dynamic> json) => $RunFromJson(json);
//   Map<String,dynamic> json() => $RunToJson(this);
// }
//
// @JsonSerializable()
// class ScoreboardElement {
//   ScoreboardElement({
//     this.resource,
//     this.id,
//     this.fixtureId,
//     this.teamId,
//     this.type,
//     this.scoreboard,
//     this.wide,
//     this.noballRuns,
//     this.noballBalls,
//     this.bye,
//     this.legBye,
//     this.penalty,
//     this.total,
//     this.overs,
//     this.wickets,
//     this.updatedAt,
//   });
//
//   String? resource;
//   int? id;
//   int? fixtureId;
//   int? teamId;
//   String? type;
//   String? scoreboard;
//   int? wide;
//   int? noballRuns;
//   int? noballBalls;
//   int? bye;
//   int? legBye;
//   int? penalty;
//   int? total;
//   int? overs;
//   int? wickets;
//   DateTime? updatedAt;
//   factory ScoreboardElement.fromJson(Map<String,dynamic> json) => $ScoreboardElementFromJson(json);
//   Map<String,dynamic> json() => $ScoreboardElementToJson(this);
// }
