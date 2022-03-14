import 'package:basketballinsider/models/fixture_by_id_football.dart' as v1;
import 'package:basketballinsider/models/football_live.dart';
import 'package:basketballinsider/models/head_to_head_football.dart' as v; // here both class has a color attribute so we need to differentiate that.
import 'package:basketballinsider/models/leage_by_id_football.dart';
import 'package:basketballinsider/models/round_by_id_football.dart';
import 'package:basketballinsider/models/team_by_id_football.dart';
import 'package:basketballinsider/models/venue_id_football.dart';
import 'package:basketballinsider/screens/previous_match_data_football.dart';
import 'package:basketballinsider/services/football_service.dart';
import 'package:basketballinsider/services/get_fixture_by_id_football.dart';
import 'package:basketballinsider/services/get_leage_by_id_football.dart';
import 'package:basketballinsider/services/get_round_by_id_football.dart';
import 'package:basketballinsider/services/get_team_by_id_football.dart';
import 'package:basketballinsider/services/get_venue_by_id_football.dart';
import 'package:basketballinsider/services/head_to_head_football_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FootballLiveScoreScreen extends StatefulWidget {
  // const FootballLiveScoreScreen({Key? key}) : super(key: key);
  late int index;


  FootballLiveScoreScreen(this.index);

  @override
  _FootballLiveScoreScreenState createState() => _FootballLiveScoreScreenState();
}

class _FootballLiveScoreScreenState extends State<FootballLiveScoreScreen> {


  bool isLoading = false;
  bool isLoading1 = true;
  bool isLoading2 = true;
  bool isLoading3 = true;
  bool isLoading4 = true;
  bool isLoading5 = true;
  bool isLoading6 = true;

  int win1 = 0;
  int draw = 0;
  int win2 = 0;


  String id1="";
  String id2="";


  late FootballLiveScore footballLiveScore;
  late Leage leage;
  late TeamByIdFootball teamByIdFootball;
  late TeamByIdFootball oppositeteamByIdFootball1;
  late VenueByIdFootball venueByIdFootball;
  late v.HeadToHeadFootball headToHeadFootball;
  late RoundByIdFootball roundByIdFootball;
  late v1.FixturesByIdFootball fixturesByIdFootball;

  getData() async{
    setState(() {
      isLoading = true;
    });
    FootballLiveScore? temp;
    FootballLiveScoreServices.getUsers().then((sites){
      temp = sites;
      // print(widget.index);

      // print(temp!.data[0].localteamId.toString());
      if(this.mounted) {
        setState(() {
          footballLiveScore = sites!;
          // print(footballLiveScore.data[widget.index].visitorteamId.toString());
          getLeagebyId(
              footballLiveScore.data[widget.index].leagueId.toString());
          getTeambyId(
              footballLiveScore.data[widget.index].localteamId.toString());
          getOppositeTeambyId(
              footballLiveScore.data[widget.index].visitorteamId.toString());
          getVenueById(footballLiveScore.data[widget.index].venueId.toString());
          getRoundById(footballLiveScore.data[widget.index].roundId.toString());

          getHeadtoHeadData(
              footballLiveScore.data[widget.index].localteamId.toString(),
              temp!.data[0].visitorteamId.toString());

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

  getFixtureById(String Id) async{
    // setState(() {
    //   isLoading1 = true;
    // });
    GetFixtureByIdFootballService.getUsers(Id).then((sites){
      setState(() {
       // print(sites);
        if(sites!=null) {
         // print(sites);
          fixturesByIdFootball = sites;
          print("scores ==  "+fixturesByIdFootball.data!.id.toString());
        }
        // isLoading1 = false;
      });
    });
  }


  getTeambyId(String Id) async{
    setState(() {
      isLoading2 = true;
    });
    GetTeamByIdFootvball.getUsers(Id).then((sites){
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
    GetTeamByIdFootvball.getUsers(Id).then((sites){
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
      setState(() {
        if(sites!=null) {
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
        }
      });
    });

  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getFixtureById("32");
  }

  @override
  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double barheight =AppBar().preferredSize.height;
    double height = height1-safe;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(FontAwesomeIcons.arrowLeft),
              color: Colors.black,),
            backgroundColor: Colors.white,
            title: Text("Live Score",style: TextStyle(color: Colors.black),),
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
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 20,top: 10),
                            child: Text("Live ",style: TextStyle(color: Colors.white,fontSize: 20),),
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
                                Text("Day 4",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),)
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
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 20,top: 10,right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Match Details ",style: TextStyle(color: Colors.white,fontSize: 20),),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 80,top: 10,right: 80),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text( isLoading==false ?
                                  footballLiveScore.data[widget.index].scores.localteamScore.toString() : "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 20),),
                                Text("Score",style: TextStyle(color: Colors.white,fontSize: 20),),
                                Text(
                                  isLoading==false ?
                                  footballLiveScore.data[widget.index].scores.visitorteamScore.toString()
                                  : ""
                                  ,style: TextStyle(color: Colors.white,fontSize: 20),),

                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 80,top: 10,right: 80),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  isLoading==false ?
                                  footballLiveScore.data[widget.index].scores.localteamPenScore.toString()
                                  : ""
                                  ,style: TextStyle(color: Colors.white,fontSize: 20),),
                                Text("Penalty Score",style: TextStyle(color: Colors.white,fontSize: 20),),
                                Text(
                                  isLoading==false ?
                                  footballLiveScore.data[widget.index].scores.visitorteamPenScore.toString()
                                  : ""
                                  ,style: TextStyle(color: Colors.white,fontSize: 20),),

                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 80,top: 10,right: 80),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  isLoading==false ?
                                  footballLiveScore.data[widget.index].scores.localteamScore.toString() : "",style: TextStyle(color: Colors.white,fontSize: 20),),
                                Text("Score",style: TextStyle(color: Colors.white,fontSize: 20),),
                                Text(
                                  isLoading==false ?
                                  footballLiveScore.data[widget.index].scores.visitorteamScore.toString() : "",style: TextStyle(color: Colors.white,fontSize: 20),),

                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 80,top: 10,right: 80),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  isLoading==false ?
                                  footballLiveScore.data[widget.index].standings.localteamPosition.toString() : '',style: TextStyle(color: Colors.white,fontSize: 20),),
                                Text("Standings",style: TextStyle(color: Colors.white,fontSize: 20),),
                                Text(isLoading==false ?
                                  footballLiveScore.data[widget.index].standings.visitorteamPosition.toString() : '',style: TextStyle(color: Colors.white,fontSize: 20),),

                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 80,top: 10,right: 80),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  isLoading==false ?
                                  footballLiveScore.data[widget.index].formations.localteamFormation.toString() : '',style: TextStyle(color: Colors.white,fontSize: 20),),
                                Text("Formations",style: TextStyle(color: Colors.white,fontSize: 20),),
                                Text(isLoading==false ?
                                footballLiveScore.data[widget.index].formations.visitorteamFormation.toString() : '',style: TextStyle(color: Colors.white,fontSize: 20),),

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
                                Text("Head to Head ",style: TextStyle(color: Colors.white,fontSize: 20),),
                                Text(isLoading5==false ?
                                 headToHeadFootball.data!.length.toString() + ' Matches' : "Loading..."
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
                          Container(height: 20,),

                          Container(

                            padding: EdgeInsets.only(top: 20),
                            height: height*0.73,
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
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context) => PreviousMatchDataFootballScreen(

                                                    // headToHeadFootball.data![index].id!
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
      ),
    );
  }
}
