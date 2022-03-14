import 'dart:convert';
import 'package:basketballinsider/constants/names.dart';
import 'package:basketballinsider/models/fixture_by_id_football.dart';
import 'package:basketballinsider/models/fixtures_by_date_range_cricket.dart';
import 'package:basketballinsider/models/fixtures_by_date_range_football.dart';
import 'package:basketballinsider/models/football_live.dart';
import 'package:basketballinsider/models/leage_by_id_football.dart';
import 'package:basketballinsider/models/round_by_id_football.dart';
import 'package:basketballinsider/models/squad_by_team_id_season_id_cricket.dart';
import 'package:basketballinsider/models/team_by_id_football.dart';
import 'package:http/http.dart' as http;

class GetSquadByTeamIdSeasonIdCricket{
  static Future<SquadByTeamidSeasonIdCricket?> getUsers(String id1,String id2) async{
    try{
      String Id1 = "2022-02-23";
      String Id2 = "2022-02-28";


      final String url = "https://cricket.sportmonks.com/api/v2.0/teams/"+id1+"/squad/"+id2+"?api_token="+tokenId;;
      final Uri url1 = Uri.parse(url);
      final response = await http.get(url1);
      // print(response.statusCode);
      if(response.statusCode == 200){

       // print(response.body);
        print("---------------");
        //  print(data1);
        //   FixturesByIdFootball users = FixturesByIdFootball.fromJson(json.decode(response.body));
        SquadByTeamidSeasonIdCricket users = squadByTeamidSeasonIdCricketFromJson((response.body));

        return users;
      }else{
      }
    }catch(e){
    }
  }
}