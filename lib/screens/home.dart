import 'dart:async';
import 'dart:io';
import 'package:basketballinsider/database/database_helper.dart';
import 'package:basketballinsider/models/bookmark_data.dart';
import 'package:basketballinsider/models/cricket.dart';
import 'package:basketballinsider/models/cricket_live.dart';
import 'package:basketballinsider/models/fixtures_by_date_range_cricket.dart' as v2;
import 'package:basketballinsider/models/fixtures_by_date_range_football.dart' as v1;
import 'package:basketballinsider/models/football.dart';
import 'package:basketballinsider/models/football_live.dart';
import 'package:basketballinsider/models/leage_by_id_cricket.dart';
import 'package:basketballinsider/models/leage_by_id_football.dart';
import 'package:basketballinsider/models/round_by_id_football.dart';
import 'package:basketballinsider/models/serviceforsitedata.dart';
import 'package:basketballinsider/models/sites.dart';
import 'package:basketballinsider/models/team_by_id_cricket.dart';
import 'package:basketballinsider/models/team_by_id_football.dart';
import 'package:basketballinsider/models/venue_id_football.dart';
import 'package:basketballinsider/screens/cricket_live_score.dart';
import 'package:basketballinsider/screens/fixture_match_data_cricket_finished.dart';
import 'package:basketballinsider/screens/review.dart';
import 'package:basketballinsider/screens/review01.dart';
import 'package:basketballinsider/screens/splashscreen.dart';
import 'package:basketballinsider/services/cricket_service.dart';
import 'package:basketballinsider/services/football_service.dart';
import 'package:basketballinsider/services/get_fixtures_by_date_range_cricket.dart';
import 'package:basketballinsider/services/get_fixtures_by_date_range_football.dart';
import 'package:basketballinsider/services/get_leage_by_id_cricket.dart';
import 'package:basketballinsider/services/get_leage_by_id_football.dart';
import 'package:basketballinsider/services/get_team_by_id_cricket.dart';
import 'package:basketballinsider/services/get_team_by_id_football.dart';
import 'package:basketballinsider/services/get_venue_by_id_football.dart';
import 'package:basketballinsider/widgets/starratting02.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'aboutus.dart';
import 'betdescription.dart';
import 'comparison.dart';
import 'cricket_main.dart';
import 'cricket_main_canceled.dart';
import 'cricket_main_finished.dart';
import 'cricket_main_live.dart';
import 'faqs.dart';
import 'feedback.dart';
import 'fixture_match_data_football_live.dart';
import 'fixture_match_data_football_upcoming.dart';
import 'fixture_match_data_cricket_upcoming.dart';
import 'football/football_main.dart';
import 'football/football_main_upcoimg.dart';
import 'football_live_score.dart';
import 'home01.dart';
import 'livestreaminginformation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class BookMark{
  late String id;
  late String title;
  late String url;
  late String promocode;
  late String ratings;
  late String feature1;
  late String feature2;
  late String feature3;
  late String feature4;
  late String logo;
  late DateTime addedDate;
  late  String feature5;
  late String feature6;
  late String cons1;
  late String cons2;
  late String cons3;
  late String cons4;
  late String cons5;
  late String cons6;
  late String shortDescription;
  late String longDescription;
  late String bonus;
  late String bgImage;

  BookMark(
      this.id,
      this.title,
      this.url,
      this.promocode,
      this.ratings,
      this.feature1,
      this.feature2,
      this.feature3,
      this.feature4,
      this.logo,
      this.addedDate,
      this.feature5,
      this.feature6,
      this.cons1,
      this.cons2,
      this.cons3,
      this.cons4,
      this.cons5,
      this.cons6,
      this.shortDescription,
      this.longDescription,
      this.bonus,
      this.bgImage);
}



class FT {
  late String id;
  late String localTeamLogo;
  late String localTeamName;
  late String visitorTeamLogo;
  late String visitorTeamName;
  late String leage;
  late String date;
  late String time;
  late String timzone;
  late String status;
  late String ft;
  late String round;
  late String vName;
  late String vCity;
  late String vCapacity;
  late String vImagepath;
  late String localTeamId;
  late String visitorTeamId;



  FT(this.id, this.localTeamLogo, this.localTeamName, this.visitorTeamLogo,
      this.visitorTeamName, this.leage, this.date, this.time, this.timzone,
      this.status,this.ft,this.round,
      this.vName,
      this.vCity,
      this.vCapacity,
      this.vImagepath,
      this.localTeamId,
      this.visitorTeamId
      );

}



class User {
  final String? name;
  final String? avatar;
  User({this.name, this.avatar});
}
List<User> userList = [
  User(name: "Cricket", avatar: ""),
  User(name: "Football ", avatar: ""),
];

class _HomeScreenState extends State<HomeScreen> {




  //-----------cricket -------

  // late Map<int,String> localteamc= {};
  // late Map<int,String> visitorteamc= {};
  // late Map<int,String> leaguec= {};
  // late Map<int,String> localteamlogoc= {};
  // late Map<int,String> visitorteamlogoc= {};
  //
  // bool isLoading0c = false;
  // bool isLoading1c = true;
  // bool isLoading2c = true;
  // bool isLoading3c = true;
  // bool isLoading4c = true;
  // bool isLoading5c = true;
  // bool isLoading6c = true;
  // bool isLoading7c = true;
  //
  // Map<int,String> monthsInYear1 = {
  //   1: "Jan",
  //   2: "Feb",
  //   3: "Mar",
  //   4: "Apr",
  //   5: "May",
  //   6: "June",
  //   7: "July",
  //   8: "Aug",
  //   9: "Sep",
  //   10: "Oct",
  //   11: "Nov",
  //   12: "Dec",
  // };
  //
  // late Cricket fixturesByDateRangeCricket;
  // late GetLeagueByIdCricket leageCricket;
  // late GetTeamByIdCricket teamByIdCricket;
  // late GetTeamByIdCricket oppositeteamByIdCricket;
  // late VenueByIdFootball venueByIdCricket;
  // late RoundByIdFootball roundByIdCricket;
  // getFixtureByDateRangeCricket() async{
  //   setState(() {
  //     isLoading0c = true;
  //     isLoading6c = true;
  //     isLoading7c = true;
  //     isLoading1c = true;
  //   });
  //   // print(widget.id.toString());
  //
  //
  //
  //   GetFixturesByDateRangeCricketService.getUsers("","").then((sites){
  //     print(sites);
  //
  //     if(sites!=null) {
  //       setState(() {
  //         print("dd");
  //         fixturesByDateRangeCricket = sites;
  //         print("scores ==  "+fixturesByDateRangeCricket.data!.length.toString());
  //         isLoading0c = false;
  //
  //         for(int i=0;i<fixturesByDateRangeCricket.data!.length;i++){
  //           String Id = fixturesByDateRangeCricket.data![i].localteamId.toString();
  //           String Id1 = fixturesByDateRangeCricket.data![i].visitorteamId.toString();
  //           String Id2= fixturesByDateRangeCricket.data![i].leagueId.toString();
  //           print(Id);
  //           GetTeamByIdCricketService.getUsers(Id).then((sites){
  //             if(sites!=null){
  //               setState(() {
  //                 teamByIdCricket = sites;
  //                 if(teamByIdCricket.data!=null) {
  //                   localteamc[i] = teamByIdCricket.data!.name.toString();
  //                   localteamlogoc[i] =
  //                       teamByIdCricket.data!.imagePath.toString();
  //                   print(teamByIdCricket.data!.id.toString());
  //                   print(localteamc);
  //                   print(localteamc.length);
  //                   if (fixturesByDateRangeCricket.data!.length >=
  //                       localteamc.length) {
  //                     isLoading6c = false;
  //                     print(isLoading6c);
  //
  //                   }
  //                 }
  //               });
  //
  //             }
  //
  //           });
  //
  //           GetTeamByIdCricketService.getUsers(Id1).then((sites){
  //             // setState(() {
  //             // print(sites);
  //             if(sites!=null){
  //               teamByIdCricket = sites;
  //               if(teamByIdCricket.data!=null){
  //                 visitorteamc[i]=teamByIdCricket.data!.name.toString();
  //                 visitorteamlogoc[i]=teamByIdCricket.data!.imagePath.toString();
  //                 print(teamByIdCricket.data!.id.toString());
  //                 print(visitorteamc);
  //               }
  //               if(fixturesByDateRangeCricket.data!.length==visitorteamc.length){
  //                 isLoading7c = false;
  //               }
  //             }
  //             // });
  //           });
  //
  //           GetLeageByIdCricketServices.getUsers(Id2).then((sites){
  //             print(sites);
  //             setState(() {
  //               if(sites!=null){
  //                 leageCricket = sites;
  //                 print(sites);
  //                 leaguec[i]=leageCricket.data!.name.toString();
  //                 // leaguesname.add(leage.data.name);
  //                 if(fixturesByDateRangeCricket.data!.length==leaguec.length){
  //                   isLoading1c = false;
  //                 }
  //               }
  //             });
  //           });
  //
  //
  //         }
  //
  //       });
  //     }
  //   });
  // }

  //-------------cricket---------------------------











  // late Map<int,String> localteam= {};
  // late Map<int,String> visitorteam= {};
  // late Map<int,String> league= {};
  // late Map<int,String> localteamlogo= {};
  // late Map<int,String> visitorteamlogo= {};

  TextEditingController controller = TextEditingController();
  late bool isSearching = false;
  double rating = 3.5;

  List<Site> dogsBreedList = <Site>[];
  List<Site> tempList = <Site>[];
  bool isLoading = false;
  bool isloading = false;
  late List<Value> dogbreedList;
  List<bool> bookmarkList = List.filled(7, false);

  late List<Value> bookmarks=[];
  late bool isLoadingbook = true;
  ScrollController _scrollController1 = ScrollController();


  // bool isLoading0 = false;
  // bool isLoading1 = true;
  // bool isLoading2 = true;
  // bool isLoading3 = true;
  // bool isLoading4 = true;
  // bool isLoading5 = true;
  // bool isLoading6 = true;
  // bool isLoading7 = true;




  // int win1 = 0;
  // int draw = 0;
  // int win2 = 0;
  // int footballlength = 0;
  //
  // String id1="";
  // String id2="";
  //
  // late FootballLiveScore footballLiveScore;
  // late FootballLiveScore footballLiveScore1;
  // late Football fixturesByDateRangeFootball;
  //
  // late Leage leage;
  // late TeamByIdFootball teamByIdFootball;
  // late TeamByIdFootball teamByIdFootball1;
  //
  // late TeamByIdFootball oppositeteamByIdFootball1;
  // late VenueByIdFootball venueByIdFootball;
  // List<String> teamlogo = <String>[];
  // List<String> oppositeteamlogo = <String>[];
  // List<String> teamname = <String>[];
  // List<String> oppositeteamname = <String>[];
  // List<String> leaguesname = <String>[];



  // late CricketLiveScore cricketLiveScore;






