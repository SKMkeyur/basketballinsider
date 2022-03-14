import 'package:basketballinsider/models/fixture_by_id_cricket.dart';
import 'package:basketballinsider/screens/cricket/scores.dart';
import 'package:basketballinsider/screens/cricket/scores_service.dart';
import 'package:basketballinsider/screens/player_details_cricket.dart';
import 'package:basketballinsider/services/player_by_id_cricket.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:share/share.dart';

import 'cricket/cricket1.dart';
import 'cricket/cricket_by_id_service.dart';
import 'cricket/fixture_by_id.dart';
import 'cricket/squads.dart';
import 'cricket/temp.dart';
import 'cricket/temp_final.dart';



class Ball {


  String? resource;
  dynamic id;
  dynamic fixtureId;
  dynamic teamId;
  double? ball;
  String? scoreboard;
  dynamic batsmanOneOnCreezeId;
  dynamic batsmanTwoOnCreezeId;
  dynamic batsmanId;
  dynamic bowlerId;
  dynamic batsmanoutId;
  dynamic catchstumpId;
  dynamic runoutById;
  dynamic scoreId;
  String? name;
  dynamic runs;
  bool? four;
  bool? six;
  dynamic bye;
  dynamic legBye;
  dynamic noball;
  dynamic noballRuns;
  bool? isWicket;
  bool? isball;
  bool? out;
  Ball(this.resource, this.id, this.fixtureId, this.teamId, this.ball,
      this.scoreboard, this.batsmanOneOnCreezeId, this.batsmanTwoOnCreezeId,
      this.batsmanId, this.bowlerId, this.batsmanoutId, this.catchstumpId,
      this.runoutById, this.scoreId,
      this.name,
      this.runs,
      this.four,
      this.six,
      this.bye,
      this.legBye,
      this.noball,
      this.noballRuns,
      this.isWicket,
      this.isball,
      this.out,
      );

}


class Score {
  Score(
    this.resource,
    this.id,
    this.name,
    this.runs,
    this.four,
    this.six,
    this.bye,
    this.legBye,
    this.noball,
    this.noballRuns,
    this.isWicket,
    this.ball,
    this.out,
  );

  String? resource;
  dynamic id;
  String? name;
  dynamic runs;
  bool? four;
  bool? six;
  dynamic bye;
  dynamic legBye;
  dynamic noball;
  dynamic noballRuns;
  bool? isWicket;
  bool? ball;
  bool? out;

}


class CrickerMainScreen extends StatefulWidget {

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

  CrickerMainScreen(
      this.id,
      this.localTeamLogo,
      this.localTeamName,
      this.visitorTeamLogo,
      this.visitorTeamName,
      this.leage,
      this.date,
      this.time,
      this.timzone,
      this.status,
      this.ft,
      this.round,
      this.vName,
      this.vCity,
      this.vCapacity,
      this.vImagepath,
      this.localTeamId,
      this.visitorTeamId
      );

  @override
  _CrickerMainScreenState createState() => _CrickerMainScreenState();
}

class Over{
  late dynamic overname;
  late dynamic overlength;

  Over(this.overname, this.overlength);

}

class Squad{
  late String name;
  late int id;
  late String firstname;
  late String lastname;
  late String imageName;
  late String dob;
  late String battingStyle;
  late String bowlingStyle;
  late String positionname;

  Squad(this.name, this.id, this.firstname, this.lastname, this.imageName,
      this.dob, this.battingStyle, this.bowlingStyle, this.positionname);

}

class Score11{
  String? resource;
  dynamic id;
  String? name;
  dynamic runs;
  bool? four;
  bool? six;
  dynamic bye;
  dynamic legBye;
  dynamic noball;
  dynamic noballRuns;
  bool? isWicket;
  bool? ball;
  bool? out;

  Score11(this.resource, this.id, this.name, this.runs, this.four, this.six,
      this.bye, this.legBye, this.noball, this.noballRuns, this.isWicket,
      this.ball, this.out);

}

class _CrickerMainScreenState extends State<CrickerMainScreen> {

  late bool isLoading0 = true;
  late bool isLoading1=true;
  late CricketFinal cricket;
  late Scores01 scores01;
  late List<String> types;
  late int batter1 = 0;
  late int bowler1 = 0;
  var map11 = Map();
  var map22 = Map();

  late List<Squad> squad = [];
 // late List<Squad> squad1 = [];

  late List<Score11> scoress = [];

  late List<Over> overss = [];

  late List<Ball> ball01 = [];
  late List<Ball> ball02 = [];

  late int count11 = 0;

  var map1 = Map();
  var map21 = Map();


  int firstinnningballs = 0;

  getScore(){
    setState(() {
      isLoading1=true;
    });

    ScoreService.getUsers().then((sites){
      print(sites);
      if(sites!=null){
        setState(() {
          scores01=sites;
          print(scores01);
          isLoading1=false;
          for(int i=0;i<scores01.data!.length;i<i++){
            scoress.add(Score11(
                scores01.data![i].resource.toString(),
                scores01.data![i].id,
                scores01.data![i].name.toString(),
                scores01.data![i].runs.toString(),
                scores01.data![i].four,
                scores01.data![i].six,
                scores01.data![i].bye,
                scores01.data![i].legBye.toString(),
                scores01.data![i].noball.toString(),
                scores01.data![i].noballRuns.toString(),
                scores01.data![i].isWicket,
                scores01.data![i].ball,
                scores01.data![i].out));
          }
          print(scoress[0].runs);
        });
      }
    });
  }


