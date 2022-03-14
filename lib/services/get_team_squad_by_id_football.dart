import 'dart:convert';

import 'package:basketballinsider/constants/names.dart';
import 'package:basketballinsider/models/football_live.dart';
import 'package:basketballinsider/models/leage_by_id_football.dart';
import 'package:basketballinsider/models/team_by_id_football.dart';
import 'package:basketballinsider/models/team_with_squad_by_id_football.dart';
import 'package:http/http.dart' as http;

class GetTeamSquadByIdFootvball{
  static Future<TeamWithSquadByIdFootball?> getUsers(String id) async{
    try{
      final String url = "https://soccer.sportmonks.com/api/v2.0/teams/"+id+"?api_token="+tokenId+"&include=squad.player";
      final Uri url1 = Uri.parse(url);
      final response = await http.get(url1);
      // print(response.statusCode);
      if(response.statusCode == 200){
        // print(response.body);
        final TeamWithSquadByIdFootball users = teamWithSquadByIdFootballFromJson(response.body);
        // print(users.data!.id!);
        return users;
      }else{
      }
    }catch(e){
    }
  }
}