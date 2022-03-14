import 'package:basketballinsider/constants/names.dart';
import 'package:basketballinsider/models/football_live.dart';
import 'package:http/http.dart' as http;

class FootballLiveScoreServices{
  static Future<FootballLiveScore?> getUsers() async{
    try{
      final String url = "https://soccer.sportmonks.com/api/v2.0/livescores?api_token="+tokenId;
      final Uri url1 = Uri.parse(url);
      final response = await http.get(url1);
      if(response.statusCode == 200){
        final FootballLiveScore users = footballLiveScoreFromJson(response.body);
        return users;
      }else{
      }
    }catch(e){
    }
  }
}