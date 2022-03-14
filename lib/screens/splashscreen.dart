import 'dart:async';

import 'package:basketballinsider/check_page.dart';
import 'package:basketballinsider/constants/names.dart';
import 'package:basketballinsider/models/football_all_para.dart';
import 'package:basketballinsider/services/status_service.dart';
import 'package:basketballinsider/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'cricket/cricket_all_para.dart';
import 'cricket_main.dart';
import 'cricket_main_canceled.dart';
import 'cricket_main_finished.dart';
import 'cricket_main_live.dart';
import 'football/football_main.dart';
import 'football/football_main_upcoimg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  int status = 0;
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


  getStatus()async{
    setState(() {
      status=0;
    });

    const url = 'https://api.ipify.org';
    final response = await http.get(Uri.parse(url));
    print("-----");
    print(response.body);
    print("------");
    String ip1 = response.body;
    String url1 = "https://new-onlineoffers.com/wp-json/wp/v2/get_match_id_by_ip?user_ip="+ip1;
    var response1 = await http.get(Uri.parse(url1));
    print(response1.body);
    String nullChecker = response1.body.toString().substring(27,31);
    if(nullChecker=="null"){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) =>
              HomeScreen()
          )
      );
    }else{
      Status ip = statusFromJson(response1.body);
      print(ip.data!.matchId);
      String matchId = ip.data!.matchId.toString();
      String matchType = ip.data!.matchType.toString();
      if(matchId=="-1"){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                HomeScreen()
            )
        );
      }else{
        var response22 = await http.get(Uri.parse("https://new-onlineoffers.com/wp-json/wp/v2/share_action?match_id=-1&matchType=Cricket"));

        if(matchType=="Football"){


          String url2 = "https://soccer.sportmonks.com/api/v2.0/fixtures/"+matchId+"?"
              "api_token="+tokenId+"&include=localTeam,visitorTeam,round,venue,league";

          var response2 = await http.get(Uri.parse(url2));
          debugPrint(response2.body);
          FootballFixtureAllPara fixtureAllPara = footballFixtureAllParaFromJson(response2.body);
          print(fixtureAllPara);


          if(fixtureAllPara.data!.time!.status=="NS"){
            var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(fixtureAllPara.data!.time!.startingAt!.dateTime.toString().substring(0,19), true);
            var dateLocal = dateTime.toLocal();
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>
                    FootballMainUpcoimgScreen(
                      fixtureAllPara.data!.id.toString(),
                      fixtureAllPara.data!.localTeam!.data!.logoPath,
                      fixtureAllPara.data!.localTeam!.data!.name,
                      fixtureAllPara.data!.visitorTeam!.data!.logoPath,
                      fixtureAllPara.data!.visitorTeam!.data!.name,
                      fixtureAllPara.data!.league!.data!.name,
                      fixtureAllPara.data!.time!.startingAt!.date.toString().substring(8,10)+ " " + monthsInYear1[int.parse(fixtureAllPara.data!.time!.startingAt!.date.toString().substring(5,7))].toString(),
                      // list11[index].date,
                      DateFormat('hh:mm a').format(dateLocal),// list11[index].time,
                      fixtureAllPara.data!.time!.startingAt!.timezone.toString(),
                      fixtureAllPara.data!.time!.status.toString(),
                      "F",
                      fixtureAllPara.data!.round!.data!.name.toString(),
                      fixtureAllPara.data!.venue!.data!.name.toString(),
                      fixtureAllPara.data!.venue!.data!.city.toString(),
                      fixtureAllPara.data!.venue!.data!.capacity.toString(),
                      fixtureAllPara.data!.venue!.data!.imagePath.toString(),
                      fixtureAllPara.data!.localteamId.toString(),
                      fixtureAllPara.data!.visitorteamId.toString(),
                    )
            ));
          }else{
            var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(fixtureAllPara.data!.time!.startingAt!.dateTime.toString().substring(0,19), true);
            var dateLocal = dateTime.toLocal();
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>
                    FootballMainScreen(
                      fixtureAllPara.data!.id.toString(),
                      fixtureAllPara.data!.localTeam!.data!.logoPath,
                      fixtureAllPara.data!.localTeam!.data!.name,
                      fixtureAllPara.data!.visitorTeam!.data!.logoPath,
                      fixtureAllPara.data!.visitorTeam!.data!.name,
                      fixtureAllPara.data!.league!.data!.name,
                      fixtureAllPara.data!.time!.startingAt!.date.toString().substring(8,10)+ " " + monthsInYear1[int.parse(fixtureAllPara.data!.time!.startingAt!.date.toString().substring(5,7))].toString(),
                      // list11[index].date,
                      DateFormat('hh:mm a').format(dateLocal),// list11[index].time,
                      fixtureAllPara.data!.time!.startingAt!.timezone.toString(),
                      fixtureAllPara.data!.time!.status.toString(),
                      "F",
                      fixtureAllPara.data!.round!.data!.name.toString(),
                      fixtureAllPara.data!.venue!.data!.name.toString(),
                      fixtureAllPara.data!.venue!.data!.city.toString(),
                      fixtureAllPara.data!.venue!.data!.capacity.toString(),
                      fixtureAllPara.data!.venue!.data!.imagePath.toString(),
                      fixtureAllPara.data!.localteamId.toString(),
                      fixtureAllPara.data!.visitorteamId.toString(),
                    )
            ));
          }





        }
        else if(matchType=="Cricket"){

          String url2 = "https://cricket.sportmonks.com/api/v2.0/fixtures/"+matchId+"?"
              "api_token="+tokenId+"&include=localteam,visitorteam,venue,league";

          var response2 = await http.get(Uri.parse(url2));
          debugPrint(response2.body);
          CricketFixtureAllPara fixtureAllPara = cricketFixtureAllParaFromJson(response2.body);
          print(fixtureAllPara);

          // fixturesByDateRangeCricket.data![i].startingAt.toString().substring(0,19)
          var dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(fixtureAllPara.data!.startingAt.toString().substring(0,19), true);
          var dateLocal = dateTime.toLocal();
          if(fixtureAllPara.data!.status=="Upcoming"){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>
                    CrickerMainScreen(
                      fixtureAllPara.data!.id.toString(),
                      fixtureAllPara.data!.localteam!.imagePath.toString(),
                      fixtureAllPara.data!.localteam!.name.toString(),
                      fixtureAllPara.data!.visitorteam!.imagePath.toString(),
                      fixtureAllPara.data!.visitorteam!.name.toString(),
                      fixtureAllPara.data!.league!.name.toString(),
                      fixtureAllPara.data!.startingAt.toString().substring(0,10)+ " " + monthsInYear1[int.parse(fixtureAllPara.data!.startingAt.toString().substring(5,7))].toString(),
                      // list11[index].date,
                      DateFormat('hh:mm a').format(dateLocal),// list11[index].time,
                      "",
                      fixtureAllPara.data!.status.toString(),
                      "C",
                      "",
                      fixtureAllPara.data!.venue!.name.toString(),
                      fixtureAllPara.data!.venue!.city.toString(),
                      fixtureAllPara.data!.venue!.capacity.toString(),
                      fixtureAllPara.data!.venue!.imagePath.toString(),
                      fixtureAllPara.data!.localteamId.toString(),
                      fixtureAllPara.data!.visitorteamId.toString(),
                    )
            ));

          }else if(fixtureAllPara.data!.status=="Finished" ){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>
                    CrickerMainFinishedScreen(
                      fixtureAllPara.data!.id.toString(),
                      fixtureAllPara.data!.localteam!.imagePath.toString(),
                      fixtureAllPara.data!.localteam!.name.toString(),
                      fixtureAllPara.data!.visitorteam!.imagePath.toString(),
                      fixtureAllPara.data!.visitorteam!.name.toString(),
                      fixtureAllPara.data!.league!.name.toString(),
                      fixtureAllPara.data!.startingAt.toString().substring(0,10)+ " " + monthsInYear1[int.parse(fixtureAllPara.data!.startingAt.toString().substring(5,7))].toString(),
                      // list11[index].date,
                      DateFormat('hh:mm a').format(dateLocal),// list11[index].time,
                      "",
                      fixtureAllPara.data!.status.toString(),
                      "C",
                      "",
                      fixtureAllPara.data!.venue!.name.toString(),
                      fixtureAllPara.data!.venue!.city.toString(),
                      fixtureAllPara.data!.venue!.capacity.toString(),
                      fixtureAllPara.data!.venue!.imagePath.toString(),
                      fixtureAllPara.data!.localteamId.toString(),
                      fixtureAllPara.data!.visitorteamId.toString(),

                    )
            ));
          }else if(fixtureAllPara.data!.status=="Cancl."){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>
                    CrickerMainCanceledScreen(
                      fixtureAllPara.data!.id.toString(),
                      fixtureAllPara.data!.localteam!.imagePath.toString(),
                      fixtureAllPara.data!.localteam!.name.toString(),
                      fixtureAllPara.data!.visitorteam!.imagePath.toString(),
                      fixtureAllPara.data!.visitorteam!.name.toString(),
                      fixtureAllPara.data!.league!.name.toString(),
                      fixtureAllPara.data!.startingAt.toString().substring(0,10)+ " " + monthsInYear1[int.parse(fixtureAllPara.data!.startingAt.toString().substring(5,7))].toString(),
                      // list11[index].date,
                      DateFormat('hh:mm a').format(dateLocal),// list11[index].time,
                      "",
                      fixtureAllPara.data!.status.toString(),
                      "C",
                      "",
                      fixtureAllPara.data!.venue!.name.toString(),
                      fixtureAllPara.data!.venue!.city.toString(),
                      fixtureAllPara.data!.venue!.capacity.toString(),
                      fixtureAllPara.data!.venue!.imagePath.toString(),
                      fixtureAllPara.data!.localteamId.toString(),
                      fixtureAllPara.data!.visitorteamId.toString(),

                    )
            ));

          }
          else{
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>
                    CrickerMainLiveScreen(
                      fixtureAllPara.data!.id.toString(),
                      fixtureAllPara.data!.localteam!.imagePath.toString(),
                      fixtureAllPara.data!.localteam!.name.toString(),
                      fixtureAllPara.data!.visitorteam!.imagePath.toString(),
                      fixtureAllPara.data!.visitorteam!.name.toString(),
                      fixtureAllPara.data!.league!.name.toString(),
                      fixtureAllPara.data!.startingAt.toString().substring(0,10)+ " " + monthsInYear1[int.parse(fixtureAllPara.data!.startingAt.toString().substring(5,7))].toString(),
                      // list11[index].date,
                      DateFormat('hh:mm a').format(dateLocal),// list11[index].time,
                      "",
                      fixtureAllPara.data!.status.toString(),
                      "C",
                      "",
                      fixtureAllPara.data!.venue!.name.toString(),
                      fixtureAllPara.data!.venue!.city.toString(),
                      fixtureAllPara.data!.venue!.capacity.toString(),
                      fixtureAllPara.data!.venue!.imagePath.toString(),
                      fixtureAllPara.data!.localteamId.toString(),
                      fixtureAllPara.data!.visitorteamId.toString(),



                    )
            ));

          }






        }

      }













    }


    
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getStatus();






    // Timer(Duration(milliseconds: 1600),
    //         ()=>Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder:
    //             (context) =>
    //             HomeScreen()
    //         )
    //     )
    // );
  }

  @override
  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double barheight =AppBar().preferredSize.height;
    double height = height1;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [
          //     Color(0xFF03185A),
          //     Color(0xFF003900),
          //   ],
          //   begin: FractionalOffset(0.0, 0.0),
          //   end: FractionalOffset(0.0, 1.0),
          // )
        image: DecorationImage(
        image: AssetImage(
        'graphic_res/design_3_assets/3/Overlay.png'),
    fit: BoxFit.fill,
        ),
        ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: width-100,right: width/2),
              alignment: Alignment.center,
              child: Container(
                height: height*0.2,
                width: height*0.2,
                decoration: BoxDecoration(
                    color: Color(0xff57bbb4),
                    shape: BoxShape.circle
                ),
              ),
            ),


            Container(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffd1f3f3),
                  shape: BoxShape.circle
                ),
              ),
            ),


            Container(
              height: height,
              width: width,
              child: Image.asset("graphic_res/Asset 1.png",scale: 2,),
            ),
            Container(
              height: height,
              width: width,
              alignment: Alignment.center,
               margin: EdgeInsets.only(top: width-100),

              child: Container(child: CircularProgressIndicator()),
            ),
          ],
        ),

      ),
    );
  }
}

