import 'package:basketballinsider/constants/names.dart';
import 'package:basketballinsider/models/football_live.dart';
import 'package:basketballinsider/models/leage_by_id_cricket.dart';
import 'package:basketballinsider/models/leage_by_id_football.dart';
import 'package:http/http.dart' as http;

class GetLeageByIdCricketServices{
  static Future<GetLeagueByIdCricket?> getUsers(String id) async{
    try{
      final String url = "https://cricket.sportmonks.com/api/v2.0/leagues/"+id+"?api_token="+tokenId;
      final Uri url1 = Uri.parse(url);
      final response = await http.get(url1);
      if(response.statusCode == 200){
        print(response.body);
        final GetLeagueByIdCricket users = getLeagueByIdFromJson(response.body);
        return users;
      }else{
      }
    }catch(e){
    }
  }
}