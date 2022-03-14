import 'package:basketballinsider/models/fixture_by_id_cricket.dart' as v2;
import 'package:basketballinsider/models/head_to_head_football.dart' as v1;
import 'package:basketballinsider/models/leage_by_id_cricket.dart';
import 'package:basketballinsider/models/leage_by_id_football.dart';
import 'package:basketballinsider/models/round_by_id_football.dart';
import 'package:basketballinsider/models/team_by_id_cricket.dart';
import 'package:basketballinsider/models/team_by_id_football.dart';
import 'package:basketballinsider/models/venue_id_football.dart';
import 'package:basketballinsider/screens/previous_match_data_football.dart';
import 'package:basketballinsider/services/get_fixture_by_id_cricket.dart';
import 'package:basketballinsider/services/get_fixture_by_id_football.dart';
import 'package:basketballinsider/services/get_leage_by_id_cricket.dart';
import 'package:basketballinsider/services/get_leage_by_id_football.dart';
import 'package:basketballinsider/services/get_round_by_id_football.dart';
import 'package:basketballinsider/services/get_team_by_id_cricket.dart';
import 'package:basketballinsider/services/get_team_by_id_football.dart';
import 'package:basketballinsider/services/get_venue_by_id_football.dart';
import 'package:basketballinsider/services/head_to_head_football_service.dart';
import 'package:flutter/material.dart';
import 'package:basketballinsider/models/fixture_by_id_football.dart' as v1;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FixtureMatchDataCricketFinishedScreen extends StatefulWidget {
  //const PreviousMatchDataFootballScreen({Key? key}) : super(key: key);
  late int id;
  FixtureMatchDataCricketFinishedScreen(this.id);
  @override
  _FixtureMatchDataCricketFinishedScreenState createState() => _FixtureMatchDataCricketFinishedScreenState();
}

class _FixtureMatchDataCricketFinishedScreenState extends State<FixtureMatchDataCricketFinishedScreen> {

  late int Id;
  late v2.FixtureByIdCricket fixturesByIdCricket;

  bool isLoading = false;
  bool isLoading1 = true;
  bool isLoading2 = true;
  bool isLoading3 = true;
  bool isLoading4 = true;
  bool isLoading5 = true;
  bool isLoading6 = true;
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

  int win1 = 0;
  int draw = 0;
  int win2 = 0;
  Map<int,String> monthsInYear = {
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

  late GetLeagueByIdCricket leage;
  late GetTeamByIdCricket teamByIdFootball;
  late GetTeamByIdCricket oppositeteamByIdFootball1;
  // late VenueByIdFootball venueByIdFootball;
  late RoundByIdFootball roundByIdFootball;
 // late v1.HeadToHeadFootball headToHeadFootball;

  getFixtureById() async{
    setState(() {
      isLoading = true;
    });
    print(widget.id.toString());
    GetFixtureByIdCricketService.getUsers(widget.id.toString()).then((sites){
      print(sites);
      if(sites!=null) {
        setState(() {
          print("dd");
          fixturesByIdCricket = sites;
          print("scores ==  "+fixturesByIdCricket.data!.id.toString());
          getLeagebyId(
              fixturesByIdCricket.data!.leagueId.toString());
          getTeambyId(
              fixturesByIdCricket.data!.localteamId.toString());
          getOppositeTeambyId(
              fixturesByIdCricket.data!.visitorteamId.toString());
         //  getVenueById(fixturesByIdCricket.data!.venueId.toString());
          // getRoundById(fixturesByIdCricket.data!.roundId.toString());
          // getHeadtoHeadData(
          //     fixturesByIdCricket.data!.localteamId.toString(),
          //     fixturesByIdCricket.data!.visitorteamId.toString());

          isLoading = false;
        });
      }
    });
  }

  getLeagebyId(String Id) async{
    setState(() {
      isLoading1 = true;
    });
    GetLeageByIdCricketServices.getUsers(Id).then((sites){
      setState(() {
        leage = sites!;
        isLoading1 = false;
      });
    });
  }
  getTeambyId(String Id) async{
    setState(() {
      isLoading2 = true;
    });
    GetTeamByIdCricketService.getUsers(Id).then((sites){
      setState(() {
        teamByIdFootball = sites!;
        isLoading2 = false;
      });
    });
  }

  getOppositeTeambyId(String Id) async{
    setState(() {
      isLoading3 = true;
    });
    GetTeamByIdCricketService.getUsers(Id).then((sites){
      setState(() {
        oppositeteamByIdFootball1 = sites!;
        isLoading3 = false;
      });
    });
  }







  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFixtureById();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //getFixtureById();
  }

  @override
  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double barheight =AppBar().preferredSize.height;
    double height = height1-safe;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(FontAwesomeIcons.arrowLeft),
          color: Colors.black,),
        backgroundColor: Colors.white,
        title: Text("Finished Match",style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'graphic_res/design_3_assets/3/Overlay.png'
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      Container(
                        height: height*0.08,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(isLoading1==false ?
                            leage.data!.name!
                            // teamByIdFootball.data.name
                                :
                            "Loading..."
                              ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        height: height*0.15,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    height: height*0.1,
                                    width:  height*0.1,
                                    child:
                                    isLoading2==false?
                                    Image.network(
                                      teamByIdFootball.data!.imagePath!,
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
                                    )
                                        :
                                    Container()
                                  // Image.asset('graphic_res/India.png',fit: BoxFit.cover,),
                                ),//TODO put image here
                                Text(isLoading2==false? teamByIdFootball.data!.name! :"Loading...",style: TextStyle(color: Colors.white)),

                              ],
                            ),
                            Container(
                                height: height*0.15,
                                alignment: Alignment.center,
                                child: Text("Vs",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: height*0.1,
                                  width:  height*0.1,
                                  child:
                                  isLoading3==false?
                                  Image.network(
                                    oppositeteamByIdFootball1.data!.imagePath!,
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
                                  )
                                      : Container(),
                                  // Image.asset('graphic_res/england.png',fit: BoxFit.cover,)
                                ),//TODO put image here
                                Text(isLoading3==false? oppositeteamByIdFootball1.data!.name! :"Loading...",style: TextStyle(color: Colors.white)),
                              ],
                            ),

                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        // margin: EdgeInsets.only(left: 40,top: 10,right: 40),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Started At : ",style: TextStyle(color: Colors.white,fontSize: 20),),

                            isLoading==false?
                            Text(
                              fixturesByIdCricket.data!.startingAt!.hour >12 ?
                              (fixturesByIdCricket.data!.startingAt!.hour-12).toString() + " PM, "
                                  :
                              fixturesByIdCricket.data!.startingAt!.hour==12?
                              (fixturesByIdCricket.data!.startingAt!.hour).toString() + " PM, "
                                  :
                              (fixturesByIdCricket.data!.startingAt!.hour).toString() + " AM, "
                              ,style: TextStyle(color: Colors.white,fontSize: 20),
                            )
                                : Text("")
                            ,
                            isLoading==false?
                            Text(isLoading == false ?
                            fixturesByIdCricket.data!.startingAt!.day.toString()+ " "+
                                monthsInYear1[fixturesByIdCricket.data!.startingAt!.month]!
                                : "",style: TextStyle(color: Colors.white,fontSize: 20),)
                                : Text("")
                            ,






                          ],
                        ),
                      ),
                      Container(
                        child: Text(
                          isLoading1==false ?
                        ""
                          // fixturesByIdCricket.data!.batting![0].toString()
                          :""

                          ,style: TextStyle(color: Colors.white),),
                      )

                    ],
                  ),
                ]
            ))
          ],
        ),

      ),


    );
  }
}
