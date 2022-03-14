import 'package:basketballinsider/models/head_to_head_football.dart' as v1;
import 'package:basketballinsider/models/leage_by_id_football.dart';
import 'package:basketballinsider/models/round_by_id_football.dart';
import 'package:basketballinsider/models/team_by_id_football.dart';
import 'package:basketballinsider/models/team_with_squad_by_id_football.dart';
import 'package:basketballinsider/models/venue_id_football.dart';
import 'package:basketballinsider/screens/player_details_football.dart';
import 'package:basketballinsider/screens/previous_match_data_football.dart';
import 'package:basketballinsider/services/get_fixture_by_id_football.dart';
import 'package:basketballinsider/services/get_leage_by_id_football.dart';
import 'package:basketballinsider/services/get_round_by_id_football.dart';
import 'package:basketballinsider/services/get_team_by_id_football.dart';
import 'package:basketballinsider/services/get_team_squad_by_id_football.dart';
import 'package:basketballinsider/services/get_venue_by_id_football.dart';
import 'package:basketballinsider/services/head_to_head_football_service.dart';
import 'package:flutter/material.dart';
import 'package:basketballinsider/models/fixture_by_id_football.dart' as v1;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FixtureMatchDataFootballLiveScreen extends StatefulWidget {
  //const PreviousMatchDataFootballScreen({Key? key}) : super(key: key);
  late int id;
  FixtureMatchDataFootballLiveScreen(this.id);
  @override
  _FixtureMatchDataFootballLiveScreenState createState() => _FixtureMatchDataFootballLiveScreenState();
}

class _FixtureMatchDataFootballLiveScreenState extends State<FixtureMatchDataFootballLiveScreen> {

  late int Id;
  late v1.FixturesByIdFootball fixturesByIdFootball;

  bool isLoading = false;
  bool isLoading1 = true;
  bool isLoading2 = true;
  bool isLoading3 = true;
  bool isLoading4 = true;
  bool isLoading5 = true;
  bool isLoading6 = true;

  bool data1 = true;

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

  late Leage leage;
  late TeamWithSquadByIdFootball teamByIdFootball;
  late TeamWithSquadByIdFootball oppositeteamByIdFootball1;
  late VenueByIdFootball venueByIdFootball;
  late RoundByIdFootball roundByIdFootball;
  late v1.HeadToHeadFootball headToHeadFootball;



  getFixtureById() async{
    setState(() {
      isLoading = true;
    });
    print(widget.id.toString());
    GetFixtureByIdFootballService.getUsers(widget.id.toString()).then((sites){
      print(sites);
      if(sites!=null) {
        setState(() {
          print("dd");
          fixturesByIdFootball = sites;
          print("scores ==  "+fixturesByIdFootball.data!.id.toString());
          getLeagebyId(
              fixturesByIdFootball.data!.leagueId.toString());
          getTeambyId(
              fixturesByIdFootball.data!.localteamId.toString());
          getOppositeTeambyId(
              fixturesByIdFootball.data!.visitorteamId.toString());
          getVenueById(fixturesByIdFootball.data!.venueId.toString());
          getRoundById(fixturesByIdFootball.data!.roundId.toString());
          getHeadtoHeadData(
              fixturesByIdFootball.data!.localteamId.toString(),
              fixturesByIdFootball.data!.visitorteamId.toString());

          isLoading = false;
        });
      }
    });
  }

