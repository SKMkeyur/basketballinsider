import 'dart:convert';
import 'package:basketballinsider/constants/names.dart';
import 'package:basketballinsider/models/fixture_by_id_football.dart';
import 'package:basketballinsider/models/football_live.dart';
import 'package:basketballinsider/models/leage_by_id_football.dart';
import 'package:basketballinsider/models/round_by_id_football.dart';
import 'package:basketballinsider/models/team_by_id_football.dart';
import 'package:http/http.dart' as http;

class GetFixtureByIdFootballService{
  static Future<FixturesByIdFootball?> getUsers(String id) async{
    try{
     // String id1 = "16475287";
      final String url = "https://soccer.sportmonks.com/api/v2.0/fixtures/"+id+"?include=stats&api_token="+tokenId;
      final Uri url1 = Uri.parse(url);
      final response = await http.get(url1);
      // print(response.statusCode);
      if(response.statusCode == 200){

         print(response.body);
        print("---------------");
      //  print(data1);
     //   FixturesByIdFootball users = FixturesByIdFootball.fromJson(json.decode(response.body));
        FixturesByIdFootball users = fixturesByIdFootballFromJson((response.body));

        return users;
      }else{
      }
    }catch(e){
    }
  }
}