  // Map<int,String> monthsInYear = {
  //   1: "Jan",
  //   2: "Feb",
  //   3: "Mar",
  //   4: "Apr",
  //    5: "May",
  //    6: "June",
  //    7: "July",
  //    8: "Aug",
  //    9: "Sep",
  //    10: "Oct",
  //    11: "Nov",
  //    12: "Dec",
  //  };
  //
  //
  // getCricketLive(){
  //   setState(() {
  //     isLoading0c=true;
  //   });
  //
  //   print("cricket");
  //   CricketLiveScoreServices.getUsers().then((sites){
  //     print(sites);
  //     setState(() {
  //       if(sites!=null){
  //         cricketLiveScore = sites;
  //         print("cricket  "+cricketLiveScore.data.length.toString());
  //       }
  //
  //     });
  //   });
  //
  //
  // }
  //
  // getFixtureByDateRange() async{
  //   setState(() {
  //     isLoading0 = true;
  //     isLoading6 = true;
  //     isLoading7 = true;
  //     isLoading1 = true;
  //   });
  //   // print(widget.id.toString());
  //
  //   GetFixturesByDateRangeFootballService.getUsers("","").then((sites){
  //     print(sites);
  //
  //     if(sites!=null) {
  //       setState(() {
  //         print("dd");
  //         fixturesByDateRangeFootball = sites;
  //         print("scores ==  "+fixturesByDateRangeFootball.data!.length.toString());
  //         isLoading0 = false;
  //
  //         for(int i=0;i<fixturesByDateRangeFootball.data!.length;i++){
  //           String Id = fixturesByDateRangeFootball.data![i].localteamId.toString();
  //           String Id1 = fixturesByDateRangeFootball.data![i].visitorteamId.toString();
  //           String Id2= fixturesByDateRangeFootball.data![i].leagueId.toString();
  //           print(Id);
  //           GetTeamByIdFootvball.getUsers(Id).then((sites){
  //             if(sites!=null){
  //               setState(() {
  //
  //                 teamByIdFootball = sites;
  //                 if(teamByIdFootball.data!=null) {
  //                   localteam[i] = teamByIdFootball.data!.name.toString();
  //                   localteamlogo[i] =
  //                       teamByIdFootball.data!.logoPath.toString();
  //                   print(teamByIdFootball.data!.id.toString());
  //                   print(localteam);
  //                   print(localteam.length);
  //                   if (fixturesByDateRangeFootball.data!.length >=
  //                       localteam.length) {
  //                     isLoading6 = false;
  //                     print(isLoading6);
  //
  //                   }
  //                 }
  //               });
  //
  //             }
  //
  //           });
  //
  //           GetTeamByIdFootvball.getUsers(Id1).then((sites){
  //             // setState(() {
  //             // print(sites);
  //             if(sites!=null){
  //               teamByIdFootball = sites;
  //               if(teamByIdFootball.data!=null){
  //                 visitorteam[i]=teamByIdFootball.data!.name.toString();
  //                 visitorteamlogo[i]=teamByIdFootball.data!.logoPath.toString();
  //                 print(teamByIdFootball.data!.id.toString());
  //                 print(visitorteam);
  //               }
  //               if(fixturesByDateRangeFootball.data!.length==visitorteam.length){
  //                 isLoading7 = false;
  //               }
  //             }
  //             // });
  //           });
  //
  //           GetLeageByIdServices.getUsers(Id2).then((sites){
  //             setState(() {
  //               if(sites!=null){
  //                 leage = sites;
  //                 league[i]=leage.data.name.toString();
  //                 // leaguesname.add(leage.data.name);
  //                 if(fixturesByDateRangeFootball.data!.length==league.length){
  //                   isLoading1 = false;
  //                 }
  //               }
  //             });
  //           });
  //
  //
  //
  //         }
  //
  //
  //
  //       });
  //     }
  //   });
  // }
  //

  // getData() async{
  //   setState(() {
  //     isLoading0 = true;
  //   });
  //   FootballLiveScore? temp;
  //   FootballLiveScoreServices.getUsers().then((sites){
  //     temp = sites;
  //     // getLeagebyId(temp!.data[0].leagueId.toString());
  //     // getTeambyId(footballLiveScore.data[i].localteamId.toString());
  //     //
  //     // getOppositeTeambyId(temp!.data[0].visitorteamId.toString());
  //     // getVenueById(temp!.data[0].venueId.toString());
  //     // getHeadtoHeadData(temp!.data[0].localteamId.toString(), temp!.data[0].visitorteamId.toString());
  //     // print(temp!.data[0].localteamId.toString());
  //     setState(() {
  //       footballLiveScore = sites!;
  //       isLoading0 = false;
  //       // for(int i=0;i<4;i++){
  //       //   getTeambyId(footballLiveScore.data[i].localteamId.toString());
  //       // }
  //     });
  //   });
  // }

  // getTeamLogo() async {
  //   setState(() {
  //     isLoading6 = true;
  //     isLoading7 = true;
  //     isLoading0 = true;
  //   });
  //   FootballLiveScore? temp;
  //   FootballLiveScoreServices.getUsers().then((sites){
  //     temp = sites;
  //     setState(() {
  //       footballLiveScore1 = sites!;
  //       isLoading0=false;
  //       for(int i=0;i<footballLiveScore1.data.length;i++){
  //         String Id = footballLiveScore1.data[i].localteamId.toString();
  //         String Id1 = footballLiveScore1.data[i].visitorteamId.toString();
  //         String Id2= footballLiveScore1.data[i].leagueId.toString();
  //         // print(Id);
  //         GetTeamByIdFootvball.getUsers(Id).then((sites){
  //           setState(() {
  //             if(sites!=null){
  //               teamByIdFootball = sites;
  //               // print(teamByIdFootball);
  //               //    print(teamByIdFootball.data!.logoPath!);
  //               teamlogo.add(teamByIdFootball.data!.logoPath!);
  //              // teamlogo1.add(TeamLogo(int.parse(Id),teamByIdFootball.data!.logoPath.toString()));
  //               // teamlogo1.addAll({int.parse(Id): teamByIdFootball.data!.logoPath.toString()});
  //               teamname.add(teamByIdFootball.data!.name!);
  //               if(footballLiveScore1.data.length==teamlogo.length && footballLiveScore1.data.length==teamname.length){
  //                 isLoading6 = false;
  //               }
  //             }
  //           });
  //         });
  //
  //       }
  //     });
  //   });
  // }
  //
  // getOppositeTeamLogo() async {
  //   setState(() {
  //     isLoading7 = true;
  //   });
  //   FootballLiveScore? temp;
  //   FootballLiveScoreServices.getUsers().then((sites){
  //     temp = sites;
  //     setState(() {
  //       footballLiveScore1 = sites!;
  //       for(int i=0;i<footballLiveScore1.data.length;i++){
  //         print(footballLiveScore1.data[i].visitorteamId);
  //         String Id1 = footballLiveScore1.data[i].visitorteamId.toString();
  //
  //         GetTeamByIdFootvball.getUsers(Id1).then((sites){
  //           setState(() {
  //             if(sites!=null){
  //               teamByIdFootball1 = sites;
  //               // print(i);
  //               // print(teamByIdFootball1.data!.logoPath!);
  //               oppositeteamlogo.add(teamByIdFootball1.data!.logoPath!);
  //               oppositeteamname.add(teamByIdFootball1.data!.name!);
  //               if(footballLiveScore1.data.length==oppositeteamlogo.length && footballLiveScore1.data.length==oppositeteamname.length){
  //                 isLoading7 = false;
  //               }
  //             }
  //           });
  //         });
  //       }
  //     });
  //   });
  // }
  //
  // getleage() async {
  //   setState(() {
  //     isLoading1 = true;
  //   });
  //   FootballLiveScore? temp;
  //   FootballLiveScoreServices.getUsers().then((sites){
  //     temp = sites;
  //     setState(() {
  //       footballLiveScore1 = sites!;
  //       for(int i=0;i<footballLiveScore1.data.length;i++){
  //         String Id1 = footballLiveScore1.data[i].leagueId.toString();
  //
  //         GetLeageByIdServices.getUsers(Id1).then((sites){
  //           setState(() {
  //             if(sites!=null){
  //               leage = sites;
  //               leaguesname.add(leage.data.name);
  //               if(footballLiveScore1.data.length==leaguesname.length){
  //                 isLoading1 = false;
  //               }
  //             }
  //           });
  //         });
  //       }
  //     });
  //   });
  // }
  //
  //
  // getLeagebyId(String Id) async{
  //   setState(() {
  //     isLoading1 = true;
  //   });
  //   GetLeageByIdServices.getUsers(Id).then((sites){
  //     setState(() {
  //       leage = sites!;
  //       isLoading1 = false;
  //     });
  //   });
  // }

  //  getTeambyId(String Id) async{
  //   print("hello");
  //    setState(() {
  //      isLoading2 = true;
  //    });
  //   String path = "";
  //   GetTeamByIdFootvball.getUsers(Id).then((sites){
  //     setState(() {
  //       if(sites!=null){
  //         teamByIdFootball = sites;
  //         path =  teamByIdFootball.data.logoPath.toString();
  //         teamlogo.add(teamByIdFootball.data.logoPath.toString());
  //         print(teamlogo);
  //         if(teamlogo.length==footballlength){
  //           isLoading2 = false;
  //         }
  //       }
  //     });
  //   });
  // }

  // getOppositeTeambyId(String Id) async{
  //   setState(() {
  //     isLoading3 = true;
  //   });
  //   GetTeamByIdFootvball.getUsers(Id).then((sites){
  //     setState(() {
  //       oppositeteamByIdFootball1 = sites!;
  //       isLoading3 = false;
  //     });
  //   });
  // }
  //
  // getVenueById(String Id) async{
  //   setState(() {
  //     isLoading4 = true;
  //   });
  //   GetVenueByIdServices.getUsers(Id).then((sites){
  //     setState(() {
  //       venueByIdFootball = sites!;
  //       isLoading4 = false;
  //     });
  //   });
  // }
  Future getBookmarkData() async{
    setState(() {
      isLoadingbook=true;
    });

    List<Value> queryRows = await DatabaseHelper.instance.queryAll();
    setState(() {
      bookmarks = queryRows;
    });
    if(bookmarks.length>0) {
      setState(() {
        isLoadingbook = false;
      });
    }
    // print(queryRows);

  }


  bool isLoading0c = true;

  bool isLoading0=true;

  Map<int,String> monthsInYear1 = {
    1: "Jan",
    2: "Feb",
    3: "Mar",
    4: "Apr",
    5: "May",
    6: "June",
    7: "July",
    8: "Aug",
    9: "Sep",
    10: "Oct",
    11: "Nov",
    12: "Dec",
  };

  List<User>? selectedUserList = [];


  late Cricket fixturesByDateRangeCricket;
  late Football fixturesByDateRangeFootball;

  late List<FT> list11 = [];
  late List<FT> list22 = [];




  getCricket() async{
    setState(() {
      isLoading0c = true;
    });
    var d = DateTime.now();
    var d1 = d.subtract(Duration(days: 6));
    var d2 = d.add(Duration(days: 6));
    String w1 = DateFormat('yyyy-MM-dd').format(d1);
    String w2 = DateFormat('yyyy-MM-dd').format(d2);

    GetFixturesByDateRangeCricketService.getUsers(w1,w2).then((sites){
      //  print(sites);
      if(sites!=null) {
        setState(() {
          fixturesByDateRangeCricket = sites;

          for(int i=0;i<fixturesByDateRangeCricket.data!.length;i++){

            list22.add(FT(fixturesByDateRangeCricket.data![i].id.toString()
              ,fixturesByDateRangeCricket.data![i].localteam!.imagePath.toString(),
              fixturesByDateRangeCricket.data![i].localteam!.name.toString(),
              fixturesByDateRangeCricket.data![i].visitorteam!.imagePath.toString(),
              fixturesByDateRangeCricket.data![i].visitorteam!.name.toString(),
              fixturesByDateRangeCricket.data![i].league!.name.toString(),
              fixturesByDateRangeCricket.data![i].startingAt.toString().substring(0,10),
              fixturesByDateRangeCricket.data![i].startingAt.toString().substring(0,19),
              fixturesByDateRangeCricket.data![i].startingAt.toString(),
              fixturesByDateRangeCricket.data![i].status.toString(),
              "C",
              fixturesByDateRangeCricket.data![i].round.toString(),
              fixturesByDateRangeCricket.data![i].venue!.name.toString(),
              fixturesByDateRangeCricket.data![i].venue!.city.toString(),
              fixturesByDateRangeCricket.data![i].venue!.capacity.toString(),
              fixturesByDateRangeCricket.data![i].venue!.imagePath.toString(),
              fixturesByDateRangeCricket.data![i].localteamId.toString(),
              fixturesByDateRangeCricket.data![i].visitorteamId.toString(),
            ));
            print( fixturesByDateRangeCricket.data![i].startingAt.toString().substring(0,10));
          }
          isLoading0c = false;

        });
      }
    });
    GetFixturesByDateRangeFootballService.getUsers(w1,w2).then((sites){
      //  print(sites);
      if(sites!=null) {
        setState(() {
          fixturesByDateRangeFootball = sites;

          for(int i=0;i<fixturesByDateRangeFootball.data!.length;i++){

            list22.add(FT(
              fixturesByDateRangeFootball.data![i].id.toString(),
              fixturesByDateRangeFootball.data![i].localTeam!.data!.logoPath.toString(),
              fixturesByDateRangeFootball.data![i].localTeam!.data!.name.toString(),
              fixturesByDateRangeFootball.data![i].visitorTeam!.data!.logoPath.toString(),
              fixturesByDateRangeFootball.data![i].visitorTeam!.data!.name.toString(),
              fixturesByDateRangeFootball.data![i].league!.data!.name.toString(),
              fixturesByDateRangeFootball.data![i].time!.startingAt!.date.toString().substring(0,10),
              fixturesByDateRangeFootball.data![i].time!.startingAt!.dateTime.toString().substring(0,19),
              fixturesByDateRangeFootball.data![i].time!.startingAt!.timezone.toString(),
              fixturesByDateRangeFootball.data![i].time!.status.toString(),
              "F",
              fixturesByDateRangeFootball.data![i].roundId.toString(),
              fixturesByDateRangeFootball.data![i].venue!.data!.name.toString(),
              fixturesByDateRangeFootball.data![i].venue!.data!.city.toString(),
              fixturesByDateRangeFootball.data![i].venue!.data!.capacity.toString(),
              fixturesByDateRangeFootball.data![i].venue!.data!.imagePath.toString(),
              fixturesByDateRangeFootball.data![i].localteamId.toString(),
              fixturesByDateRangeFootball.data![i].visitorteamId.toString(),

            ));
            print(fixturesByDateRangeFootball.data![i].time!.startingAt!.date.toString().substring(0,10));
          }
          list22.sort((a, b) => a.date.compareTo(b.date));
          list11.addAll(list22);
          isLoading0 = false;
        });
      }
    });



  }

