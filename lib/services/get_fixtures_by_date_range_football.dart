import 'dart:convert';
import 'package:basketballinsider/constants/names.dart';
import 'package:basketballinsider/models/fixture_by_id_football.dart';
import 'package:basketballinsider/models/fixtures_by_date_range_football.dart';
import 'package:basketballinsider/models/football.dart';
import 'package:basketballinsider/models/football_live.dart';
import 'package:basketballinsider/models/leage_by_id_football.dart';
import 'package:basketballinsider/models/round_by_id_football.dart';
import 'package:basketballinsider/models/team_by_id_football.dart';
import 'package:http/http.dart' as http;

class GetFixturesByDateRangeFootballService{
  static Future<Football?> getUsers(String id1,String id2) async{
    try{
       String Id1 = "2022-02-24";
       String Id2 = "2022-02-28";

       final String url = "https://soccer.sportmonks.com/api/v2.0/fixtures/between/"+id1+"/"+id2+"?include=stats&api_token="+tokenId+"&include=localTeam,visitorTeam,league,venue";
      final Uri url1 = Uri.parse(url);
      final response = await http.get(url1);
      // print(response.statusCode);
      if(response.statusCode == 200){

        // print(response.body);
    //    print("---------------");
        //  print(data1);
        //   FixturesByIdFootball users = FixturesByIdFootball.fromJson(json.decode(response.body));
        Football users = footballFromJson((response.body));

        return users;
      }else{
      }
    }catch(e){
    }
  }
}