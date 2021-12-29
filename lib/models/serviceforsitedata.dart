import 'package:basketballinsider/models/sites.dart';
import 'package:http/http.dart' as http;
import 'comparison.dart';
import 'users.dart';

class SiteServices{
  static Future<List<Site>> getUsers() async{
    try{
      const String url = "http://34.232.217.223/api/site_data.php";
      final Uri url1 = Uri.parse(url);
      final response = await http.get(url1);
      if(response.statusCode == 200){
        //  final List<User> users= usersFromJson(response.body);

        final List<Site> sites= siteFromJson(response.body);
        return sites;
      }else{
        return <Site>[];
      }
    }
    catch(e){
      return <Site>[];
    }
  }
}

class ComparisonServices{
  static Future<List<Comparison>> getUsers() async{
    try{
      const String url = "http://34.232.217.223/api/site_bonus.php";
      final Uri url1 = Uri.parse(url);
      final response = await http.get(url1);
      if(response.statusCode == 200){
        //  final List<User> users= usersFromJson(response.body);

        final List<Comparison> comparisons= comparisonFromJson(response.body);
        return comparisons;
      }else{
        return <Comparison>[];
      }
    }
    catch(e){
      return <Comparison>[];
    }
  }
}