  void openFilterDialog() async {
    await FilterListDialog.display<User>(
      context,
      listData: userList,
      selectedListData: selectedUserList,
      choiceChipLabel: (user) => user!.name,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (user, query) {
        return user.name!.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedUserList = List.from(list!);
          setState(() {
            //   print(list22.length);
            if(selectedUserList!.length==2){
              //   print("2");
              list11.clear();
              list11.addAll(list22);
            }else if(selectedUserList!.length==1){
              list11.clear();
              list11.addAll(list22);
              //   print("1");
              //  print(selectedUserList![0].name);
              if(selectedUserList![0].name=="Cricket"){
                list11.removeWhere((element) => element.ft=="F");
              }else{
                list11.removeWhere((element) => element.ft=="C");
                //   print(list11.length);
              }
            }else{
              list11.clear();
              list11.addAll(list22);
              //   print("0");
            }
          });
        });
        Navigator.pop(context);
      },
    );
  }


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    getCricket();
    getBookmarkData();


    // getData();
    // getFixtureByDateRange();
    // getFixtureByDateRangeCricket();
    // getTeamLogo();
    //   getOppositeTeamLogo();
    //   getleage();
    // getCricketLive();
    isSearching = false;


    // for(int i=0;i<7;i++){
    //   bookmarkList[i] = false;
    // }
    _fetchDogsBreed();
  }

  // void openFilterDialog() async {
  //   await FilterListDialog.display<User>(
  //     context,
  //     listData: userList,
  //     selectedListData: selectedUserList,
  //     choiceChipLabel: (user) => user!.name,
  //     validateSelectedItem: (list, val) => list!.contains(val),
  //     onItemSearch: (user, query) {
  //       return user.name!.toLowerCase().contains(query.toLowerCase());
  //     },
  //     onApplyButtonClick: (list) {
  //       setState(() {
  //         selectedUserList = List.from(list!);
  //       });
  //       Navigator.pop(context);
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double barheight =AppBar().preferredSize.height;
    double height = height1-safe-barheight;

    Future<bool> showExitPopup() async {
      return await showDialog( //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) =>
            AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              titleTextStyle: TextStyle(color: Colors.black,fontSize: 20),
              backgroundColor: Colors.white70,
              title: Text('Exit App',style: TextStyle(color: Colors.black,fontSize: 18),),
              content: Text('Do you want to exit an App?',style: TextStyle(color: Colors.black,fontSize: 18),),
              actions:[
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff57bbb4)),
                  ),
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  child:Text('No'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff57bbb4)),
                  ),
                  onPressed: () => exit(0),
                  //return true when click on "Yes"
                  child:Text('Yes'),
                ),

              ],
            ),
      )??false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: showExitPopup,

      child: SafeArea(

        child: GestureDetector(
          onTap: ()=> FocusScope.of(context).unfocus(),

          child: Scaffold(
            resizeToAvoidBottomInset:false,
            appBar: AppBar(
              centerTitle: true,
              title: isSearching == false ? Text("Home",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,)
                  : TextField(

                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Enter Bet Name",
                    icon: Icon(Icons.search),
                  ),
                  onChanged: (text){
                    _filterDogList(text);
                  }
                //onSearchTextChanged,
              ),
              iconTheme: IconThemeData(color: Colors.black),
              toolbarHeight: barheight,
              elevation: 0,
              backgroundColor: Colors.white,
              actions: <Widget>[
                isSearching==true
                    ?
                IconButton(
                  padding: EdgeInsets.fromLTRB(0, 0,40, 0),
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      isSearching==false?isSearching=true:isSearching=false;
                      controller.text="";
                      _filterDogList("");
                    });
                    // focusNode.requestFocus();

                  },
                )
                    :
                IconButton(
                  padding: EdgeInsets.fromLTRB(0, 0,40, 0),
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      isSearching==false?isSearching=true:isSearching=false;
                    });
                    //  focusNode.requestFocus();
                  },
                )
              ],
            ),
            drawer: ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(40.0),bottomRight: Radius.circular(40.0)),
              child: Drawer(
                  child:
                  Container(

                    child: Column(
                      children: [
                        Container(
                          width: width,
                          height: height*.20,
                          child: Image.asset("graphic_res/Asset 1.png",scale: 2,),

                        ),
                        Container(
                          width: width,
                          height: height*0.60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                  // Navigator.push(context, MaterialPageRoute(
                                  //     builder: (context) => HomeScreen())
                                  // );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: ListTile(
                                    leading: Icon(Icons.home,color: Color(0xff57bbb4),size: 45.0),
                                    title: Text("Home",style: TextStyle(fontSize: 18),),
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Divider(height: 0,thickness: 2,)),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => ReviewScreen()
                                  )
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: ListTile(
                                    leading: Icon(FontAwesomeIcons.solidBookmark,color: Color(0xff57bbb4),size: 36.0),
                                    title: Text("Bookmark",style: TextStyle(fontSize: 18),),
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Divider(height: 0,thickness: 2,)),

                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => ComparisonScreen())
                                  );

                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: ListTile(
                                    leading: Icon(Icons.compare,color: Color(0xff57bbb4),size: 40.0),
                                    title: Text("Comparison ",style: TextStyle(fontSize: 18),),
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Divider(height: 0,thickness: 2,)),

                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => Faqs())
                                  );
                                  //  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: ListTile(
                                    leading: Icon(FontAwesomeIcons.moneyCheck,color:Color(0xff57bbb4),size: 30.0),
                                    title: Text("FAQ",style: TextStyle(fontSize: 18),),
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Divider(height: 0,thickness: 2,)),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => FeedbackScreen())
                                  );
                                  //  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: ListTile(
                                    leading: Icon(FontAwesomeIcons.solidComment,color:Color(0xff57bbb4),size: 30.0),
                                    title: Text("FeedBack",style: TextStyle(fontSize: 18),),
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Divider(height: 0,thickness: 2,)),

                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => AboutUsScreen())
                                  );
                                  //  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: ListTile(
                                    leading: Icon(FontAwesomeIcons.users,color:Color(0xff57bbb4),size: 30.0),
                                    title: Text("About US",style: TextStyle(fontSize: 18),),
                                  ),
                                ),
                              ),




                            ],
                          ),
                        ),
                        // Container(
                        //   // color: Colors.red,
                        //   height: height - height*0.42 - height*.2933,
                        //   alignment: Alignment.bottomCenter,
                        //   child: Container(
                        //     //height: height*.2,
                        //     child: ButtonContainer("LOGOUT",DarkBlue),
                        //   ),
                        // ),

                      ],
                    ),
                  )

                // ListView(
                //   // Important: Remove any padding from the ListView.
                //   padding: EdgeInsets.zero,
                //   children: [
                //     const DrawerHeader(
                //       decoration: BoxDecoration(
                //         color: Colors.blue,
                //       ),
                //       child: Text('Drawer Header'),
                //     ),
                //     ListTile(
                //       title: const Text('Item 1'),
                //       onTap: () {
                //         // Update the state of the app.
                //         // ...
                //       },
                //     ),
                //     ListTile(
                //       title: const Text('Item 2'),
                //       onTap: () {
                //         // Update the state of the app.
                //         // ...
                //       },
                //     ),
                //   ],
                // ),
              ),
            ),
            floatingActionButtonLocation:FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton(
              // isExtended: true,
              child: Icon(FontAwesomeIcons.facebookMessenger),
              backgroundColor: Color(0xff083471),
              onPressed: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FeedbackScreen()
                      )
                  );
                });
              },
            ),


            body:
            Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'graphic_res/design_3_assets/3/Overlay.png'),
                    fit: BoxFit.fill,
                  ),

                  // gradient: LinearGradient(
                  //   colors: [
                  //     Color(0xFF03185A),
                  //     Color(0xFF003900),
                  //   ],
                  //   begin: FractionalOffset(0.0, 0.0),
                  //   end: FractionalOffset(0.0, 1.0),
                  // )
                ),
                child:
                CustomScrollView(
                  slivers: [
                    SliverList(delegate: SliverChildListDelegate(
                        [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                child: Column(
                                  children: [
                                    Container(

                                        margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                                onTap: (){
                                                  // print("hello");
                                                  //  Navigator.push(context,
                                                  //      MaterialPageRoute(
                                                  //          builder: (context) =>
                                                  //              Home02()
                                                  //      )
                                                  //  );
                                                },
                                                child: Text("Live Streaming",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18))),
                                            InkWell(
                                                onTap: (){
                                                  openFilterDialog();
                                                },
                                                child: Visibility(
                                                    visible: true,
                                                    child: Icon(Icons.filter_list,color: Colors.white,)))
                                          ],
                                        )),
                                    Container(
                                        height: height*0.2,
                                        child: isLoading0==false && isLoading0c==false?

                                        CarouselSlider.builder(
                                          itemCount: list11.length,
                                          itemBuilder: (BuildContext context, int index,
                                              int pageViewIndex) {
                                            var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(list11[index].time, true);
                                            var dateLocal = dateTime.toLocal();
                                            //    print(dateLocal);
                                            //   print(list11[index].status);
                                            //  FINISHED, POSTP, CANCL, NS           FT, NS
                                            String status = '';
                                            if(list11[index].ft=="C"){
                                              if(list11[index].status=="Finished"){
                                                status="Finished";
                                              }else if(list11[index].status=="Postp."){
                                                status="Postponded";
                                              }else if(list11[index].status=="Cancl."){
                                                status="Canceled";
                                              }else if(list11[index].status=="NS"){
                                                status="Upcoming";
                                              }else{
                                                status = "Live";
                                              }
                                            }else if(list11[index].ft=="F"){
                                              if(list11[index].status=="FT"){
                                                status="Finished";
                                              }else if(list11[index].status=="NS"){
                                                status="Upcoming";
                                              }else{
                                                status="Live";

                                              }
                                            }

                                            return InkWell(
                                              onTap: (){
                                                if(list11[index].ft=="F"){
                                                  if(list11[index].status=="NS"){
                                                    Navigator.push(context, MaterialPageRoute(
                                                        builder: (context) =>
                                                            FootballMainUpcoimgScreen(
                                                              list11[index].id,
                                                              list11[index].localTeamLogo,
                                                              list11[index].localTeamName,
                                                              list11[index].visitorTeamLogo,
                                                              list11[index].visitorTeamName,
                                                              list11[index].leage,
                                                              list11[index].date.substring(8,10)+ " " + monthsInYear1[int.parse(list11[index].date.substring(5,7))].toString(),
                                                              // list11[index].date,
                                                              DateFormat('hh:mm a').format(dateLocal),// list11[index].time,
                                                              list11[index].timzone,
                                                              list11[index].status,
                                                              list11[index].ft,
                                                              list11[index].round,
                                                              list11[index].vName,
                                                              list11[index].vCity,
                                                              list11[index].vCapacity,
                                                              list11[index].vImagepath,
                                                              list11[index].localTeamId,
                                                              list11[index].visitorTeamId,
                                                            )
                                                    ));
                                                  }else{
                                                    Navigator.push(context, MaterialPageRoute(
                                                        builder: (context) =>
                                                            FootballMainScreen(
                                                              list11[index].id,
                                                              list11[index].localTeamLogo,
                                                              list11[index].localTeamName,
                                                              list11[index].visitorTeamLogo,
                                                              list11[index].visitorTeamName,
                                                              list11[index].leage,
                                                              list11[index].date.substring(8,10)+ " " + monthsInYear1[int.parse(list11[index].date.substring(5,7))].toString(),
                                                              // list11[index].date,
                                                              DateFormat('hh:mm a').format(dateLocal),// list11[index].time,
                                                              list11[index].timzone,
                                                              list11[index].status,
                                                              list11[index].ft,
                                                              list11[index].round,
                                                              list11[index].vName,
                                                              list11[index].vCity,
                                                              list11[index].vCapacity,
                                                              list11[index].vImagepath,
                                                              list11[index].localTeamId,
                                                              list11[index].visitorTeamId,
                                                            )
                                                    ));

                                                  }

                                                }else{

                                                  if(list11[index].status=="Upcoming"){
                                                    Navigator.push(context, MaterialPageRoute(
                                                        builder: (context) =>
                                                            CrickerMainScreen(
                                                              list11[index].id,
                                                              list11[index].localTeamLogo,
                                                              list11[index].localTeamName,
                                                              list11[index].visitorTeamLogo,
                                                              list11[index].visitorTeamName,
                                                              list11[index].leage,
                                                              list11[index].date.substring(8,10)+ " " + monthsInYear1[int.parse(list11[index].date.substring(5,7))].toString(),
                                                              // list11[index].date,
                                                              DateFormat('hh:mm a').format(dateLocal),// list11[index].time,
                                                              list11[index].timzone,
                                                              list11[index].status,
                                                              list11[index].ft,
                                                              list11[index].round,
                                                              list11[index].vName,
                                                              list11[index].vCity,
                                                              list11[index].vCapacity,
                                                              list11[index].vImagepath,
                                                              list11[index].localTeamId,
                                                              list11[index].visitorTeamId,



                                                            )
                                                    ));

                                                  }else if(list11[index].status=="Finished" ){
                                                    Navigator.push(context, MaterialPageRoute(
                                                        builder: (context) =>
                                                            CrickerMainFinishedScreen(
                                                              list11[index].id,
                                                              list11[index].localTeamLogo,
                                                              list11[index].localTeamName,
                                                              list11[index].visitorTeamLogo,
                                                              list11[index].visitorTeamName,
                                                              list11[index].leage,
                                                              list11[index].date.substring(8,10)+ " " + monthsInYear1[int.parse(list11[index].date.substring(5,7))].toString(),
                                                              // list11[index].date,
                                                              DateFormat('hh:mm a').format(dateLocal),// list11[index].time,
                                                              list11[index].timzone,
                                                              list11[index].status,
                                                              list11[index].ft,
                                                              list11[index].round,
                                                              list11[index].vName,
                                                              list11[index].vCity,
                                                              list11[index].vCapacity,
                                                              list11[index].vImagepath,
                                                              list11[index].localTeamId,
                                                              list11[index].visitorTeamId,



                                                            )
                                                    ));
                                                  }else if(list11[index].status=="Cancl."){
                                                    Navigator.push(context, MaterialPageRoute(
                                                        builder: (context) =>
                                                            CrickerMainCanceledScreen(
                                                              list11[index].id,
                                                              list11[index].localTeamLogo,
                                                              list11[index].localTeamName,
                                                              list11[index].visitorTeamLogo,
                                                              list11[index].visitorTeamName,
                                                              list11[index].leage,
                                                              list11[index].date.substring(8,10)+ " " + monthsInYear1[int.parse(list11[index].date.substring(5,7))].toString(),
                                                              // list11[index].date,
                                                              DateFormat('hh:mm a').format(dateLocal),// list11[index].time,
                                                              list11[index].timzone,
                                                              list11[index].status,
                                                              list11[index].ft,
                                                              list11[index].round,
                                                              list11[index].vName,
                                                              list11[index].vCity,
                                                              list11[index].vCapacity,
                                                              list11[index].vImagepath,
                                                              list11[index].localTeamId,
                                                              list11[index].visitorTeamId,



                                                            )
                                                    ));

                                                  }else{
                                                    Navigator.push(context, MaterialPageRoute(
                                                        builder: (context) =>
                                                            CrickerMainLiveScreen(
                                                              list11[index].id,
                                                              list11[index].localTeamLogo,
                                                              list11[index].localTeamName,
                                                              list11[index].visitorTeamLogo,
                                                              list11[index].visitorTeamName,
                                                              list11[index].leage,
                                                              list11[index].date.substring(8,10)+ " " + monthsInYear1[int.parse(list11[index].date.substring(5,7))].toString(),
                                                              // list11[index].date,
                                                              DateFormat('hh:mm a').format(dateLocal),// list11[index].time,
                                                              list11[index].timzone,
                                                              list11[index].status,
                                                              list11[index].ft,
                                                              list11[index].round,
                                                              list11[index].vName,
                                                              list11[index].vCity,
                                                              list11[index].vCapacity,
                                                              list11[index].vImagepath,
                                                              list11[index].localTeamId,
                                                              list11[index].visitorTeamId,



                                                            )
                                                    ));

                                                  }

                                                }
                                              },
                                              child: Container(
                                                margin: EdgeInsets.symmetric(horizontal: 5),
                                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                                decoration: BoxDecoration(
                                                  color: Color(0xff083471),
                                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                                ),
                                                height: height*0.2,
                                                width: width*0.8,
                                                child:
                                                //Text(list11[index].date + "    " + list11[index].ft,style: TextStyle(color: Colors.white),),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          list11[index].date.substring(8,10)+ " " + monthsInYear1[int.parse(list11[index].date.substring(5,7))].toString()
                                                          // list11[index].date
                                                          // fixturesByDateRangeCricket.data![index].time!.startingAt!.date!.day.toString()+" "+
                                                          //   monthsInYear[fixturesByDateRangeCricket.data![index].time!.startingAt!.date!.month]!
                                                          ,style: TextStyle(color: Colors.white),),
                                                        Text(
                                                            list11[index].leage
                                                            ,style: TextStyle(color: Colors.white,fontSize: 12)),
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Icon(FontAwesomeIcons.dotCircle,color:
                                                            status=="Finished"?
                                                            Colors.green :
                                                            status=="Upcoming" ?
                                                            Colors.orange
                                                                :
                                                            Colors.red
                                                              ,size: 14,),
                                                            Text(
                                                                " "+ status

                                                                //list11[index].status
                                                                ,style: TextStyle(color:
                                                            status=="Finished"?
                                                            Colors.green :
                                                            status=="Upcoming" ?
                                                            Colors.orange
                                                                :
                                                            Colors.red
                                                            )),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          alignment: Alignment.center,
                                                          width: width*0.25,
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                  width: width*0.1,
                                                                  height: 50,
                                                                  child:
                                                                  Image.network(
                                                                    list11[index].localTeamLogo
                                                                    ,
                                                                    fit: BoxFit.contain,
                                                                    height: height*.48*.51,
                                                                    loadingBuilder: (BuildContext context, Widget child,
                                                                        ImageChunkEvent? loadingProgress) {
                                                                      if (loadingProgress == null) return child;
                                                                      return Center(
                                                                        child: CircularProgressIndicator(
                                                                          value: loadingProgress.expectedTotalBytes != null
                                                                              ? loadingProgress.cumulativeBytesLoaded /
                                                                              loadingProgress.expectedTotalBytes!
                                                                              : null,
                                                                        ),
                                                                      );
                                                                    },
                                                                  )

                                                              ),//TODO put image here
                                                              FittedBox(
                                                                child: Text(
                                                                    list11[index].localTeamName
                                                                    // fixturesByDateRangeFootball.data![index].localteamId.toString()
                                                                    // teamname[index]
                                                                    ,style: TextStyle(color: Colors.white)),
                                                              ),

                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                            width: width*0.2,
                                                            height: 50,
                                                            child: Opacity(
                                                                opacity: 0.4,
                                                                child:

                                                                Image.asset(
                                                                  list11[index].ft=="C" ?
                                                                  "graphic_res/cricket_1.png"
                                                                      : "graphic_res/football.png"
                                                                  ,fit: BoxFit.contain,))),
                                                        Container(
                                                          // color: Colors.red,
                                                          width: width*0.25,
                                                          alignment: Alignment.center,

                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                  width: width*0.1,
                                                                  height: 50,
                                                                  child:
                                                                  Image.network(
                                                                    list11[index].visitorTeamLogo
                                                                    // oppositeteamlogo[index]
                                                                    ,
                                                                    fit: BoxFit.contain,
                                                                    height: height*.48*.51,
                                                                    loadingBuilder: (BuildContext context, Widget child,
                                                                        ImageChunkEvent? loadingProgress) {
                                                                      if (loadingProgress == null) return child;
                                                                      return Center(
                                                                        child: CircularProgressIndicator(
                                                                          value: loadingProgress.expectedTotalBytes != null
                                                                              ? loadingProgress.cumulativeBytesLoaded /
                                                                              loadingProgress.expectedTotalBytes!
                                                                              : null,
                                                                        ),
                                                                      );
                                                                    },
                                                                  )

                                                                // Image.asset('graphic_res/england.png'),
                                                              ),//TODO put image here
                                                              FittedBox(
                                                                child: Text(
                                                                    list11[index].visitorTeamName
                                                                    // fixturesByDateRangeFootball.data![index].visitorteamId.toString()
                                                                    // oppositeteamname[index]
                                                                    ,style: TextStyle(color: Colors.white)),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Divider(height: height*0.011,color: Colors.white,thickness: height*0.0029,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                            DateFormat('hh:mm a').format(dateLocal)
                                                            //   dateLocal.hour > 12 ?
                                                            // (fixturesByDateRangeCricket.data![index].startingAt!.hour-12).toString() + " PM"
                                                            //     :
                                                            // fixturesByDateRangeCricket.data![index].startingAt!.hour==12?
                                                            // (fixturesByDateRangeCricket.data![index].startingAt!.hour).toString() + " PM"
                                                            //     :
                                                            // (fixturesByDateRangeCricket.data![index].startingAt!.hour).toString() + " AM"
                                                            // list11[index].time
                                                            // fixturesByDateRangeCricket.data![index].startingAt!.hour >12 ?
                                                            // (fixturesByDateRangeCricket.data![index].startingAt!.hour-12).toString() + " PM"
                                                            //     :
                                                            // fixturesByDateRangeCricket.data![index].startingAt!.hour==12?
                                                            // (fixturesByDateRangeCricket.data![index].startingAt!.hour).toString() + " PM"
                                                            //     :
                                                            // (fixturesByDateRangeCricket.data![index].startingAt!.hour).toString() + " AM"
                                                            ,style: TextStyle(color: Colors.white)),
                                                        Text("",style: TextStyle(color: Colors.white))
                                                      ],
                                                    )
                                                  ],
                                                ),

                                              ),
                                            );
                                          },
                                          options: CarouselOptions(
                                            height: 300,
                                            // aspectRatio: 16/9,
                                            viewportFraction: 1,

                                            initialPage: 0,
                                            enableInfiniteScroll: true,
                                            reverse: false,
                                            autoPlay: true,
                                            autoPlayInterval: Duration(seconds: 3),
                                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                                            autoPlayCurve: Curves.easeInOutCirc,
                                            enlargeCenterPage: true,
                                            //onPageChanged: callbackFunction,
                                            scrollDirection: Axis.horizontal,
                                          ),
                                        )

                                            :
                                        Container(
                                            width: width,
                                            height: height*0.2,
                                            alignment: Alignment.center,
                                            child: Center(child: CircularProgressIndicator()))
                                    )
                                    // Container(
                                    //   height: height*0.2,
                                    //   // color: Colors.red,
                                    //   child:
                                    //   isLoading0 == false && isLoading0c==false ?
                                    //   ListView.builder(
                                    //       scrollDirection: Axis.horizontal,
                                    //       itemCount:
                                    //       (selectedUserList!.contains("Football")==true && selectedUserList!.contains("Cricket")==true)
                                    //           ||
                                    //           (selectedUserList!.contains("Football")==false && selectedUserList!.contains("Cricket")==false)
                                    //           ?
                                    //       fixturesByDateRangeFootball.data!.length + fixturesByDateRangeCricket.data!.length
                                    //           :
                                    //       selectedUserList!.contains("Football")==true && selectedUserList!.contains("Cricket")==false?
                                    //       fixturesByDateRangeFootball.data!.length
                                    //           :
                                    //       selectedUserList!.contains("Cricket")==true && selectedUserList!.contains("Football")==false?
                                    //       fixturesByDateRangeCricket.data!.length :
                                    //           0
                                    //           ,
                                    //       itemBuilder: (context,index){
                                    //         int i = index-fixturesByDateRangeFootball.data!.length;
                                    //         return
                                    //           index<fixturesByDateRangeFootball.data!.length?
                                    //
                                    //           InkWell(
                                    //           onTap: () {
                                    //
                                    //             if( fixturesByDateRangeFootball.data![index].time!.status.toString().contains("NS")){
                                    //               Navigator.push(context,
                                    //                   MaterialPageRoute(
                                    //                       builder: (context) =>
                                    //                           FixtureMatchDataFootballUpcomingScreen(fixturesByDateRangeFootball.data![index].id!)
                                    //                   )
                                    //               );
                                    //             }else if(fixturesByDateRangeFootball.data![index].time!.status.toString().contains("Finished")){
                                    //               Navigator.push(context,
                                    //                   MaterialPageRoute(
                                    //                       builder: (context) =>
                                    //                           FixtureMatchDataFootballUpcomingScreen(fixturesByDateRangeFootball.data![index].id!)
                                    //                   )
                                    //               );
                                    //             }else{
                                    //               Navigator.push(context,
                                    //                   MaterialPageRoute(
                                    //                       builder: (context) =>
                                    //                           FixtureMatchDataFootballLiveScreen(fixturesByDateRangeFootball.data![index].id!)
                                    //                   )
                                    //               );
                                    //             }
                                    //            }
                                    //           ,
                                    //           child: Container(
                                    //
                                    //             margin: EdgeInsets.symmetric(horizontal: 5),
                                    //             padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                    //             decoration: BoxDecoration(
                                    //               color: Color(0xff083471),
                                    //               borderRadius: BorderRadius.all(Radius.circular(20)),
                                    //             ),
                                    //             height: height*0.2,
                                    //             width: width*0.8,
                                    //             child: Column(
                                    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //               children: [
                                    //                 Row(
                                    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    //                   children: [
                                    //                     Text(fixturesByDateRangeFootball.data![index].time!.startingAt!.date!.day.toString()+" "+
                                    //                         monthsInYear[fixturesByDateRangeFootball.data![index].time!.startingAt!.date!.month]!,style: TextStyle(color: Colors.white),),
                                    //                     Text(
                                    //                         isLoading1==false?
                                    //                         league[index].toString()
                                    //                         // fixturesByDateRangeFootball.data![index].leagueId.toString()
                                    //                         // leaguesname[index]
                                    //                             :""
                                    //
                                    //                         ,style: TextStyle(color: Colors.white)),
                                    //                     Row(
                                    //
                                    //                       crossAxisAlignment: CrossAxisAlignment.center,
                                    //                       children: [
                                    //                          Icon(FontAwesomeIcons.dotCircle,color:
                                    //
                                    //                          fixturesByDateRangeFootball.data![index].time!.status.toString().contains("NS") ?
                                    //                              Colors.orange
                                    //                              :
                                    //                          fixturesByDateRangeFootball.data![index].time!.status.toString().contains("Finished") ?
                                    //                          Colors.green
                                    //                              :
                                    //                          Colors.red
                                    //                            ,size: 14,),
                                    //                         Text(
                                    //                           fixturesByDateRangeFootball.data![index].time!.status.toString().contains("NS") ?
                                    //                           " Upcoming":
                                    //                         fixturesByDateRangeFootball.data![index].time!.status.toString().contains("Finished") ?
                                    //                             " Finished"
                                    //                             :
                                    //                             " Live"
                                    //                        // fixturesByDateRangeFootball.data![index].time!.status!.index.toString()
                                    //
                                    //                             ,style: TextStyle(
                                    //                             color:
                                    //                             fixturesByDateRangeFootball.data![index].time!.status.toString().contains("NS") ?
                                    //                             Colors.orange
                                    //                                 :
                                    //                             fixturesByDateRangeFootball.data![index].time!.status.toString().contains("Finished") ?
                                    //                             Colors.green
                                    //                                 :
                                    //                             Colors.red)),
                                    //                       ],
                                    //                     )
                                    //                   ],
                                    //                 ),
                                    //                 Row(
                                    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                   children: [
                                    //                     Container(
                                    //                       alignment: Alignment.center,
                                    //                       width: width*0.25,
                                    //                       child: Column(
                                    //                         children: [
                                    //                           Container(
                                    //                             width: width*0.1,
                                    //                             height: 50,
                                    //                             child:  isLoading6==false?
                                    //                             Image.network(
                                    //                               localteamlogo[index].toString()
                                    //                               // teamlogo[index]
                                    //
                                    //                               // teamlogo1[0].logolink.toString()
                                    //                               ,
                                    //                               fit: BoxFit.contain,
                                    //                               height: height*.48*.51,
                                    //                               loadingBuilder: (BuildContext context, Widget child,
                                    //                                   ImageChunkEvent? loadingProgress) {
                                    //                                 if (loadingProgress == null) return child;
                                    //                                 return Center(
                                    //                                   child: CircularProgressIndicator(
                                    //                                     value: loadingProgress.expectedTotalBytes != null
                                    //                                         ? loadingProgress.cumulativeBytesLoaded /
                                    //                                         loadingProgress.expectedTotalBytes!
                                    //                                         : null,
                                    //                                   ),
                                    //                                 );
                                    //                               },
                                    //                             )
                                    //                                 :
                                    //                             Container(
                                    //                             //  color: Colors.red,
                                    //                             ),
                                    //                           ),//TODO put image here
                                    //                           Text(isLoading6==false?
                                    //                           localteam[index].toString()
                                    //                           // fixturesByDateRangeFootball.data![index].localteamId.toString()
                                    //                           // teamname[index]
                                    //                               : "" ,style: TextStyle(color: Colors.white)),
                                    //
                                    //                         ],
                                    //                       ),
                                    //                     ),
                                    //                     Container(
                                    //                         width: width*0.2,
                                    //                         height: 50,
                                    //                         child: Opacity(
                                    //                             opacity: 0.4,
                                    //                             child: Image.asset("graphic_res/football.png",fit: BoxFit.contain,))),
                                    //                     Container(
                                    //                       // color: Colors.red,
                                    //                       width: width*0.25,
                                    //                       alignment: Alignment.center,
                                    //
                                    //                       child: Column(
                                    //                         children: [
                                    //                           Container(
                                    //                             width: width*0.1,
                                    //                             height: 50,
                                    //                             child: isLoading7==false?
                                    //                             Image.network(
                                    //                               visitorteamlogo[index].toString()
                                    //                               // oppositeteamlogo[index]
                                    //                               ,
                                    //                               fit: BoxFit.contain,
                                    //                               height: height*.48*.51,
                                    //                               loadingBuilder: (BuildContext context, Widget child,
                                    //                                   ImageChunkEvent? loadingProgress) {
                                    //                                 if (loadingProgress == null) return child;
                                    //                                 return Center(
                                    //                                   child: CircularProgressIndicator(
                                    //                                     value: loadingProgress.expectedTotalBytes != null
                                    //                                         ? loadingProgress.cumulativeBytesLoaded /
                                    //                                         loadingProgress.expectedTotalBytes!
                                    //                                         : null,
                                    //                                   ),
                                    //                                 );
                                    //                               },
                                    //                             )
                                    //                                 :
                                    //                             Container(),
                                    //                             // Image.asset('graphic_res/england.png'),
                                    //                           ),//TODO put image here
                                    //                           Text(
                                    //                               isLoading7==false?
                                    //                               visitorteam[index]!
                                    //                               // fixturesByDateRangeFootball.data![index].visitorteamId.toString()
                                    //                               // oppositeteamname[index]
                                    //                                   : "",style: TextStyle(color: Colors.white)),
                                    //
                                    //                         ],
                                    //                       ),
                                    //                     )
                                    //                   ],
                                    //                 ),
                                    //                 Divider(height: height*0.011,color: Colors.white,thickness: height*0.0029,),
                                    //                 Row(
                                    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                   children: [
                                    //                     Text(
                                    //                         int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))>12?
                                    //                         (int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))-12).toString() + " PM"
                                    //                             :
                                    //                         int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))==12?
                                    //                         (int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))).toString() + " PM"
                                    //                             :
                                    //                         fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2) + " AM"
                                    //
                                    //
                                    //
                                    //                         ,style: TextStyle(color: Colors.white)),
                                    //                     Text("",style: TextStyle(color: Colors.white))
                                    //                   ],
                                    //                 )
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         )
                                    //           :
                                    //           InkWell(
                                    //             onTap: () {
                                    //
                                    //
                                    //               if(fixturesByDateRangeCricket.data![i].status=="NS"){
                                    //                 Navigator.push(context,
                                    //                     MaterialPageRoute(
                                    //                         builder: (context) =>
                                    //                             FixtureMatchDataCricketScreen(fixturesByDateRangeCricket.data![i].id!)
                                    //                     )
                                    //                 );
                                    //               }else if(fixturesByDateRangeCricket.data![i].status=="Finished"){
                                    //                 Navigator.push(context,
                                    //                     MaterialPageRoute(
                                    //                         builder: (context) =>
                                    //                             FixtureMatchDataCricketFinishedScreen(fixturesByDateRangeCricket.data![i].id!)
                                    //                     )
                                    //                 );
                                    //               }else{
                                    //                 Navigator.push(context,
                                    //                     MaterialPageRoute(
                                    //                         builder: (context) =>
                                    //                             FixtureMatchDataCricketScreen(fixturesByDateRangeCricket.data![i].id!)
                                    //                     )
                                    //                 );
                                    //               }
                                    //
                                    //
                                    //
                                    //
                                    //
                                    //
                                    //             }
                                    //             ,
                                    //             child:
                                    //             isLoading0c == false ?
                                    //             Container(
                                    //               margin: EdgeInsets.symmetric(horizontal: 5),
                                    //               padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                    //               decoration: BoxDecoration(
                                    //                 color: Color(0xff083471),
                                    //                 borderRadius: BorderRadius.all(Radius.circular(20)),
                                    //               ),
                                    //               height: height*0.2,
                                    //               width: width*0.8,
                                    //               child: Column(
                                    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                 children: [
                                    //                   Row(
                                    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                     children: [
                                    //                       Text(
                                    //                         fixturesByDateRangeCricket.data![i].startingAt!.day.toString()+ " "+
                                    //                             monthsInYear1[fixturesByDateRangeCricket.data![i].startingAt!.month]!
                                    //                         // fixturesByDateRangeCricket.data![index].time!.startingAt!.date!.day.toString()+" "+
                                    //                         //   monthsInYear[fixturesByDateRangeCricket.data![index].time!.startingAt!.date!.month]!
                                    //
                                    //                         ,style: TextStyle(color: Colors.white),),
                                    //                       Text(
                                    //
                                    //                           isLoading1c==false?
                                    //                           leaguec[i].toString()
                                    //                           // fixturesByDateRangeFootball.data![index].leagueId.toString()
                                    //                           // leaguesname[index]
                                    //                               :""
                                    //
                                    //                           ,style: TextStyle(color: Colors.white,fontSize: 12)),
                                    //                       Row(
                                    //                         crossAxisAlignment: CrossAxisAlignment.center,
                                    //                         children: [
                                    //                           Icon(FontAwesomeIcons.dotCircle,color:
                                    //
                                    //                           fixturesByDateRangeCricket.data![i].status=="NS"?
                                    //                           Colors.orange
                                    //                               :
                                    //                           fixturesByDateRangeCricket.data![i].status=="Finished"?
                                    //                           Colors.green
                                    //                               :
                                    //                           Colors.red
                                    //
                                    //                             ,size: 14,),
                                    //                           Text(
                                    //                             fixturesByDateRangeCricket.data![i].status=="NS"?
                                    //                               " Upcoming":
                                    //                             fixturesByDateRangeCricket.data![i].status=="Finished"?
                                    //                               " Finished":
                                    //                               " Live"
                                    //                               ,style: TextStyle(color:  fixturesByDateRangeCricket.data![i].status=="NS"?
                                    //                           Colors.orange
                                    //                               :
                                    //                           fixturesByDateRangeCricket.data![i].status=="Finished"?
                                    //                           Colors.green
                                    //                               :
                                    //                           Colors.red)),
                                    //                         ],
                                    //                       )
                                    //                     ],
                                    //                   ),
                                    //                   Row(
                                    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                     children: [
                                    //                       Container(
                                    //                         alignment: Alignment.center,
                                    //                         width: width*0.25,
                                    //                         child: Column(
                                    //                           children: [
                                    //                             Container(
                                    //                               width: width*0.1,
                                    //                               height: 50,
                                    //                               child:  isLoading6c==false?
                                    //                               Image.network(
                                    //                                 localteamlogoc[i].toString()
                                    //                                 // teamlogo[index]
                                    //
                                    //                                 // teamlogo1[0].logolink.toString()
                                    //                                 ,
                                    //                                 fit: BoxFit.contain,
                                    //                                 height: height*.48*.51,
                                    //                                 loadingBuilder: (BuildContext context, Widget child,
                                    //                                     ImageChunkEvent? loadingProgress) {
                                    //                                   if (loadingProgress == null) return child;
                                    //                                   return Center(
                                    //                                     child: CircularProgressIndicator(
                                    //                                       value: loadingProgress.expectedTotalBytes != null
                                    //                                           ? loadingProgress.cumulativeBytesLoaded /
                                    //                                           loadingProgress.expectedTotalBytes!
                                    //                                           : null,
                                    //                                     ),
                                    //                                   );
                                    //                                 },
                                    //                               )
                                    //                                   :
                                    //                               Container(
                                    //                                 // color: Colors.red,
                                    //                               ),
                                    //                             ),//TODO put image here
                                    //                             Text(isLoading6c==false?
                                    //                             localteamc[i].toString()
                                    //                             // fixturesByDateRangeFootball.data![index].localteamId.toString()
                                    //                             // teamname[index]
                                    //                                 : "" ,style: TextStyle(color: Colors.white)),
                                    //
                                    //                           ],
                                    //                         ),
                                    //                       ),
                                    //                       Container(
                                    //                           width: width*0.2,
                                    //                           height: 50,
                                    //                           child: Opacity(
                                    //                               opacity: 0.4,
                                    //                               child: Image.asset("graphic_res/cricket_1.png",fit: BoxFit.contain,))),
                                    //                       Container(
                                    //                         // color: Colors.red,
                                    //                         width: width*0.25,
                                    //                         alignment: Alignment.center,
                                    //
                                    //                         child: Column(
                                    //                           children: [
                                    //                             Container(
                                    //                               width: width*0.1,
                                    //                               height: 50,
                                    //                               child: isLoading7c==false?
                                    //                               Image.network(
                                    //                                 visitorteamlogoc[i].toString()
                                    //                                 // oppositeteamlogo[index]
                                    //                                 ,
                                    //                                 fit: BoxFit.contain,
                                    //                                 height: height*.48*.51,
                                    //                                 loadingBuilder: (BuildContext context, Widget child,
                                    //                                     ImageChunkEvent? loadingProgress) {
                                    //                                   if (loadingProgress == null) return child;
                                    //                                   return Center(
                                    //                                     child: CircularProgressIndicator(
                                    //                                       value: loadingProgress.expectedTotalBytes != null
                                    //                                           ? loadingProgress.cumulativeBytesLoaded /
                                    //                                           loadingProgress.expectedTotalBytes!
                                    //                                           : null,
                                    //                                     ),
                                    //                                   );
                                    //                                 },
                                    //                               )
                                    //                                   :
                                    //                               Container(),
                                    //                               // Image.asset('graphic_res/england.png'),
                                    //                             ),//TODO put image here
                                    //                             Text(
                                    //                                 isLoading7c==false?
                                    //                                 visitorteamc[i]!
                                    //                                 // fixturesByDateRangeFootball.data![index].visitorteamId.toString()
                                    //                                 // oppositeteamname[index]
                                    //                                     : "",style: TextStyle(color: Colors.white)),
                                    //
                                    //                           ],
                                    //                         ),
                                    //                       )
                                    //                     ],
                                    //                   ),
                                    //                   Divider(height: height*0.011,color: Colors.white,thickness: height*0.0029,),
                                    //                   Row(
                                    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                     children: [
                                    //                       Text(
                                    //                           fixturesByDateRangeCricket.data![i].startingAt!.hour >12 ?
                                    //                           (fixturesByDateRangeCricket.data![i].startingAt!.hour-12).toString() + " PM"
                                    //                               :
                                    //                           fixturesByDateRangeCricket.data![i].startingAt!.hour==12?
                                    //                           (fixturesByDateRangeCricket.data![i].startingAt!.hour).toString() + " PM"
                                    //                               :
                                    //                           (fixturesByDateRangeCricket.data![i].startingAt!.hour).toString() + " AM"
                                    //
                                    //                           //       int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))>12?
                                    //                           // (int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))-12).toString() + " PM"
                                    //                           //     :
                                    //                           // int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))==12?
                                    //                           // (int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))).toString() + " PM"
                                    //                           //     :
                                    //                           // fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2) + " AM"
                                    //
                                    //
                                    //                           ,style: TextStyle(color: Colors.white)),
                                    //                       Text("",style: TextStyle(color: Colors.white))
                                    //                     ],
                                    //                   )
                                    //                 ],
                                    //               ),
                                    //             )
                                    //             :
                                    //                 Container()
                                    //
                                    //             ,
                                    //           )
                                    //
                                    //         ;
                                    //       })
                                    //       : Container(child: CircularProgressIndicator(),)
                                    //   ,
                                    // ),

                                    // Container(
                                    //   height: height*0.2,
                                    //   // color: Colors.red,
                                    //   child:
                                    //   isLoading0 == false ?
                                    //   ListView.builder(
                                    //       scrollDirection: Axis.horizontal,
                                    //       itemCount: footballLiveScore1.data.length,
                                    //       itemBuilder: (context,index){
                                    //         return InkWell(
                                    //                           onTap: () {
                                    //                             Navigator.push(context,
                                    //                                 MaterialPageRoute(
                                    //                                     builder: (context) =>
                                    //                                         FootballLiveScoreScreen(index)
                                    //                                 )
                                    //                             );
                                    //                           }
                                    //                           ,
                                    //                           child: Container(
                                    //
                                    //                             margin: EdgeInsets.symmetric(horizontal: 5),
                                    //                             padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                    //                             decoration: BoxDecoration(
                                    //                                 color: Color(0xff083471),
                                    //                                 borderRadius: BorderRadius.all(Radius.circular(20)),
                                    //
                                    //                             ),
                                    //                             height: height*0.2,
                                    //                             width: width*0.8,
                                    //                             child: Column(
                                    //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                               children: [
                                    //                                 Row(
                                    //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                                   children: [
                                    //                                     Text(footballLiveScore1.data[index].time.startingAt.date.day.toString()+" "+
                                    //                                         monthsInYear[footballLiveScore1.data[index].time.startingAt.date.month]!,style: TextStyle(color: Colors.white),),
                                    //                                     Text(
                                    //
                                    //                                         isLoading1==false?
                                    //                                             leaguesname[index]:""
                                    //
                                    //                                         ,style: TextStyle(color: Colors.white)),
                                    //                                     Row(
                                    //                                       crossAxisAlignment: CrossAxisAlignment.center,
                                    //                                       children: [
                                    //                                         Icon(FontAwesomeIcons.dotCircle,color: Colors.red,size: 14,),
                                    //                                         Text(" Live",style: TextStyle(color: Colors.red)),
                                    //                                       ],
                                    //                                     )
                                    //                                   ],
                                    //                                 ),
                                    //                                 Row(
                                    //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                                   children: [
                                    //                                     Container(
                                    //                                       alignment: Alignment.center,
                                    //                                       width: width*0.25,
                                    //                                       child: Column(
                                    //                                         children: [
                                    //                                           Container(
                                    //                                             width: width*0.1,
                                    //                                             height: 50,
                                    //                                             child:  isLoading6==false?
                                    //                                             Image.network(
                                    //                                                 teamlogo[index]
                                    //
                                    //                                             // teamlogo1[0].logolink.toString()
                                    //                                               ,
                                    //                                               fit: BoxFit.contain,
                                    //                                               height: height*.48*.51,
                                    //                                               loadingBuilder: (BuildContext context, Widget child,
                                    //                                                   ImageChunkEvent? loadingProgress) {
                                    //                                                 if (loadingProgress == null) return child;
                                    //                                                 return Center(
                                    //                                                   child: CircularProgressIndicator(
                                    //                                                     value: loadingProgress.expectedTotalBytes != null
                                    //                                                         ? loadingProgress.cumulativeBytesLoaded /
                                    //                                                         loadingProgress.expectedTotalBytes!
                                    //                                                         : null,
                                    //                                                   ),
                                    //                                                 );
                                    //                                               },
                                    //                                             )
                                    //                                                 :
                                    //                                             Container(),
                                    //                                           ),//TODO put image here
                                    //                                           Text(isLoading6==false? teamname[index] : "" ,style: TextStyle(color: Colors.white)),
                                    //
                                    //                                         ],
                                    //                                       ),
                                    //                                     ),
                                    //                                     Container(
                                    //                                         width: width*0.2,
                                    //                                         height: 50,
                                    //                                         child: Opacity(
                                    //                                           opacity: 0.4,
                                    //                                             child: Image.asset("graphic_res/football.png",fit: BoxFit.contain,))),
                                    //                                     Container(
                                    //                                       // color: Colors.red,
                                    //                                       width: width*0.25,
                                    //                                       alignment: Alignment.center,
                                    //
                                    //                                       child: Column(
                                    //                                         children: [
                                    //                                           Container(
                                    //                                             width: width*0.1,
                                    //                                             height: 50,
                                    //                                             child: isLoading7==false?
                                    //                                             Image.network(
                                    //                                               oppositeteamlogo[index]
                                    //                                               ,
                                    //                                               fit: BoxFit.contain,
                                    //                                               height: height*.48*.51,
                                    //                                               loadingBuilder: (BuildContext context, Widget child,
                                    //                                                   ImageChunkEvent? loadingProgress) {
                                    //                                                 if (loadingProgress == null) return child;
                                    //                                                 return Center(
                                    //                                                   child: CircularProgressIndicator(
                                    //                                                     value: loadingProgress.expectedTotalBytes != null
                                    //                                                         ? loadingProgress.cumulativeBytesLoaded /
                                    //                                                         loadingProgress.expectedTotalBytes!
                                    //                                                         : null,
                                    //                                                   ),
                                    //                                                 );
                                    //                                               },
                                    //                                             )
                                    //                                                 :
                                    //                                             Container(),
                                    //                                             // Image.asset('graphic_res/england.png'),
                                    //                                           ),//TODO put image here
                                    //                                           Text(isLoading7==false? oppositeteamname[index] : "",style: TextStyle(color: Colors.white)),
                                    //
                                    //                                         ],
                                    //                                       ),
                                    //                                     )
                                    //                                   ],
                                    //                                 ),
                                    //                                 Divider(height: height*0.011,color: Colors.white,thickness: height*0.0029,),
                                    //                                 Row(
                                    //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //                                   children: [
                                    //                                     Text(
                                    //                                      int.parse(footballLiveScore1.data[index].time.startingAt.time.substring(0,2))>12?
                                    //                                      (int.parse(footballLiveScore1.data[index].time.startingAt.time.substring(0,2))-12).toString() + " PM"
                                    //                                          :
                                    //                                      int.parse(footballLiveScore1.data[index].time.startingAt.time.substring(0,2))==12?
                                    //                                      (int.parse(footballLiveScore1.data[index].time.startingAt.time.substring(0,2))).toString() + " PM"
                                    //                                          :
                                    //                                      footballLiveScore1.data[index].time.startingAt.time.substring(0,2) + " AM"
                                    //
                                    //
                                    //                               //
                                    //                               //           footballLiveScore1.data[index].time.startingAt.time.substring(0,5)
                                    //                               //           +
                                    //                               //               ", "+
                                    //                               // int.parse(footballLiveScore1.data[index].time.startingAt.time.substring(0,2))==3
                                    //                               //           ? " " : ""
                                    //                               //
                                    //
                                    //                                         // footballLiveScore1.data[index].time.startingAt.date.month
                                    //
                                    //                                         ,style: TextStyle(color: Colors.white)),
                                    //                                     Text("",style: TextStyle(color: Colors.white))
                                    //                                   ],
                                    //                                 )
                                    //                               ],
                                    //                             ),
                                    //                           ),
                                    //                         );
                                    //       })
                                    //   : Container()
                                    //   ,
                                    // )

                                  ],
                                ),
                              ),
                              Container(
                                // color: Colors.red,
                                // height: height*.22,
                                child: Column(
                                  children:  [
                                    const SizedBox(height:10,),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Best Mobile Sports Betting Apps",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),)),
                                    ),
                                    // Padding(
                                    //   //padding: EdgeInsets.symmetric(horizontal: 20),
                                    //   padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                                    //   child: Align(
                                    //       alignment: Alignment.centerLeft,
                                    //       child: Text("Looking for the best sports betting app US to wager on tonight's game? Thanks to the recent explosion"
                                    //           "in sports betting, there are now dozens of sports betting apps to choose from"
                                    //           "",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w100,height: 1.5),)
                                    //   ),
                                    // ),

                                    // Divider(height: height*0.011,color: Colors.white,thickness: height*0.0029,),
                                    // Padding(
                                    //   //padding: EdgeInsets.symmetric(horizontal: 20),
                                    //   padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                    //   child: Align(
                                    //       alignment: Alignment.centerLeft,
                                    //       child: Row(
                                    //         children: [
                                    //           Container(  //Friday, 20 July 13:50
                                    //             width: width*0.7,
                                    //             child: Text("$formattedDate"+" "+_now+
                                    //                 "",
                                    //               style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400,height: 1.5),),
                                    //           ),
                                    //
                                    //           Text(
                                    //             "26°",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400,height: 1.5),
                                    //           ),
                                    //           SizedBox(width: 5,),
                                    //           Icon(Icons.wb_sunny_rounded ,color: Colors.yellow,size: 18,),
                                    //         ],
                                    //       )
                                    //   ),
                                    // ),

                                    //Divider(height: height*0.011,color: Colors.white,thickness: height*0.0029,),
                                  ],
                                ),

                              ),
                              Container(
                                //  flex: 1,
                                child:
                                isLoading?
                                Container(
                                    width: width,
                                    height: height*0.7,
                                    alignment: Alignment.center,
                                    child: Center(child: CircularProgressIndicator())):
                                Container(
                                    height: height*0.7,
                                    child:
                                    controller.text.isNotEmpty ?
                                    ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: dogsBreedList.length,
                                        itemBuilder: (context,index){
                                          Site site = dogsBreedList[index];
                                          var contain = dogbreedList.where((element) => element.siteId == site.id);
                                          bool bookmark;
                                          if(contain.isEmpty){
                                            bookmark = false;
                                          }else{
                                            bookmark = true;
                                          }
                                          // index == 0 ? rating = 0 :
                                          rating = double.parse(site.ratings);
                                          return  Container(
                                            padding: EdgeInsets.all(10),
                                            child:
                                            //index == 0 ? Container() :
                                            Container(
                                              height: height*.5,
                                              width: width*.82,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  // Image.network(site.bgImage,height: height*.48*.51,),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                                    child: Image.network(
                                                      site.bgImage,
                                                      fit: BoxFit.cover,
                                                      height: height*.48*.51,
                                                      loadingBuilder: (BuildContext context, Widget child,
                                                          ImageChunkEvent? loadingProgress) {
                                                        if (loadingProgress == null) return child;
                                                        return Center(
                                                          child: CircularProgressIndicator(
                                                            value: loadingProgress.expectedTotalBytes != null
                                                                ? loadingProgress.cumulativeBytesLoaded /
                                                                loadingProgress.expectedTotalBytes!
                                                                : null,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),


                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                                    height: height*.5*.15,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                            width: width*0.4,
                                                            child: Text(site.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600
                                                              // ,color: Colors.bla

                                                            ),)),
                                                        //  Image.asset("graphic_res/design_3_assets/3/xbet.png"),
                                                        // Image.network(site.logo,width: width*0.20,
                                                        //      fit: BoxFit.cover),
                                                        Container(
                                                          child: InkWell(
                                                              onTap: () async {
                                                                if(bookmarkList[index]==false) {
                                                                  setState(() {
                                                                    bookmarkList[index]=true;
                                                                  });
                                                                  print("false");
                                                                  int i = await DatabaseHelper
                                                                      .instance
                                                                      .insert(
                                                                      {
                                                                        DatabaseHelper
                                                                            .siteId: site
                                                                            .id,
                                                                        DatabaseHelper
                                                                            .siteTitle: site
                                                                            .title,
                                                                        DatabaseHelper
                                                                            .siteUrl: site
                                                                            .url,
                                                                        DatabaseHelper
                                                                            .sitePromocode: site
                                                                            .promocode,
                                                                        DatabaseHelper
                                                                            .siteRatings: site
                                                                            .ratings,
                                                                        DatabaseHelper
                                                                            .siteFeature1: site
                                                                            .feature1,
                                                                        DatabaseHelper
                                                                            .siteFeature2: site
                                                                            .feature2,
                                                                        DatabaseHelper
                                                                            .siteFeature3: site
                                                                            .feature3,
                                                                        DatabaseHelper
                                                                            .siteFeature4: site
                                                                            .feature4,
                                                                        DatabaseHelper
                                                                            .siteFeature5: site
                                                                            .feature5,
                                                                        DatabaseHelper
                                                                            .siteFeature6: site
                                                                            .feature6,
                                                                        DatabaseHelper
                                                                            .siteLogo: site
                                                                            .logo,
                                                                        DatabaseHelper
                                                                            .siteAddedDate: site
                                                                            .addedDate
                                                                            .toString(),
                                                                        DatabaseHelper
                                                                            .siteCons1: site
                                                                            .cons1,
                                                                        DatabaseHelper
                                                                            .siteCons2: site
                                                                            .cons2,
                                                                        DatabaseHelper
                                                                            .siteCons3: site
                                                                            .cons3,
                                                                        DatabaseHelper
                                                                            .siteCons4: site
                                                                            .cons4,
                                                                        DatabaseHelper
                                                                            .siteCons5: site
                                                                            .cons5,
                                                                        DatabaseHelper
                                                                            .siteCons6: site
                                                                            .cons6,
                                                                        DatabaseHelper
                                                                            .siteShortDescription: site
                                                                            .shortDescription,
                                                                        DatabaseHelper
                                                                            .siteLongDescrtiption: site
                                                                            .longDescription,
                                                                        DatabaseHelper
                                                                            .siteBonus: site
                                                                            .bonus,
                                                                        DatabaseHelper
                                                                            .siteBgImage: site
                                                                            .bgImage,
                                                                      }
                                                                  );
                                                                  print("The inserted ID is $i");

                                                                }else{
                                                                  setState(() {
                                                                    bookmarkList[index]=false;

                                                                  });
                                                                  print("true");
                                                                  int rowsEffected = await DatabaseHelper.instance.delete(int.parse(site.id));
                                                                  print(rowsEffected);
                                                                }
                                                                Navigator.pushReplacement(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (BuildContext context) => super.widget));
                                                              },
                                                              child:
                                                              bookmarkList[index]==false ?
                                                              Visibility(
                                                                  visible: true,

                                                                  child: Icon(FontAwesomeIcons.bookmark,color: Color(0xff57bbb4),))
                                                                  :
                                                              Visibility(
                                                                  visible: true,
                                                                  child: Icon(FontAwesomeIcons.solidBookmark,color: Color(0xff57bbb4)))



                                                          ),
                                                        ),
                                                        Image.network(
                                                          site.logo,
                                                          fit: BoxFit.contain,
                                                          width: width*0.20,
                                                          height: height*.48*.10,

                                                          loadingBuilder: (BuildContext context, Widget child,
                                                              ImageChunkEvent? loadingProgress) {
                                                            if (loadingProgress == null) return child;
                                                            return Center(
                                                              child: CircularProgressIndicator(
                                                                value: loadingProgress.expectedTotalBytes != null
                                                                    ? loadingProgress.cumulativeBytesLoaded /
                                                                    loadingProgress.expectedTotalBytes!
                                                                    : null,
                                                              ),
                                                            );
                                                          },
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                                    height: height*.5*.27,
                                                    child:
                                                    Text(site.shortDescription)
                                                    // Text("At the game? Just got a gut feeling?"
                                                    //     "No problem! Now you can bet from anywhere,"
                                                    //     "anytime with the all-new Xbet mobile betting")
                                                    ,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                                    height: height*.48*.097,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            Container(
                                                              alignment: Alignment.centerLeft,
                                                              color: Colors.white,
                                                              height: height*.05,
                                                              child: StarRating02(
                                                                size: 18,
                                                                rating: rating,
                                                                onRatingChanged: (rating) => setState(() {}),
                                                                color: Colors.transparent,
                                                              ),
                                                            ),
                                                            SizedBox(width: 5,),
                                                            Text(rating.toString(), style: TextStyle(fontSize: 16 , color: Colors.grey),),
                                                          ],
                                                        ),
                                                        Container(
                                                          alignment: Alignment.centerRight,
                                                          child: Container(
                                                              width: width*0.3,
                                                              decoration: BoxDecoration(
                                                                color: Color(0xff57bbb4),
                                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              ),
                                                              alignment: Alignment.center,
                                                              child:  TextButton(
                                                                onPressed: (){
                                                                  Navigator.push(context, MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          BetDescriptionScreen(
                                                                              site.id,
                                                                              site.title,
                                                                              site.url,
                                                                              site.promocode,
                                                                              site.ratings,
                                                                              site.feature1,
                                                                              site.feature2,
                                                                              site.feature3,
                                                                              site.feature4,
                                                                              site.logo,
                                                                              site.addedDate,
                                                                              site.feature5,
                                                                              site.feature6,
                                                                              site.cons1,
                                                                              site.cons2,
                                                                              site.cons3,
                                                                              site.cons4,
                                                                              site.cons5,
                                                                              site.cons6,
                                                                              site.shortDescription,
                                                                              site.longDescription,
                                                                              site.bonus,
                                                                              site.bgImage)

                                                                  )
                                                                  );

                                                                },
                                                                child: FittedBox(
                                                                    fit: BoxFit.fitWidth,
                                                                    child: Text("Claim Bonus",style: TextStyle(color: Colors.white),)),
                                                              )
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        })
                                        :
                                    ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: dogsBreedList.length,
                                        itemBuilder: (context,index){
                                          Site site = dogsBreedList[index];
                                          var contain = dogbreedList.where((element) => element.siteId == site.id);
                                          bool bookmark;
                                          if(contain.isEmpty){
                                            bookmark = false;
                                            bookmarkList[index]=false;
                                            // print("list "+bookmarkList[index].toString());

                                          }else{
                                            bookmark = true;
                                            bookmarkList[index]=true;
                                            // print("list "+bookmarkList[index].toString());

                                          }

                                          index == 0 ? rating = 0 : rating = double.parse(site.ratings);
                                          return  Container(
                                            padding: EdgeInsets.all(10),
                                            child:
                                            index == 0 ? Container() :
                                            Container(
                                              height: height*.5,
                                              width: width*.82,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  // Image.network(site.bgImage,height: height*.48*.51,),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                                    child: Image.network(
                                                      site.bgImage,
                                                      fit: BoxFit.cover,
                                                      height: height*.48*.51,
                                                      loadingBuilder: (BuildContext context, Widget child,
                                                          ImageChunkEvent? loadingProgress) {
                                                        if (loadingProgress == null) return child;
                                                        return Center(
                                                          child: CircularProgressIndicator(
                                                            value: loadingProgress.expectedTotalBytes != null
                                                                ? loadingProgress.cumulativeBytesLoaded /
                                                                loadingProgress.expectedTotalBytes!
                                                                : null,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),


                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                                    height: height*.5*.15,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        FittedBox(
                                                          child: Container(
                                                              width: width*0.4,
                                                              child: Text(site.title,
                                                                maxLines: 4,
                                                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,
                                                                  // ,color: Colors.bla
                                                                ),)),
                                                        ),
                                                        //  Image.asset("graphic_res/design_3_assets/3/xbet.png"),
                                                        // Image.network(site.logo,width: width*0.20,
                                                        //      fit: BoxFit.cover),
                                                        Container(
                                                          child: InkWell(
                                                              onTap: () async {

                                                                if(bookmarks.indexWhere((element) => element.siteId==site.id)==-1){
                                                                  setState(() {
                                                                    bookmarks.add(
                                                                        Value(
                                                                            id: int.parse(site.id),
                                                                            siteId: site.id.toString(),
                                                                            siteTitle: site.title,
                                                                            siteUrl: site.url,
                                                                            sitePromocode: site.promocode,
                                                                            siteRatings: site.ratings,
                                                                            siteFeature1: site.feature1,
                                                                            siteFeature2: site.feature2,
                                                                            siteFeature3: site.feature3,
                                                                            siteFeature4: site.feature4,
                                                                            siteFeature5: site.feature5,
                                                                            siteFeature6: site.feature6,
                                                                            siteLogo: site.logo,
                                                                            siteAddedDate: site.addedDate.toString(),
                                                                            siteCons1: site.cons1,
                                                                            siteCons2: site.cons2,
                                                                            siteCons3: site.cons3,
                                                                            siteCons4: site.cons4,
                                                                            siteCons5: site.cons5,
                                                                            siteCons6: site.cons6,
                                                                            siteShortDescription: site.shortDescription,
                                                                            siteLongDescrtiption: site.longDescription,
                                                                            siteBonus: site.bonus,
                                                                            siteBgImage: site.bgImage
                                                                        )
                                                                    );

                                                                  });
                                                                  int i = await DatabaseHelper
                                                                      .instance
                                                                      .insert(
                                                                      {
                                                                        DatabaseHelper
                                                                            .siteId: site
                                                                            .id,
                                                                        DatabaseHelper
                                                                            .siteTitle: site
                                                                            .title,
                                                                        DatabaseHelper
                                                                            .siteUrl: site
                                                                            .url,
                                                                        DatabaseHelper
                                                                            .sitePromocode: site
                                                                            .promocode,
                                                                        DatabaseHelper
                                                                            .siteRatings: site
                                                                            .ratings,
                                                                        DatabaseHelper
                                                                            .siteFeature1: site
                                                                            .feature1,
                                                                        DatabaseHelper
                                                                            .siteFeature2: site
                                                                            .feature2,
                                                                        DatabaseHelper
                                                                            .siteFeature3: site
                                                                            .feature3,
                                                                        DatabaseHelper
                                                                            .siteFeature4: site
                                                                            .feature4,
                                                                        DatabaseHelper
                                                                            .siteFeature5: site
                                                                            .feature5,
                                                                        DatabaseHelper
                                                                            .siteFeature6: site
                                                                            .feature6,
                                                                        DatabaseHelper
                                                                            .siteLogo: site
                                                                            .logo,
                                                                        DatabaseHelper
                                                                            .siteAddedDate: site
                                                                            .addedDate
                                                                            .toString(),
                                                                        DatabaseHelper
                                                                            .siteCons1: site
                                                                            .cons1,
                                                                        DatabaseHelper
                                                                            .siteCons2: site
                                                                            .cons2,
                                                                        DatabaseHelper
                                                                            .siteCons3: site
                                                                            .cons3,
                                                                        DatabaseHelper
                                                                            .siteCons4: site
                                                                            .cons4,
                                                                        DatabaseHelper
                                                                            .siteCons5: site
                                                                            .cons5,
                                                                        DatabaseHelper
                                                                            .siteCons6: site
                                                                            .cons6,
                                                                        DatabaseHelper
                                                                            .siteShortDescription: site
                                                                            .shortDescription,
                                                                        DatabaseHelper
                                                                            .siteLongDescrtiption: site
                                                                            .longDescription,
                                                                        DatabaseHelper
                                                                            .siteBonus: site
                                                                            .bonus,
                                                                        DatabaseHelper
                                                                            .siteBgImage: site
                                                                            .bgImage,
                                                                      }
                                                                  );
                                                                  print("Inserted");
                                                                }else{
                                                                  setState(() {
                                                                    bookmarks.removeWhere((element) => element.siteId==site.id);
                                                                  });
                                                                  int rowsEffected = await DatabaseHelper.instance.delete(int.parse(site.id));
                                                                  print("Deleted");
                                                                  print(rowsEffected);
                                                                }



                                                                // if(bookmarkList[index]==false) {
                                                                //   setState(() {
                                                                //     bookmarkList[index]=true;
                                                                //
                                                                //   });
                                                                //   print(bookmarkList[index]);
                                                                //   int i = await DatabaseHelper
                                                                //       .instance
                                                                //       .insert(
                                                                //       {
                                                                //         DatabaseHelper
                                                                //             .siteId: site
                                                                //             .id,
                                                                //         DatabaseHelper
                                                                //             .siteTitle: site
                                                                //             .title,
                                                                //         DatabaseHelper
                                                                //             .siteUrl: site
                                                                //             .url,
                                                                //         DatabaseHelper
                                                                //             .sitePromocode: site
                                                                //             .promocode,
                                                                //         DatabaseHelper
                                                                //             .siteRatings: site
                                                                //             .ratings,
                                                                //         DatabaseHelper
                                                                //             .siteFeature1: site
                                                                //             .feature1,
                                                                //         DatabaseHelper
                                                                //             .siteFeature2: site
                                                                //             .feature2,
                                                                //         DatabaseHelper
                                                                //             .siteFeature3: site
                                                                //             .feature3,
                                                                //         DatabaseHelper
                                                                //             .siteFeature4: site
                                                                //             .feature4,
                                                                //         DatabaseHelper
                                                                //             .siteFeature5: site
                                                                //             .feature5,
                                                                //         DatabaseHelper
                                                                //             .siteFeature6: site
                                                                //             .feature6,
                                                                //         DatabaseHelper
                                                                //             .siteLogo: site
                                                                //             .logo,
                                                                //         DatabaseHelper
                                                                //             .siteAddedDate: site
                                                                //             .addedDate
                                                                //             .toString(),
                                                                //         DatabaseHelper
                                                                //             .siteCons1: site
                                                                //             .cons1,
                                                                //         DatabaseHelper
                                                                //             .siteCons2: site
                                                                //             .cons2,
                                                                //         DatabaseHelper
                                                                //             .siteCons3: site
                                                                //             .cons3,
                                                                //         DatabaseHelper
                                                                //             .siteCons4: site
                                                                //             .cons4,
                                                                //         DatabaseHelper
                                                                //             .siteCons5: site
                                                                //             .cons5,
                                                                //         DatabaseHelper
                                                                //             .siteCons6: site
                                                                //             .cons6,
                                                                //         DatabaseHelper
                                                                //             .siteShortDescription: site
                                                                //             .shortDescription,
                                                                //         DatabaseHelper
                                                                //             .siteLongDescrtiption: site
                                                                //             .longDescription,
                                                                //         DatabaseHelper
                                                                //             .siteBonus: site
                                                                //             .bonus,
                                                                //         DatabaseHelper
                                                                //             .siteBgImage: site
                                                                //             .bgImage,
                                                                //       }
                                                                //
                                                                //   );
                                                                //   print("The inserted ID is $i");
                                                                //
                                                                //
                                                                // }
                                                                // else{
                                                                //   setState(() {
                                                                //     bookmarkList[index]=false;
                                                                //   });
                                                                //   print(bookmarkList[index]);
                                                                //   int rowsEffected = await DatabaseHelper.instance.delete(int.parse(site.id));
                                                                //   print(rowsEffected);
                                                                // }

                                                                // Navigator.pushReplacement(
                                                                //     context,
                                                                //     MaterialPageRoute(
                                                                //         builder: (BuildContext context) => super.widget));

                                                              },
                                                              child:
                                                              // bookmarkList[index]==false ?
                                                              // Visibility(
                                                              // visible: true,
                                                              //     child: Icon(FontAwesomeIcons.bookmark,color: Color(0xff57bbb4),))
                                                              //
                                                              //     :
                                                              Visibility(
                                                                  visible: true,
                                                                  child: Icon(
                                                                        (){

                                                                      print(bookmarks.indexWhere((element) => element.siteId==site.id));
                                                                      if(bookmarks.indexWhere((element) => element.siteId==site.id)!=-1){
                                                                        return FontAwesomeIcons.solidBookmark;
                                                                      }else{
                                                                        return FontAwesomeIcons.bookmark;
                                                                      }

                                                                    }()

                                                                    ,color: Color(0xff57bbb4),))






                                                          ),
                                                        ),
                                                        Image.network(
                                                          site.logo,
                                                          fit: BoxFit.contain,
                                                          width: width*0.20,
                                                          height: height*.48*.10,

                                                          loadingBuilder: (BuildContext context, Widget child,
                                                              ImageChunkEvent? loadingProgress) {
                                                            if (loadingProgress == null) return child;
                                                            return Center(
                                                              child: CircularProgressIndicator(
                                                                value: loadingProgress.expectedTotalBytes != null
                                                                    ? loadingProgress.cumulativeBytesLoaded /
                                                                    loadingProgress.expectedTotalBytes!
                                                                    : null,
                                                              ),
                                                            );
                                                          },
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                                    height: height*.5*.27,
                                                    child:
                                                    Text(site.shortDescription)
                                                    // Text("At the game? Just got a gut feeling?"
                                                    //     "No problem! Now you can bet from anywhere,"
                                                    //     "anytime with the all-new Xbet mobile betting")
                                                    ,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                                    height: height*.48*.097,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            Container(
                                                              alignment: Alignment.centerLeft,
                                                              color: Colors.white,
                                                              height: height*.05,
                                                              child: StarRating02(
                                                                size: 18,
                                                                rating: rating,
                                                                onRatingChanged: (rating) => setState(() {}),
                                                                color: Colors.transparent,
                                                              ),
                                                            ),
                                                            SizedBox(width: 5,),
                                                            Text(rating.toString(), style: TextStyle(fontSize: 16 , color: Colors.grey),),
                                                          ],
                                                        ),
                                                        Container(
                                                          alignment: Alignment.centerRight,
                                                          child: Container(
                                                              width: width*0.3,
                                                              decoration: BoxDecoration(
                                                                color: Color(0xff57bbb4),
                                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                              ),
                                                              alignment: Alignment.center,
                                                              child:  TextButton(
                                                                onPressed: (){
                                                                  Navigator.push(context, MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          BetDescriptionScreen(
                                                                              site.id,
                                                                              site.title,
                                                                              site.url,
                                                                              site.promocode,
                                                                              site.ratings,
                                                                              site.feature1,
                                                                              site.feature2,
                                                                              site.feature3,
                                                                              site.feature4,
                                                                              site.logo,
                                                                              site.addedDate,
                                                                              site.feature5,
                                                                              site.feature6,
                                                                              site.cons1,
                                                                              site.cons2,
                                                                              site.cons3,
                                                                              site.cons4,
                                                                              site.cons5,
                                                                              site.cons6,
                                                                              site.shortDescription,
                                                                              site.longDescription,
                                                                              site.bonus,
                                                                              site.bgImage)

                                                                  )
                                                                  );

                                                                },
                                                                child: FittedBox(
                                                                    fit: BoxFit.fitWidth,
                                                                    child: Text("Claim Bonus",style: TextStyle(color: Colors.white),)),
                                                              )
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        })
                                ),
                              ),
                            ],
                          ),

                        ]
                    ))
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }

  _filterDogList(String text) {
    if(text.isEmpty){
      setState(() {
        dogsBreedList = tempList;
      });
    }
    else{
      final List<Site> filteredBreeds = <Site>[];
      tempList.map((breed){
        if(breed.title.toLowerCase().contains(text.toString().toLowerCase())){
          filteredBreeds.add(breed);
        }
      }).toList();
      setState(() {
        dogsBreedList = filteredBreeds;
      });
    }
  }

  _fetchDogsBreed() async{
    setState(() {
      isLoading = true;
    });
    tempList = <Site>[];

    SiteServices.getUsers().then((sites){
      tempList = sites;

      setState(() {
        dogsBreedList = tempList;
        isLoading = false;
      });
    });


    List<Value> queryRows = await DatabaseHelper.instance.queryAll();
    dogbreedList = queryRows;


    //  print(tempList[0].feature3);

    // for(int i=0;i<7;i++){
    //   var contain = dogbreedList.where((element) => element.siteId == dogsBreedList[i].id);
    //   if(contain.isEmpty){
    //
    //   }else{
    //     setState(() {
    //       bookmarkList[i]=true;
    //     });
    //
    //   }
    // }
    //
    // print(bookmarkList);

  }







}