import 'dart:convert';

import 'package:basketballinsider/constants/names.dart';
import 'package:basketballinsider/models/football_live.dart';
import 'package:basketballinsider/models/leage_by_id_football.dart';
import 'package:basketballinsider/models/round_by_id_football.dart';
import 'package:basketballinsider/models/team_by_id_football.dart';
import 'package:http/http.dart' as http;

class GetRoundByIdFootballService{
  static Future<RoundByIdFootball?> getUsers(String id) async{
    try{
      final String url = "https://soccer.sportmonks.com/api/v2.0/rounds/"+id+"?api_token="+tokenId;
      final Uri url1 = Uri.parse(url);
      final response = await http.get(url1);
      // print(response.statusCode);
      if(response.statusCode == 200){
        // print(response.body);
        final RoundByIdFootball users = roundByIdFootballFromJson((response.body));
        // print(users.data!.id!);
        return users;
      }else{
      }
    }catch(e){
    }
  }
}