  getScoreCard() async {
    int id1;
    int count1=0;
    int id2;
    int count2=0;
    setState(() {
      isLoading0=true;
    });
    FixtureByIdCricketService.getUsers(widget.id).then((sites){
        print(sites);
      if(sites!=null) {
        setState(() {
          cricket = sites;
          isLoading0 = false;
          print(cricket);
          dynamic momid=cricket.data!.manOfMatchId;
          print(momid);
          GetPlayerInfoByIdCrickerService.getUsers(momid).then((sites) {
            print(sites);
            if(sites!=null){
              print(sites);
              print(sites.data!.fullname);
            }
          });

          id1 = cricket.data!.scoreboards!
          [cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S1")].teamId;
          id2 = cricket.data!.scoreboards!
          [cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S2")].teamId;

          for(int i=0;i<cricket.data!.batting!.length;i++){
            if(id1==cricket.data!.batting![i].teamId){
              count1=count1+1;
              print(count1);
            }else{
            }
          }
          batter1 = count1;

          for(int i=0;i<cricket.data!.bowling!.length;i++){
            if(id2==cricket.data!.bowling![i].teamId){
              count2=count2+1;
              print(count2);
            }else{
            }
          }
          bowler1=count2;

          for(int i=0;i<cricket.data!.balls!.length;i++){
            if(cricket.data!.balls![i].scoreboard=="S1")
            {
              ball01.add(Ball(
            //      cricket.data!.balls![i]
                cricket.data!.balls![i].resource,
                cricket.data!.balls![i].id,
                cricket.data!.balls![i].fixtureId,
                cricket.data!.balls![i].teamId,
                cricket.data!.balls![i].ball,
                cricket.data!.balls![i].scoreboard,
                cricket.data!.balls![i].batsmanOneOnCreezeId,
                cricket.data!.balls![i].batsmanTwoOnCreezeId,
                cricket.data!.balls![i].batsmanId,
                cricket.data!.balls![i].bowlerId,
                cricket.data!.balls![i].batsmanoutId,
                cricket.data!.balls![i].catchstumpId,
                cricket.data!.balls![i].runoutById,
                cricket.data!.balls![i].scoreId,
                cricket.data!.balls![i].score!.name,
                cricket.data!.balls![i].score!.runs,
                cricket.data!.balls![i].score!.four,
                cricket.data!.balls![i].score!.six,
                cricket.data!.balls![i].score!.bye,
                cricket.data!.balls![i].score!.legBye,
                cricket.data!.balls![i].score!.noball,
                cricket.data!.balls![i].score!.noballRuns,
                cricket.data!.balls![i].score!.isWicket,
                cricket.data!.balls![i].score!.ball,
                cricket.data!.balls![i].score!.out,
              ));
              firstinnningballs=firstinnningballs+1;
            }

            if(cricket.data!.balls![i].scoreboard=="S2"){
              ball02.add(Ball(
                //      cricket.data!.balls![i]
                cricket.data!.balls![i].resource,
                cricket.data!.balls![i].id,
                cricket.data!.balls![i].fixtureId,
                cricket.data!.balls![i].teamId,
                cricket.data!.balls![i].ball,
                cricket.data!.balls![i].scoreboard,
                cricket.data!.balls![i].batsmanOneOnCreezeId,
                cricket.data!.balls![i].batsmanTwoOnCreezeId,
                cricket.data!.balls![i].batsmanId,
                cricket.data!.balls![i].bowlerId,
                cricket.data!.balls![i].batsmanoutId,
                cricket.data!.balls![i].catchstumpId,
                cricket.data!.balls![i].runoutById,
                cricket.data!.balls![i].scoreId,
                cricket.data!.balls![i].score!.name,
                cricket.data!.balls![i].score!.runs,
                cricket.data!.balls![i].score!.four,
                cricket.data!.balls![i].score!.six,
                cricket.data!.balls![i].score!.bye,
                cricket.data!.balls![i].score!.legBye,
                cricket.data!.balls![i].score!.noball,
                cricket.data!.balls![i].score!.noballRuns,
                cricket.data!.balls![i].score!.isWicket,
                cricket.data!.balls![i].score!.ball,
                cricket.data!.balls![i].score!.out,
              ));
            }

          }

          ball01.forEach((element) {
            dynamic nummm = element.ball!.toInt();
            if(!map11.containsKey(nummm)) {
              map11[nummm] = 1;
            } else {
              map11[nummm] +=1;
            }
          });
          ball02.forEach((element) {
            dynamic nummm = element.ball!.toInt();
            if(!map22.containsKey(nummm)) {
              map22[nummm] = 1;
            } else {
              map22[nummm] +=1;
            }
          });


          print(map11);
          print(map22);







          print(ball01.length);

          print(ball02.length);

        for(int i=0;i<cricket.data!.balls!.length;i++){
            squad.add(Squad(
                cricket.data!.balls![i].batsman!.fullname.toString(),
                cricket.data!.balls![i].batsman!.id,
                cricket.data!.balls![i].batsman!.firstname.toString(),
                cricket.data!.balls![i].batsman!.lastname.toString(),
                cricket.data!.balls![i].batsman!.imagePath.toString(),
                cricket.data!.balls![i].batsman!.dateofbirth.toString(),
                cricket.data!.balls![i].batsman!.battingstyle.toString(),
              cricket.data!.balls![i].batsman!.bowlingstyle.toString(),
              cricket.data!.balls![i].batsman!.position.toString(),
            ));


            squad.add(Squad(cricket.data!.balls![i].bowler!.fullname.toString(),
                cricket.data!.balls![i].bowler!.id,
                cricket.data!.balls![i].bowler!.firstname.toString(),
              cricket.data!.balls![i].bowler!.lastname.toString(),
              cricket.data!.balls![i].bowler!.imagePath.toString(),
              cricket.data!.balls![i].bowler!.dateofbirth.toString(),
              cricket.data!.balls![i].bowler!.battingstyle.toString(),
              cricket.data!.balls![i].bowler!.bowlingstyle.toString(),
              cricket.data!.balls![i].bowler!.position.toString(),
            ));
            dynamic ballnumber = cricket.data!.balls![i].ball;
         //   dynamic ballnumber1 = int.parse(ballnumber);

            overss.add(Over(ballnumber.toInt(),3));
           // print(ballnumber.toInt());

            overss.forEach((element) {
              if(!map1.containsKey(element)) {
                map1[element] = 1;
              } else {
                map1[element] +=1;
              }
            });


          //  overss[0][""]=3;

        }
        print("0000000");
       // print();
        print("0000000");

          // for(int i=0;i<cricket.data!.balls!.length;i++){
        //   squad1.add(Squad(cricket.data!.balls![i].bowler!.fullname.toString(), cricket.data!.balls![i].bowler!.id));
        // print(squad1[i].id);
        // }

        // print(squad1);

        });
      }
    });
  }

  late LinkedScrollControllerGroup _controllers;
  late ScrollController scroll1;
  late ScrollController scroll2;
  late ScrollController scroll3;
  late ScrollController scroll4;
  late ScrollController scroll5;

  int getCount(int value){
    if(count11>firstinnningballs){

    }else{
      count11=count11+1;
    }
    return count11;
  }

  @override
  void initState() {


    // TODO: implement initState
    super.initState();
      getScoreCard();
      getScore();
    _controllers = LinkedScrollControllerGroup();
    scroll1 = _controllers.addAndGet();
    scroll2 = _controllers.addAndGet();
    scroll3 = _controllers.addAndGet();
    scroll4 = _controllers.addAndGet();
    scroll5 = _controllers.addAndGet();
  }

  @override
  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double barheight =AppBar().preferredSize.height;
    double height = height1-safe-barheight;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(

          bottom:   TabBar(
            isScrollable: true,
              labelColor: Colors.white,
              tabs: [
            Tab(text: "INFO",),
            Tab(text: "LIVE",),
            Tab(text: "SCORECARD",),
            Tab(text: "OVERS",),
          ]),
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(FontAwesomeIcons.arrowLeft),
            color: Colors.white,),
          backgroundColor: Color(0xff083471),
          title: FittedBox(child: Text(widget.localTeamName+ "  vs  "+widget.visitorTeamName,style: TextStyle(color: Colors.white),)),
          actions: [
            Container(
                padding: EdgeInsets.only(right: 5),
                child: IconButton(
                  onPressed: (){
                    Share.share("https://new-onlineoffers.com/wp-json/wp/v2/share_action?match_id="+widget.id+"&matchType=Cricket");
                  },
                  icon: Icon(Icons.share),
                  color: Colors.white,))
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'graphic_res/design_3_assets/3/Overlay.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: TabBarView(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                height: height,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text("INFO "
                         // +widget.id
                        ,style: TextStyle(color: Colors.white,fontSize: 16,),),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        height: height*0.25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: width*0.3,
                                    child: Text("Match",style: TextStyle(color: Colors.white),)),
                                Container(
                                    child: Text(widget.round,style: TextStyle(color: Colors.white),)),

                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    width: width*0.3,
                                    child: Text("Series",style: TextStyle(color: Colors.white),)),
                                Container(
                                    child: Text(widget.leage,style: TextStyle(color: Colors.white),)),

                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    width: width*0.3,
                                    child: Text("Date",style: TextStyle(color: Colors.white),)),
                                Container(
                                    child: Text(widget.date,style: TextStyle(color: Colors.white),)),

                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    width: width*0.3,
                                    child: Text("Time",style: TextStyle(color: Colors.white),)),
                                Container(
                                    child: Text(widget.time,style: TextStyle(color: Colors.white),)),

                              ],
                            ),

                          ],
                        ),
                      ),
                    Text("SQUADS",style: TextStyle(color: Colors.white,fontSize: 16,),),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: (){
                                if(isLoading0==false){
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SuadPlayers(widget.localTeamId,widget.localTeamName,cricket.data!.seasonId.toString())
                                      )
                                  );
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                alignment: Alignment.center,
                                width: width*0.4,
                                height: height*0.2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        width: width*0.2,
                                        height: width*0.2,
                                        child:
                                        Image.network(
                                          widget.localTeamLogo
                                          ,
                                          fit: BoxFit.contain,
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
                                          widget.localTeamName+" Squad"
                                          // fixturesByDateRangeFootball.data![index].localteamId.toString()
                                          // teamname[index]
                                          ,style: TextStyle(color: Colors.white)),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){

                                if(isLoading0==false){
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SuadPlayers(widget.visitorTeamId,widget.visitorTeamName,cricket.data!.seasonId.toString())
                                      )
                                  );
                                }

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                alignment: Alignment.center,
                                width: width*0.4,
                                height: height*0.2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        width: width*0.2,
                                        height: width*0.2,
                                        child:
                                        Image.network(
                                          widget.visitorTeamLogo
                                          ,
                                          fit: BoxFit.contain,
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
                                          widget.visitorTeamName+" Squad"
                                          // fixturesByDateRangeFootball.data![index].localteamId.toString()
                                          // teamname[index]
                                          ,style: TextStyle(color: Colors.white)),
                                    ),

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    Text("VENUE DETAILS",style: TextStyle(color: Colors.white,fontSize: 16,),),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      height: height*0.28,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Container(
                                  width: width*0.3,
                                  child: Text("Stadium",style: TextStyle(color: Colors.white),)),
                              Flexible(
                                child: Container(
                                    child: Text(widget.vName,style: TextStyle(color: Colors.white),)),
                              ),

                            ],
                          ),
                          Flexible(
                            child: Row(
                              children: [
                                Container(
                                    width: width*0.3,
                                    child: Text("City",style: TextStyle(color: Colors.white),)),
                                Container(
                                  width: width*0.5,
                                    child: Text(widget.vCity,style: TextStyle(color: Colors.white),)),

                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                  width: width*0.3,
                                  child: Text("Capacity",style: TextStyle(color: Colors.white),)),
                              Container(
                                  child: Text(widget.vCapacity,style: TextStyle(color: Colors.white),)),

                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  width: width*0.3,
                                  child: Text("Image",style: TextStyle(color: Colors.white),)),
                              Container(
                                height: 100,
                                  width: width*0.5,
                                  child:
                                  FadeInImage(
                                    placeholder: AssetImage("graphic_res/no_image.png"),
                                    image: NetworkImage(
                                      widget.vImagepath
                                    )
                                    // Image.network(
                                    //   widget.vImagepath,
                                    //   fit: BoxFit.fill,
                                    //
                                    //   loadingBuilder: (BuildContext context, Widget child,
                                    //       ImageChunkEvent? loadingProgress) {
                                    //     if (loadingProgress == null) return child;
                                    //     return Center(
                                    //       child: CircularProgressIndicator(
                                    //         value: loadingProgress.expectedTotalBytes != null
                                    //             ? loadingProgress.cumulativeBytesLoaded /
                                    //             loadingProgress.expectedTotalBytes!
                                    //             : null,
                                    //       ),
                                    //     );
                                    //   },
                                    // ),
                                  )
                              )
                                // Text(widget.time,style: TextStyle(color: Colors.white),)),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              )
              ,
             isLoading1==false && isLoading0==false?
                 Container(
                   child: Column(
                     children: [
                       Container(
                         height: barheight*2,
                         child: Column(
                           children: [
                             Container(
                               padding: EdgeInsets.symmetric(horizontal: 20),
                               width: width,
                               height: barheight,
                               color: Color(0xff083471),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text(
                                       cricket.data!.localteam!.id==cricket.data!.scoreboards!
                                       [cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S1")].teamId ?
                                       widget.localTeamName : widget.visitorTeamName
                                       //         +
                                       // cricket.data!.scoreboards!
                                       // [cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S1")].teamId.toString()
                                       ,style: TextStyle(color: Colors.white)
                                   ),
                                   Row(
                                     children: [
                                       Text(
                                           cricket.data!.scoreboards![cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S1")].total.toString()
                                           ,style: TextStyle(color: Colors.white)
                                       ),
                                       Text("-"+
                                           cricket.data!.scoreboards![cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S1")].wickets.toString()
                                           ,style: TextStyle(color: Colors.white)
                                       ),
                                       Text(" ("+
                                           cricket.data!.scoreboards
                                           ![cricket.data!.scoreboards!.
                                           indexWhere((element) => element.type=='total' && element.scoreboard=="S1")]
                                               .overs.toString()
                                           +")"


                                           ,style: TextStyle(color: Colors.white)
                                       ),


                                     ],
                                   )

                                 ],
                               ),
                             ),
                             Container(
                               padding: EdgeInsets.symmetric(horizontal: 20),
                               width: width,
                               height: barheight,
                               color: Color(0xff083471),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text(
                                       cricket.data!.localteam!.id==cricket.data!.scoreboards!
                                       [cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S2")].teamId ?
                                       widget.localTeamName : widget.visitorTeamName
                                       //         +
                                       // cricket.data!.scoreboards!
                                       // [cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S1")].teamId.toString()
                                       ,style: TextStyle(color: Colors.white)
                                   ),
                                   Row(
                                     children: [
                                       Text(
                                           cricket.data!.scoreboards![cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S2")].total.toString()
                                           ,style: TextStyle(color: Colors.white)
                                       ),
                                       Text("-"+
                                           cricket.data!.scoreboards![cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S2")].wickets.toString()
                                           ,style: TextStyle(color: Colors.white)
                                       ),
                                       Text(" ("+
                                           cricket.data!.scoreboards
                                           ![cricket.data!.scoreboards!.
                                           indexWhere((element) => element.type=='total' && element.scoreboard=="S2")]
                                               .overs.toString()
                                           +")"


                                           ,style: TextStyle(color: Colors.white)
                                       ),


                                     ],
                                   )

                                 ],
                               ),
                             ),
                           ],
                         ),
                       ),
                       Container(
                         height: height-barheight*3,
                         child: ListView.builder(
                           reverse: false,
                           itemCount: cricket.data!.balls!.length,
                             itemBuilder: (context,index)
                             {
                               int i = cricket.data!.balls!.length-1-index;
                           return Container(
                             decoration: BoxDecoration(
                               color: Colors.white24,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                             ),
                             margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                             height: height*0.07,
                             child: Row(
                               children: [
                                 Container(
                                   decoration: BoxDecoration(
                                       color:  Color(0xff083471),

                                       borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
                                   ),
                                   alignment: Alignment.center,
                                     height: height*0.07,
                                     padding: EdgeInsets.symmetric(horizontal: 10),
                                     width: width*0.15,
                                     child: Text(cricket.data!.balls![i].ball.toString(),style: TextStyle(color: Colors.white),)),
                                 Container(

                                     alignment: Alignment.center,
                                     height: height*0.07,
                                     padding: EdgeInsets.symmetric(horizontal: 20),
                                     width: width*0.7,
                                     child: Text(
                                        cricket.data!.balls![i].bowler!.fullname.toString()+" to "+
                                            cricket.data!.balls![i].batsman!.fullname.toString()+", "+
                                        scoress[scoress.
                                        indexWhere((element) => element.id==cricket.data!.balls![i].scoreId)].runs.toString()+" run "
                                       ,style: TextStyle(color: Colors.white),)),
                                 Container(
                                   alignment: Alignment.center,
                                   height: height*0.07,
                                   decoration: BoxDecoration(
                                       color:
                                       scoress[scoress.indexWhere((element) => element.id==cricket.data!.balls![i].scoreId)].isWicket==true ?
                                       Colors.red :
                                       scoress[scoress.indexWhere((element) => element.id==cricket.data!.balls![i].scoreId)].four==true ?
                                       Colors.green :
                                       scoress[scoress.indexWhere((element) => element.id==cricket.data!.balls![i].scoreId)].six==true ?
                                       Colors.purple : Colors.transparent

                                       ,
                                       borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                                   ),
                                   width: width*0.1,
                                   child: Text(
                                       scoress[scoress.indexWhere((element) => element.id==cricket.data!.balls![i].scoreId)].isWicket==true ?
                                           "W" :
                                       scoress[scoress.indexWhere((element) => element.id==cricket.data!.balls![i].scoreId)].four==true ?
                                           "4" :
                                       scoress[scoress.indexWhere((element) => element.id==cricket.data!.balls![i].scoreId)].six==true ?
                                           "6" : ""
                                           ,style: TextStyle(color: Colors.white),


                                   ),
                                 )

                               ],
                             ),
                           );
                         }),
                       )
                     ],
                   ),


                 ):
                 Container(
                   child: Text("Match Not Started Yet",style: TextStyle(color: Colors.white),),
                 )
              ,
              isLoading0==false?
              CustomScrollView(

                controller: scroll1,
                slivers: [
                  SliverList(delegate: SliverChildListDelegate(
                    [
                      Container(

                        alignment: Alignment.centerLeft,
                        height: (barheight*9)+(height*0.07*cricket.data!.batting!.length)+(height*0.07*cricket.data!.bowling!.length),
                        width: width,
                        //color: Colors.red,
                        child: Column(
                          children: [
                            Container(
                              height: barheight,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.all(20),
                              child: FittedBox(child: Text(cricket.data!.note.toString(),style: TextStyle(color: Colors.white))),
                            ),


                            //First Team
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: width,
                              height: barheight,
                              color: Color(0xff083471),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      cricket.data!.localteam!.id==cricket.data!.scoreboards!
                                      [cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S1")].teamId ?
                                      widget.localTeamName : widget.visitorTeamName
                                      //         +
                                      // cricket.data!.scoreboards!
                                      // [cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S1")].teamId.toString()
                                      ,style: TextStyle(color: Colors.white)
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          cricket.data!.scoreboards![cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S1")].total.toString()
                                          ,style: TextStyle(color: Colors.white)
                                      ),
                                      Text("-"+
                                          cricket.data!.scoreboards![cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S1")].wickets.toString()
                                          ,style: TextStyle(color: Colors.white)
                                      ),
                                      Text(" ("+
                                          cricket.data!.scoreboards
                                          ![cricket.data!.scoreboards!.
                                          indexWhere((element) => element.type=='total' && element.scoreboard=="S1")]
                                              .overs.toString()
                                          +")"


                                          ,style: TextStyle(color: Colors.white)
                                      ),


                                    ],
                                  )

                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              width: width,
                              height: barheight,
                              color: Color(0x3DDCDCDC),
                              child: Row(
                                children: [
                                  Container(
                                    width: width*0.4,
                                    child: Text(
                                      "Batter"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "R"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "B"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "4s"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "6s"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "SR"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white24
                              ),
                              height: height*0.07*batter1,
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                   // controller: scroll2,
                                  itemCount: batter1,
                                  itemBuilder: (context,index){
                                    return Container(
                                      height: height*0.07,
                                      margin: EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: width*0.4,
                                            child: InkWell(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(
                                                    builder: (context) => PlayerDetailsCricket(
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).id.toString(),

                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).firstname.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).lastname.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).name.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).imageName.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).dob.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).battingStyle.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).bowlingStyle.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).positionname.toString(),

                                                    )
                                                )
                                                );
                                              },
                                              child: Text(
                                                // cricket.data!.batting![index].playerId.toString()
                                                squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).name
                                                ,style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.batting![index].score.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.batting![index].ball.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.batting![index].fourX.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.batting![index].sixX.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.batting![index].rate.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),





                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              height: barheight,
                              color: Colors.white24,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Extras",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                                  Row(
                                    children: [
                                      Text(
                                        (cricket.data!.scoreboards!
                                        [cricket.data!.scoreboards!
                                            .indexWhere((element) => element.type=='extra' && element.scoreboard=="S1")].bye
                                            +
                                            cricket.data!.scoreboards!
                                            [cricket.data!.scoreboards!
                                                .indexWhere((element) => element.type=='extra' && element.scoreboard=="S1")].legBye
                                            +
                                            cricket.data!.scoreboards!
                                            [cricket.data!.scoreboards!
                                                .indexWhere((element) => element.type=='extra' && element.scoreboard=="S1")].wide
                                            +
                                            cricket.data!.scoreboards!
                                            [cricket.data!.scoreboards!
                                                .indexWhere((element) => element.type=='extra' && element.scoreboard=="S1")].noballRuns
                                            +
                                            cricket.data!.scoreboards!
                                            [cricket.data!.scoreboards!
                                                .indexWhere((element) => element.type=='extra' && element.scoreboard=="S1")].penalty
                                        ).toString()
                                        ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "     b "+
                                            cricket.data!.scoreboards!
                                            [cricket.data!.scoreboards!
                                                .indexWhere((element) => element.type=='extra' && element.scoreboard=="S1")].bye.toString()
                                            + ", lb "+
                                            cricket.data!.scoreboards!
                                            [cricket.data!.scoreboards!
                                                .indexWhere((element) => element.type=='extra' && element.scoreboard=="S1")].legBye.toString()
                                            +", w "+
                                            cricket.data!.scoreboards!
                                            [cricket.data!.scoreboards!
                                                .indexWhere((element) => element.type=='extra' && element.scoreboard=="S1")].wide.toString()
                                            +", nb "+
                                            cricket.data!.scoreboards!
                                            [cricket.data!.scoreboards!
                                                .indexWhere((element) => element.type=='extra' && element.scoreboard=="S1")].noballRuns.toString()
                                            +", p "+
                                            cricket.data!.scoreboards!
                                            [cricket.data!.scoreboards!
                                                .indexWhere((element) => element.type=='extra' && element.scoreboard=="S1")].penalty.toString()
                                        ,style: TextStyle(color: Colors.white),

                                      ),


                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              width: width,
                              height: barheight,
                              color: Color(0x3DDCDCDC),
                              child: Row(
                                children: [
                                  Container(
                                    width: width*0.4,
                                    child: Text(
                                      "Bowler"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "O"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "M"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "R"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "W"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "ER"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white24
                              ),
                              height: height*0.07*bowler1,
                              child: ListView.builder(

                                //  scrollDirection: Axis.vertical,
                                  physics:  NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                  controller: scroll3,
                                  itemCount: bowler1,
                                  itemBuilder: (context,index){
                                    return Container(

                                      height: height*0.07,
                                      margin: EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(

                                        children: [
                                          Container(
                                            width: width*0.4,
                                            child: InkWell(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(
                                                    builder: (context) => PlayerDetailsCricket(
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).id.toString(),

                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).firstname.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).lastname.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).name.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).imageName.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).dob.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).battingStyle.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).bowlingStyle.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).positionname.toString(),

                                                    )
                                                )
                                                );
                                              },
                                              child: Text(
                                                //cricket.data!.bowling![index].playerId .toString()
                                                squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).name
                                                ,style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.bowling![index].overs.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.bowling![index].medians.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.bowling![index].runs.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.bowling![index].wide.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.bowling![index].rate.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),





                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            //next Team
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: width,
                              height: barheight,
                              color: Color(0xff083471),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      cricket.data!.localteam!.id==cricket.data!.scoreboards!
                                      [cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S2")].teamId ?
                                      widget.localTeamName : widget.visitorTeamName
                                      //         +
                                      // cricket.data!.scoreboards!
                                      // [cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S1")].teamId.toString()
                                      ,style: TextStyle(color: Colors.white)
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          cricket.data!.scoreboards![cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S2")].total.toString()
                                          ,style: TextStyle(color: Colors.white)
                                      ),
                                      Text("-"+
                                          cricket.data!.scoreboards![cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S2")].wickets.toString()
                                          ,style: TextStyle(color: Colors.white)
                                      ),
                                      Text(" ("+
                                          cricket.data!.scoreboards
                                          ![cricket.data!.scoreboards!.
                                          indexWhere((element) => element.type=='total' && element.scoreboard=="S2")]
                                              .overs.toString()
                                          +")"


                                          ,style: TextStyle(color: Colors.white)
                                      ),


                                    ],
                                  )

                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              width: width,
                              height: barheight,
                              color: Color(0x3DDCDCDC),
                              child: Row(
                                children: [
                                  Container(
                                    width: width*0.4,
                                    child: Text(
                                      "Batter"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "R"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "B"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "4s"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "6s"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "SR"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white24
                              ),
                              height: height*0.07*(cricket.data!.batting!.length-batter1),
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics:  NeverScrollableScrollPhysics(),
                                  //  shrinkWrap: true,
                                  //  controller: scroll4,
                                  itemCount:   cricket.data!.batting!.length-batter1,
                                  itemBuilder: (context,i){
                                    int index = i+batter1;
                                    return Container(
                                      height: height*0.07,
                                      margin: EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(

                                        children: [
                                          Container(
                                            width: width*0.4,
                                            child: InkWell(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(
                                                    builder: (context) => PlayerDetailsCricket(
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).id.toString(),

                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).firstname.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).lastname.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).name.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).imageName.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).dob.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).battingStyle.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).bowlingStyle.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).positionname.toString(),

                                                    )
                                                )
                                                );
                                              },
                                              child: Text(
                                                // cricket.data!.batting![index].playerId.toString()
                                                squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.batting![index].playerId)).name
                                                ,style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.batting![index].score.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.batting![index].ball.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.batting![index].fourX.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.batting![index].sixX.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.batting![index].rate.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),





                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              height: barheight,
                              color: Colors.white24,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Extras",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                                  Row(
                                    children: [
                                      Text(
                                        ( cricket.data!.scoreboards!
                                        [cricket.data!.scoreboards!
                                            .indexWhere((element) => element.type=='extra' && element.scoreboard=="S2")].bye
                                            +
                                            cricket.data!.scoreboards!
                                            [cricket.data!.scoreboards!
                                                .indexWhere((element) => element.type=='extra' && element.scoreboard=="S2")].legBye
                                            +
                                            cricket.data!.scoreboards!
                                            [cricket.data!.scoreboards!
                                                .indexWhere((element) => element.type=='extra' && element.scoreboard=="S2")].wide
                                            +
                                            cricket.data!.scoreboards!
                                            [cricket.data!.scoreboards!
                                                .indexWhere((element) => element.type=='extra' && element.scoreboard=="S2")].noballRuns
                                            +
                                            cricket.data!.scoreboards!
                                            [cricket.data!.scoreboards!
                                                .indexWhere((element) => element.type=='extra' && element.scoreboard=="S2")].penalty
                                        ).toString()
                                        ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "     b "+
                                            cricket.data!.scoreboards!
                                            [cricket.data!.scoreboards!
                                                .indexWhere((element) => element.type=='extra' && element.scoreboard=="S2")].bye.toString()
                                            + ", lb "+
                                            cricket.data!.scoreboards!
                                            [cricket.data!.scoreboards!
                                                .indexWhere((element) => element.type=='extra' && element.scoreboard=="S2")].legBye.toString()
                                            +", w "+
                                            cricket.data!.scoreboards!
                                            [cricket.data!.scoreboards!
                                                .indexWhere((element) => element.type=='extra' && element.scoreboard=="S2")].wide.toString()
                                            +", nb "+
                                            cricket.data!.scoreboards!
                                            [cricket.data!.scoreboards!
                                                .indexWhere((element) => element.type=='extra' && element.scoreboard=="S2")].noballRuns.toString()
                                            +", p "+
                                            cricket.data!.scoreboards!
                                            [cricket.data!.scoreboards!
                                                .indexWhere((element) => element.type=='extra' && element.scoreboard=="S2")].penalty.toString()
                                        ,style: TextStyle(color: Colors.white),

                                      ),


                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              width: width,
                              height: barheight,
                              color: Color(0x3DDCDCDC),
                              child: Row(
                                children: [
                                  Container(
                                    width: width*0.4,
                                    child: Text(
                                      "Bowler"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "O"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "M"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "R"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "W"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: width*0.1,
                                    child: Text(
                                      "ER"
                                      ,style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white24
                              ),
                              height: height*0.07*(cricket.data!.bowling!.length-bowler1),
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics:  NeverScrollableScrollPhysics(),

                                  // controller: scroll5,
                                  itemCount: cricket.data!.bowling!.length-bowler1,
                                  itemBuilder: (context,i){
                                    int index = i+bowler1;
                                    return Container(

                                      height: height*0.07,
                                      margin: EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(

                                        children: [
                                          Container(
                                            width: width*0.4,
                                            child: InkWell(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(
                                                    builder: (context) => PlayerDetailsCricket(
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).id.toString(),

                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).firstname.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).lastname.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).name.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).imageName.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).dob.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).battingStyle.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).bowlingStyle.toString(),
                                                      squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).positionname.toString(),

                                                    )
                                                )
                                                );
                                              },
                                              child: Text(
                                                //cricket.data!.bowling![index].playerId .toString()
                                                squad.elementAt(squad.lastIndexWhere((element) => element.id==cricket.data!.bowling![index].playerId)).name
                                                ,style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.bowling![index].overs.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.bowling![index].medians.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.bowling![index].runs.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.bowling![index].wide.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: Text(
                                              cricket.data!.bowling![index].rate.toString()
                                              ,style: TextStyle(color: Colors.white),
                                            ),
                                          ),





                                        ],
                                      ),
                                    );
                                  }),
                            ),





                          ],
                        ),
                      ),
                    ]
                  ))
                ]
              )
                  :Center(child: Text("No Data",style: TextStyle(color: Colors.white),),)
              ,
              isLoading1==false && isLoading0==false?
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: barheight*2,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: width,
                              height: barheight,
                              color: Color(0xff083471),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      cricket.data!.localteam!.id==cricket.data!.scoreboards!
                                      [cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S1")].teamId ?
                                      widget.localTeamName : widget.visitorTeamName
                                      //         +
                                      // cricket.data!.scoreboards!
                                      // [cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S1")].teamId.toString()
                                      ,style: TextStyle(color: Colors.white)
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          cricket.data!.scoreboards![cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S1")].total.toString()
                                          ,style: TextStyle(color: Colors.white)
                                      ),
                                      Text("-"+
                                          cricket.data!.scoreboards![cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S1")].wickets.toString()
                                          ,style: TextStyle(color: Colors.white)
                                      ),
                                      Text(" ("+
                                          cricket.data!.scoreboards
                                          ![cricket.data!.scoreboards!.
                                          indexWhere((element) => element.type=='total' && element.scoreboard=="S1")]
                                              .overs.toString()
                                          +")"


                                          ,style: TextStyle(color: Colors.white)
                                      ),


                                    ],
                                  )

                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: width,
                              height: barheight,
                              color: Color(0xff083471),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      cricket.data!.localteam!.id==cricket.data!.scoreboards!
                                      [cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S2")].teamId ?
                                      widget.localTeamName : widget.visitorTeamName
                                      //         +
                                      // cricket.data!.scoreboards!
                                      // [cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S1")].teamId.toString()
                                      ,style: TextStyle(color: Colors.white)
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          cricket.data!.scoreboards![cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S2")].total.toString()
                                          ,style: TextStyle(color: Colors.white)
                                      ),
                                      Text("-"+
                                          cricket.data!.scoreboards![cricket.data!.scoreboards!.indexWhere((element) => element.type=='total' && element.scoreboard=="S2")].wickets.toString()
                                          ,style: TextStyle(color: Colors.white)
                                      ),
                                      Text(" ("+
                                          cricket.data!.scoreboards
                                          ![cricket.data!.scoreboards!.
                                          indexWhere((element) => element.type=='total' && element.scoreboard=="S2")]
                                              .overs.toString()
                                          +")"


                                          ,style: TextStyle(color: Colors.white)
                                      ),


                                    ],
                                  )

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),


                      Container(
                        height: height*0.07* map22.length+10*map11.length,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),

                            itemCount: map22.length,
                            itemBuilder: (context,i1){
                              int i = map22.length-1-i1;
                              return Container(
                                width: width,
                                margin: EdgeInsets.all(5),
                                height: height*0.07,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xff083471),
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
                                      ),
                                      alignment: Alignment.center,
                                      height: height*0.07,
                                      width: width*0.15,
                                      child: Text((i+1).toString(),style: TextStyle(color: Colors.white),),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                                      ),
                                      width: width*0.8,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: map22[i]<6 ? map22[i] : 6,
                                          itemBuilder: (context,ind){
                                            print(map22[i]);
                                            //  count11=count11+ind;
                                            return InkWell(
                                              onTap: (){

                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.all(3),
                                                width: height*0.05,
                                                height:  height*0.05,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                  cricket.data!.balls![cricket.data!.balls!.indexWhere((element) => element.ball==double.parse(i.toString()+"."+(ind+1).toString())  && element.scoreboard=="S2")].score!.four==true?
                                                  Colors.green :
                                                  cricket.data!.balls![cricket.data!.balls!.indexWhere((element) => element.ball==double.parse(i.toString()+"."+(ind+1).toString()) && element.scoreboard=="S2")].score!.six==true?
                                                  Colors.purple :
                                                  cricket.data!.balls![cricket.data!.balls!.indexWhere((element) => element.ball==double.parse(i.toString()+"."+(ind+1).toString()) && element.scoreboard=="S2")].score!.isWicket==true?
                                                  Colors.red:
                                                  Colors.white
                                                  ,
                                                ),
                                                child: Text(
                                                  cricket.data!.balls![cricket.data!.balls!.indexWhere((element) => element.ball==double.parse(i.toString()+"."+(ind+1).toString()) && element.scoreboard=="S2")].score!.runs.toString()
                                                  //  cricket.data!.balls!.indexWhere((element) => element.ball==double.parse(i.toString()+"."+(ind+1).toString())).toString()
                                                  //  i.toString()+"."+ind.toString()
                                                  // (){
                                                  //   return
                                                  //   // int value1 = getCount(count11);
                                                  //   //  return (value1.toString());
                                                  //  }()
                                                  //  map11[i].toString()
                                                  //  (count11).toString()
                                                  //   i==0?
                                                  //   ((i*map11[i])+ind).toString()
                                                  //       :
                                                  //   (i*map11[i]+ind).toString()
                                                  //   ind==0 && i==0?
                                                  //   (i*map11[i]+ind).toString() :
                                                  //   ind==0 && i!=0?
                                                  //   (i*map11[i]+ind).toString() :
                                                  //   (i*map11[i]+ind).toString()
                                                  //    cricket.data!.balls![count11].score!.runs.toString()
                                                  ,style: TextStyle(color: Color(0xff083471)),
                                                ),
                                              ),
                                            );
                                          }),

                                    )
                                  ],
                                ),
                              );
                            }),

                      ),

                      Container(
                                height: height*0.07* map11.length+10*map11.length,
                                child: ListView.builder(
                                   physics: NeverScrollableScrollPhysics(),

                                    itemCount: map11.length,
                                    itemBuilder: (context,i1){
                                     int i = map11.length-1-i1;
                                      return Container(
                                        width: width,
                                        margin: EdgeInsets.all(5),
                                        height: height*0.07,
                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xff083471),
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
                                              ),
                                              alignment: Alignment.center,
                                              height: height*0.07,
                                              width: width*0.15,
                                              child: Text((i+1).toString(),style: TextStyle(color: Colors.white),),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white24,
                                                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                                              ),
                                              width: width*0.8,
                                              child: ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: 6,
                                                  itemBuilder: (context,ind){
                                                    print(map11[i]);
                                                    //  count11=count11+ind;
                                                    return Container(
                                                      alignment: Alignment.center,
                                                      margin: EdgeInsets.all(3),
                                                      width: height*0.05,
                                                      height:  height*0.05,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                        cricket.data!.balls![cricket.data!.balls!.indexWhere((element) => element.ball==double.parse(i.toString()+"."+(ind+1).toString()))].score!.four==true?
                                                        Colors.green :
                                                        cricket.data!.balls![cricket.data!.balls!.indexWhere((element) => element.ball==double.parse(i.toString()+"."+(ind+1).toString()))].score!.six==true?
                                                        Colors.purple :
                                                        cricket.data!.balls![cricket.data!.balls!.indexWhere((element) => element.ball==double.parse(i.toString()+"."+(ind+1).toString()))].score!.isWicket==true?
                                                        Colors.red:
                                                        Colors.white
                                                        ,
                                                      ),
                                                      child: Text(
                                                        cricket.data!.balls![cricket.data!.balls!.indexWhere((element) => element.ball==double.parse(i.toString()+"."+(ind+1).toString()))].score!.runs.toString()
                                                        //  cricket.data!.balls!.indexWhere((element) => element.ball==double.parse(i.toString()+"."+(ind+1).toString())).toString()
                                                        //  i.toString()+"."+ind.toString()
                                                        // (){
                                                        //   return
                                                        //   // int value1 = getCount(count11);
                                                        //   //  return (value1.toString());
                                                        //  }()
                                                        //  map11[i].toString()
                                                        //  (count11).toString()
                                                        //   i==0?
                                                        //   ((i*map11[i])+ind).toString()
                                                        //       :
                                                        //   (i*map11[i]+ind).toString()
                                                        //   ind==0 && i==0?
                                                        //   (i*map11[i]+ind).toString() :
                                                        //   ind==0 && i!=0?
                                                        //   (i*map11[i]+ind).toString() :
                                                        //   (i*map11[i]+ind).toString()
                                                        //    cricket.data!.balls![count11].score!.runs.toString()
                                                        ,style: TextStyle(color: Color(0xff083471)),
                                                      ),
                                                    );
                                                  }),

                                            )
                                          ],
                                        ),
                                      );
                                    }),

                              ),

                    ],
                  ),
                ),


              )
                  :
              Container(
                child: Text("Match Not Started Yet",style: TextStyle(color: Colors.white),),
              ),
              // Icon(Icons.directions_car),
              // Icon(Icons.directions_transit),
              // Icon(Icons.directions_bike),
              // Icon(Icons.directions_car),
            ],


          ),
        ),
      ),
    );
  }
}