  getLeagebyId(String Id) async{
    setState(() {
      isLoading1 = true;
    });
    GetLeageByIdServices.getUsers(Id).then((sites){
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
    GetTeamSquadByIdFootvball.getUsers(Id).then((sites){
      setState(() {
        teamByIdFootball = sites!;
        print(teamByIdFootball.data!.squad!.data!.length);
        isLoading2 = false;
      });
    });
  }

  getOppositeTeambyId(String Id) async{
    setState(() {
      isLoading3 = true;
    });
    GetTeamSquadByIdFootvball.getUsers(Id).then((sites){
      setState(() {
        oppositeteamByIdFootball1 = sites!;
        isLoading3 = false;
      });
    });
  }

  getVenueById(String Id) async{
    setState(() {
      isLoading4 = true;
    });
    GetVenueByIdServices.getUsers(Id).then((sites){
      setState(() {
        venueByIdFootball = sites!;
        isLoading4 = false;
      });
    });
  }


  getRoundById(String Id) async{
    setState(() {
      isLoading6 = true;
    });
    GetRoundByIdFootballService.getUsers(Id).then((sites){
      setState(() {
        roundByIdFootball = sites!;
        isLoading6 = false;
      });
    });
  }

  getHeadtoHeadData(String Id1,String Id2) async{
    setState(() {
      isLoading5 = true;
    });
    HeadToHeadFootballService.getUsers(Id1,Id2).then((sites){
      print(sites);
      setState(() {
        if(sites!=null) {
          data1 = true;
          headToHeadFootball = sites;
          if (headToHeadFootball.data?.length != 0) {
            isLoading5 = false;
            for (int i = 0; i < headToHeadFootball.data!.length; i++) {
              print(headToHeadFootball.data![i].id.toString());

              // print(headToHeadFootball.data!.length.toString());
              if (headToHeadFootball.data![i].winnerTeamId.toString() == Id1) {
                setState(() {
                  win1 = win1 + 1;
                  // print(win1);
                });
              } else
              if (headToHeadFootball.data![i].winnerTeamId.toString() == Id2) {
                setState(() {
                  win2 = win2 + 1;
                });
              }
            }
            setState(() {
              draw = headToHeadFootball.data!.length - win1 - win2;
            });
          }else{

          }
        }else{
          setState(() {
            data1=false;
          });
        }
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
        title: Text("Live Match",style: TextStyle(color: Colors.black),),
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
                                      teamByIdFootball.data!.logoPath.toString(),
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
                                    oppositeteamByIdFootball1.data!.logoPath!,
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
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: height*0.08,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(isLoading1==false ?
                            leage.data.name
                            // teamByIdFootball.data.name
                                :
                            "Loading..."
                              ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
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
                              int.parse(fixturesByIdFootball.data!.time!.startingAt!.time!.substring(0,2)) > 12 ?
                              (int.parse(fixturesByIdFootball.data!.time!.startingAt!.time!.substring(0,2))-12).toString() + " PM, "
                                  :
                              int.parse(fixturesByIdFootball.data!.time!.startingAt!.time!.substring(0,2))==12?
                              (int.parse(fixturesByIdFootball.data!.time!.startingAt!.time!.substring(0,2))).toString() + " PM, "
                                  :
                              fixturesByIdFootball.data!.time!.startingAt!.time!.substring(0,2) + " AM, "
                              ,style: TextStyle(color: Colors.white,fontSize: 20),
                            )
                                : Text("")
                            ,
                            isLoading==false?
                            Text(isLoading == false ?
                            fixturesByIdFootball.data!.time!.startingAt!.date!.day.toString()+" "+
                                monthsInYear[fixturesByIdFootball.data!.time!.startingAt!.date!.month]!
                                : "",style: TextStyle(color: Colors.white,fontSize: 20),)
                                : Text("")
                            ,






                          ],
                        ),
                      ),

                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 20,top: 10,right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Match Details ",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ],
                        ),
                      ),

                      // Container(
                      //   alignment: Alignment.topLeft,
                      //   margin: EdgeInsets.only(left: 80,top: 10,right: 80),
                      //   child:
                      //   Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text( isLoading==false ?
                      //       fixturesByIdFootball.data!.scores!.localteamScore.toString() : "Loading..."
                      //         ,style: TextStyle(color: Colors.white,fontSize: 20),),
                      //       Text("Score",style: TextStyle(color: Colors.white,fontSize: 20),),
                      //       Text(
                      //         isLoading==false ?
                      //         fixturesByIdFootball.data!.scores!.visitorteamScore.toString()
                      //             : ""
                      //         ,style: TextStyle(color: Colors.white,fontSize: 20),),
                      //
                      //     ],
                      //   ),
                      // ),

                      isLoading2==false && isLoading2==false?
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(teamByIdFootball.data!.name!+" Squad",style: TextStyle(color: Colors.white),),
                      ):Container(),
                      isLoading2==false?
                      Container(
                        height: 100,
                        width: width,
                        child:
                        ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: teamByIdFootball.data!.squad!.data!.length,
                            itemBuilder: (context,index){
                              return
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => PlayerDetailsFootball(
                                          teamByIdFootball.data!.squad!.data![index].playerId.toString(),
                                          teamByIdFootball.data!.squad!.data![index].positionId.toString(),
                                          teamByIdFootball.data!.squad!.data![index].number.toString(),
                                          teamByIdFootball.data!.squad!.data![index].captain.toString(),
                                          teamByIdFootball.data!.squad!.data![index].injured.toString(),
                                          teamByIdFootball.data!.squad!.data![index].minutes.toString(),
                                          teamByIdFootball.data!.squad!.data![index].appearences.toString(),
                                          teamByIdFootball.data!.squad!.data![index].lineups.toString(),
                                          teamByIdFootball.data!.squad!.data![index].substituteIn.toString(),
                                          teamByIdFootball.data!.squad!.data![index].substituteOut.toString(),
                                          teamByIdFootball.data!.squad!.data![index].substitutesOnBench.toString(),
                                          teamByIdFootball.data!.squad!.data![index].goals.toString(),
                                          teamByIdFootball.data!.squad!.data![index].owngoals.toString(),
                                          teamByIdFootball.data!.squad!.data![index].assists.toString(),
                                          teamByIdFootball.data!.squad!.data![index].saves.toString(),
                                          teamByIdFootball.data!.squad!.data![index].insideBoxSaves.toString(),
                                          teamByIdFootball.data!.squad!.data![index].dispossesed.toString(),
                                          teamByIdFootball.data!.squad!.data![index].interceptions.toString(),
                                          teamByIdFootball.data!.squad!.data![index].yellowcards.toString(),
                                          teamByIdFootball.data!.squad!.data![index].yellowred.toString(),
                                          teamByIdFootball.data!.squad!.data![index].redcards.toString(),
                                          teamByIdFootball.data!.squad!.data![index].tackles.toString(),
                                          teamByIdFootball.data!.squad!.data![index].blocks.toString(),
                                          teamByIdFootball.data!.squad!.data![index].hitPost.toString(),
                                          teamByIdFootball.data!.squad!.data![index].cleansheets.toString(),
                                          teamByIdFootball.data!.squad!.data![index].rating.toString(),
                                          teamByIdFootball.data!.squad!.data![index].crosses!.total.toString(),
                                          teamByIdFootball.data!.squad!.data![index].crosses!.accurate.toString(),
                                          teamByIdFootball.data!.squad!.data![index].dribbles!.attempts.toString(),
                                          teamByIdFootball.data!.squad!.data![index].dribbles!.success.toString(),
                                          teamByIdFootball.data!.squad!.data![index].dribbles!.dribbledPast.toString(),
                                          teamByIdFootball.data!.squad!.data![index].duels!.won.toString(),
                                          teamByIdFootball.data!.squad!.data![index].fouls!.committed.toString(),
                                          teamByIdFootball.data!.squad!.data![index].fouls!.drawn.toString(),
                                          teamByIdFootball.data!.squad!.data![index].passes!.total.toString(),
                                          teamByIdFootball.data!.squad!.data![index].passes!.accuracy.toString(),
                                          teamByIdFootball.data!.squad!.data![index].passes!.keyPasses.toString(),
                                          teamByIdFootball.data!.squad!.data![index].penalties!.won.toString(),
                                          teamByIdFootball.data!.squad!.data![index].penalties!.scores.toString(),
                                          teamByIdFootball.data!.squad!.data![index].penalties!.missed.toString(),
                                          teamByIdFootball.data!.squad!.data![index].penalties!.committed.toString(),
                                          teamByIdFootball.data!.squad!.data![index].penalties!.saves.toString(),
                                          teamByIdFootball.data!.squad!.data![index].player!.data!.countryId.toString(),
                                          teamByIdFootball.data!.squad!.data![index].player!.data!.commonName.toString(),
                                          teamByIdFootball.data!.squad!.data![index].player!.data!.displayName.toString(),
                                          teamByIdFootball.data!.squad!.data![index].player!.data!.fullname.toString(),
                                          teamByIdFootball.data!.squad!.data![index].player!.data!.firstname.toString(),
                                          teamByIdFootball.data!.squad!.data![index].player!.data!.lastname.toString(),
                                          teamByIdFootball.data!.squad!.data![index].player!.data!.nationality.toString(),
                                          teamByIdFootball.data!.squad!.data![index].player!.data!.birthdate.toString(),
                                          teamByIdFootball.data!.squad!.data![index].player!.data!.birthcountry.toString(),
                                          teamByIdFootball.data!.squad!.data![index].player!.data!.birthplace.toString(),
                                          teamByIdFootball.data!.squad!.data![index].player!.data!.height.toString(),
                                          teamByIdFootball.data!.squad!.data![index].player!.data!.weight.toString(),
                                          teamByIdFootball.data!.squad!.data![index].player!.data!.imagePath.toString(),
                                          teamByIdFootball.data!.squad!.data![index].shots!.shotsTotal.toString(),
                                          teamByIdFootball.data!.squad!.data![index].shots!.shotsOnTarget.toString(),
                                          teamByIdFootball.data!.squad!.data![index].shots!.shotsOffTarget.toString(),
                                        )
                                    )
                                    );
                                  },

                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                    height: 120,
                                    width: 280,
                                    decoration: BoxDecoration(
                                        color: Colors.white24,
                                        borderRadius: BorderRadius.all(Radius.circular(20))

                                    ),
                                    child:
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 120,
                                          width: 100,
                                          child:
                                          teamByIdFootball.data!.squad!.data![index].player!.data!.imagePath.toString().contains("png")?
                                          Image.network(
                                            teamByIdFootball.data!.squad!.data![index].player!.data!.imagePath.toString()
                                            // squadByTeamidSeasonIdCricket.data!.squad![index].imagePath.toString():
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
                                              :
                                          Image.asset('graphic_res/user_.jpeg')
                                          ,
                                        ),
                                        Flexible(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Flexible(child: Text(teamByIdFootball.data!.squad!.data![index].player!.data!.displayName.toString()+
                                                  " "
                                                ,style: TextStyle(color: Colors.white),)),
                                              Flexible(child: Text(
                                                teamByIdFootball.data!.squad!.data![index].captain.toString()=="0"?
                                                "":"(c)"
                                                ,style: TextStyle(color: Colors.white),))

                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                    ,
                                  ),
                                )
                              ;
                            })


                        ,
                      ):Container(),
                      isLoading3==false && isLoading3==false?
                      Container(
                        margin: EdgeInsets.all(10),

                        child: Text(oppositeteamByIdFootball1.data!.name!+" Squad",style: TextStyle(color: Colors.white),),
                      ):Container(),
                      isLoading3==false?
                      Container(
                          height: 100,
                          width: width,
                          child:
                          ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: oppositeteamByIdFootball1.data!.squad!.data!.length,
                              itemBuilder: (context,index){
                                return
                                  InkWell(

                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => PlayerDetailsFootball(
                                            oppositeteamByIdFootball1.data!.squad!.data![index].playerId.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].positionId.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].number.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].captain.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].injured.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].minutes.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].appearences.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].lineups.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].substituteIn.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].substituteOut.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].substitutesOnBench.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].goals.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].owngoals.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].assists.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].saves.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].insideBoxSaves.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].dispossesed.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].interceptions.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].yellowcards.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].yellowred.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].redcards.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].tackles.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].blocks.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].hitPost.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].cleansheets.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].rating.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].crosses!.total.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].crosses!.accurate.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].dribbles!.attempts.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].dribbles!.success.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].dribbles!.dribbledPast.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].duels!.won.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].fouls!.committed.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].fouls!.drawn.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].passes!.total.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].passes!.accuracy.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].passes!.keyPasses.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].penalties!.won.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].penalties!.scores.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].penalties!.missed.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].penalties!.committed.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].penalties!.saves.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].player!.data!.countryId.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].player!.data!.commonName.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].player!.data!.displayName.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].player!.data!.fullname.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].player!.data!.firstname.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].player!.data!.lastname.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].player!.data!.nationality.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].player!.data!.birthdate.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].player!.data!.birthcountry.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].player!.data!.birthplace.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].player!.data!.height.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].player!.data!.weight.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].player!.data!.imagePath.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].shots!.shotsTotal.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].shots!.shotsOnTarget.toString(),
                                            oppositeteamByIdFootball1.data!.squad!.data![index].shots!.shotsOffTarget.toString(),
                                          )
                                      )
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                      height: 120,
                                      width: 280,
                                      decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius: BorderRadius.all(Radius.circular(20))

                                      ),
                                      child:
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 120,
                                            width: 100,
                                            child:
                                            oppositeteamByIdFootball1.data!.squad!.data![index].player!.data!.imagePath.toString().contains("png")?
                                            Image.network(
                                              oppositeteamByIdFootball1.data!.squad!.data![index].player!.data!.imagePath.toString()
                                              // squadByTeamidSeasonIdCricket.data!.squad![index].imagePath.toString():
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
                                                :
                                            Image.asset('graphic_res/user_.jpeg')
                                            ,
                                          ),
                                          Flexible(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Flexible(child: Text(oppositeteamByIdFootball1.data!.squad!.data![index].player!.data!.displayName.toString(),style: TextStyle(color: Colors.white),)),
                                                Flexible(child:
                                                Text(
                                                  teamByIdFootball.data!.squad!.data![index].captain.toString()=="0"?
                                                  "":"(c)"
                                                  //oppositeteamByIdFootball1.data!.squad!.data![index].rating.toString()
                                                  ,style: TextStyle(color: Colors.white),))

                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                      ,
                                    ),
                                  )
                                ;
                              })
                      ):Container(),









                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 80,top: 10,right: 80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              isLoading==false ?
                              fixturesByIdFootball.data!.standings!.localteamPosition.toString() : '',style: TextStyle(color: Colors.white,fontSize: 20),),
                            Text("Standings",style: TextStyle(color: Colors.white,fontSize: 20),),
                            Text(isLoading==false ?
                            fixturesByIdFootball.data!.standings!.visitorteamPosition.toString() : '',style: TextStyle(color: Colors.white,fontSize: 20),),

                          ],
                        ),
                      ),


                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 20,top: 10,right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Head to Head ",style: TextStyle(color: Colors.white,fontSize: 20),),
                            Text(
                              data1==false?
                              "-"
                                  :
                              isLoading5==false ?
                              headToHeadFootball.data!.length.toString() + ' Matches' :

                              "Loading..."
                              ,style: TextStyle(color: Colors.white,fontSize: 20),),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 20,top: 10,right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Round ",style: TextStyle(color: Colors.white,fontSize: 20),),
                            Text(isLoading6 == false ? roundByIdFootball.data.name.toString() : "",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 20,top: 10,right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Venue  "
                              ,style: TextStyle(color: Colors.white,fontSize: 20),),
                            Text(isLoading4==false?venueByIdFootball.data.name:"Loading...",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 20,top: 10,right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "City  "
                              ,style: TextStyle(color: Colors.white,fontSize: 20),),
                            Text(isLoading4==false?venueByIdFootball.data.city:"Loading...",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 20,top: 10,right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Capacity  "
                              ,style: TextStyle(color: Colors.white,fontSize: 20),),
                            Text(isLoading4==false?venueByIdFootball.data.capacity.toString():"Loading...",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ],
                        ),
                      ),


                      isLoading4==false?
                      Container(
                        height: height*0.4,
                        width: width,
                        child: Image.network(
                          venueByIdFootball.data.imagePath.toString()
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
                        ),
                      )
                          :Container()
                      ,
                      Container(height: 0,),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        height:
                        data1==false?
                        200:
                        height*0.73
                        ,
                        color: Color(0xff57bbb4),
                        child: Column(
                          children: [
                            Text("Head to Head",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),
                            Container(

                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: height*0.1,
                                      width:  height*0.1,
                                      child:
                                      isLoading2==false?
                                      Image.network(
                                        teamByIdFootball.data!.logoPath!,
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
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: height*0.1,
                                        child:
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(win1.toString(),style: TextStyle(color: Colors.white,fontSize: 18),),
                                            Text("Wins",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: height*0.1,
                                        child:
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(draw.toString(),style: TextStyle(color: Colors.white,fontSize: 18),),
                                            Text("Draw",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: height*0.1,
                                        child:
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(win2.toString(),style: TextStyle(color: Colors.white,fontSize: 18),),
                                            Text("Wins",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                  Container(
                                      height: height*0.1,
                                      width:  height*0.1,
                                      child:
                                      isLoading3==false?
                                      Image.network(
                                        oppositeteamByIdFootball1.data!.logoPath!,
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
                                  ),


                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Score",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                                  Text("Matches",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                                  Text("Score",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                                ],
                              ),
                            ),
                            isLoading5==false ?
                            Container(
                              padding: EdgeInsets.only(bottom: 0),
                              color: Color(0xff57bbb4),
                              height: height*0.5,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: headToHeadFootball.data?.length,
                                  itemBuilder: (context,index){

                                    // if(headToHeadFootball.data![index].winnerTeamId.toString()==id1){
                                    //     win1=win1+1;
                                    // }else if(headToHeadFootball.data![index].winnerTeamId.toString()==id2){
                                    //   win2=win2+1;
                                    // }

                                    return  InkWell(
                                      onTap: (){
                                        print(headToHeadFootball.data![index].id);
                                        print(headToHeadFootball.data![index].id);
                                        print(headToHeadFootball.data![index].id);
                                        print(headToHeadFootball.data![index].id);

                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => PreviousMatchDataFootballScreen(
                                              // venueByIdFootball.data.name,
                                              headToHeadFootball.data![index].id!,
                                              teamByIdFootball.data!.logoPath!,
                                              oppositeteamByIdFootball1.data!.logoPath!,
                                              teamByIdFootball.data!.name!,
                                              oppositeteamByIdFootball1.data!.name!,
                                              leage.data.name,
                                              fixturesByIdFootball.data!.standings!.localteamPosition.toString(),
                                              fixturesByIdFootball.data!.standings!.visitorteamPosition.toString(),
                                              venueByIdFootball.data.city,
                                              venueByIdFootball.data.capacity.toString(),
                                              venueByIdFootball.data.imagePath,
                                              headToHeadFootball.data![index].formations!.localteamFormation.toString(),
                                              headToHeadFootball.data![index].formations!.localteamFormation.toString(),
                                              headToHeadFootball.data![index].scores!.localteamScore.toString(),
                                              headToHeadFootball.data![index].scores!.visitorteamScore.toString(),
                                              headToHeadFootball.data![index].scores!.htScore.toString(),
                                              headToHeadFootball.data![index].scores!.ftScore.toString(),
                                            )
                                        )
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(15))
                                        ),
                                        margin: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                                        padding: EdgeInsets.all(20),
                                        height: height*0.07,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(headToHeadFootball.data![index].scores!.localteamScore.toString(),style: TextStyle(color:Color(0xff57bbb4),fontSize: 18),),
                                            Text(headToHeadFootball.data![index].time!.startingAt!.date!.toString(),style: TextStyle(color:Color(0xff57bbb4))),
                                            Text(headToHeadFootball.data![index].scores!.visitorteamScore.toString(),style: TextStyle(color:Color(0xff57bbb4),fontSize: 18)),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ): Container()

                          ],
                        ),
                      ),

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
