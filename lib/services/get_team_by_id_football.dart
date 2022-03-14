import 'dart:convert';

import 'package:basketballinsider/constants/names.dart';
import 'package:basketballinsider/models/football_live.dart';
import 'package:basketballinsider/models/leage_by_id_football.dart';
import 'package:basketballinsider/models/team_by_id_football.dart';
import 'package:http/http.dart' as http;

class GetTeamByIdFootvball{
  static Future<TeamByIdFootball?> getUsers(String id) async{
    try{
      final String url = "https://soccer.sportmonks.com/api/v2.0/teams/"+id+"?api_token="+tokenId;
      final Uri url1 = Uri.parse(url);
      final response = await http.get(url1);
      // print(response.statusCode);
      if(response.statusCode == 200){
        // print(response.body);
        final TeamByIdFootball users = TeamByIdFootball.fromJson(json.decode(response.body));
        // print(users.data!.id!);
        return users;
      }else{
      }
    }catch(e){
    }
  }
}