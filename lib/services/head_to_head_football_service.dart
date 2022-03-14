import 'dart:convert';

import 'package:basketballinsider/constants/names.dart';
import 'package:basketballinsider/models/football_live.dart';
import 'package:basketballinsider/models/head_to_head_football.dart';
import 'package:http/http.dart' as http;

class HeadToHeadFootballService{
  static Future<HeadToHeadFootball?> getUsers(String id1,String id2) async{
    try{
      final String url = "https://soccer.sportmonks.com/api/v2.0/head2head/"+id1+"/"+id2+"?api_token="+tokenId;
      final Uri url1 = Uri.parse(url);
      final response = await http.get(url1);
      if(response.statusCode == 200){
        final HeadToHeadFootball users = HeadToHeadFootball.fromJson(json.decode(response.body));
        return users;
      }else{
      }
    }catch(e){
    }
  }
}