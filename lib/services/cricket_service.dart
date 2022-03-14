import 'dart:convert';

import 'package:basketballinsider/constants/names.dart';
import 'package:basketballinsider/models/cricket_live.dart';
import 'package:basketballinsider/models/football_live.dart';
import 'package:http/http.dart' as http;

class CricketLiveScoreServices{
  static Future<CricketLiveScore?> getUsers() async{
    try{
      final String url = "https://cricket.sportmonks.com/api/v2.0/livescores?api_token="+tokenId;
      final Uri url1 = Uri.parse(url);
      final response = await http.get(url1);
      if(response.statusCode == 200){
        // print(response.body);
        String m = (response.body).replaceAll("null", "1");
        print(m);
        CricketLiveScore users = cricketLiveScoreFromJson(json.decode(m));
        print(users);
        return users;
      }else{
      }
    }catch(e){
    }
  }
}