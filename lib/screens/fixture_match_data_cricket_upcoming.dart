import 'package:basketballinsider/models/fixture_by_id_cricket.dart' as v2;
import 'package:basketballinsider/models/head_to_head_football.dart' as v1;
import 'package:basketballinsider/models/leage_by_id_cricket.dart';
import 'package:basketballinsider/models/leage_by_id_football.dart';
import 'package:basketballinsider/models/round_by_id_football.dart';
import 'package:basketballinsider/models/squad_by_team_id_season_id_cricket.dart';
import 'package:basketballinsider/models/team_by_id_cricket.dart';
import 'package:basketballinsider/models/team_by_id_football.dart';
import 'package:basketballinsider/models/venue_by_id_cricket.dart';
import 'package:basketballinsider/models/venue_id_football.dart';
import 'package:basketballinsider/screens/player_details_cricket.dart';
import 'package:basketballinsider/screens/previous_match_data_football.dart';
import 'package:basketballinsider/services/get_fixture_by_id_cricket.dart';
import 'package:basketballinsider/services/get_fixture_by_id_football.dart';
import 'package:basketballinsider/services/get_leage_by_id_cricket.dart';
import 'package:basketballinsider/services/get_leage_by_id_football.dart';
import 'package:basketballinsider/services/get_round_by_id_football.dart';
import 'package:basketballinsider/services/get_team_by_id_cricket.dart';
import 'package:basketballinsider/services/get_team_by_id_football.dart';
import 'package:basketballinsider/services/get_venue_by_id_cricket.dart';
import 'package:basketballinsider/services/get_venue_by_id_football.dart';
import 'package:basketballinsider/services/head_to_head_football_service.dart';
import 'package:basketballinsider/services/squad_cricket_service.dart';
import 'package:flutter/material.dart';
import 'package:basketballinsider/models/fixture_by_id_football.dart' as v1;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FixtureMatchDataCricketScreen extends StatefulWidget {
  //const PreviousMatchDataFootballScreen({Key? key}) : super(key: key);
  late int id;
  FixtureMatchDataCricketScreen(this.id);
  @override
  _FixtureMatchDataCricketScreenState createState() => _FixtureMatchDataCricketScreenState();
}

class _FixtureMatchDataCricketScreenState extends State<FixtureMatchDataCricketScreen> {

  late int Id;
  late v2.FixtureByIdCricket fixturesByIdCricket;

  bool isLoading = false;
  bool isLoading1 = true;
  bool isLoading2 = true;
  bool isLoading3 = true;
  bool isLoading4 = true;
  bool isLoading5 = true;
  bool isLoading6 = true;
  bool isLoading7 = true;
  bool isLoading8 = true;

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
   late VenueByIdCricket venueByIdFootball;
  late RoundByIdFootball roundByIdFootball;
  late SquadByTeamidSeasonIdCricket squadByTeamidSeasonIdCricket;
  late SquadByTeamidSeasonIdCricket squadByTeamidSeasonIdCricket1;

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
           getVenueById(fixturesByIdCricket.data!.venueId.toString());
           getSquad(fixturesByIdCricket.data!.localteamId.toString(), fixturesByIdCricket.data!.seasonId.toString());
          getSquad1(fixturesByIdCricket.data!.visitorteamId.toString(), fixturesByIdCricket.data!.seasonId.toString());

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

  getVenueById(String Id) async{
    setState(() {
      isLoading4 = true;
    });
    GetVenueByIdCricketServices.getUsers(Id).then((sites){
      setState(() {
        venueByIdFootball = sites!;
        isLoading4 = false;
      });
    });
  }

  getSquad(String Id,String Id2) async{
    setState(() {
      isLoading7 = true;
    });
    GetSquadByTeamIdSeasonIdCricket.getUsers(Id,Id2).then((sites){
      print(sites);
      setState(() {
        squadByTeamidSeasonIdCricket = sites!;
        isLoading7 = false;
      });
    });
  }
  getSquad1(String Id,String Id2) async{
    setState(() {
      isLoading8 = true;
    });
    GetSquadByTeamIdSeasonIdCricket.getUsers(Id,Id2).then((sites){
      print(sites);
      setState(() {
        squadByTeamidSeasonIdCricket1 = sites!;
        isLoading8 = false;
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
        title: Text("Upcoming Match",style: TextStyle(color: Colors.black),),
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
                              ,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        // margin: EdgeInsets.only(left: 40,top: 10,right: 40),
                        child: isLoading==false?
                        Text(
                          fixturesByIdCricket.data!.round.toString()
                          ,style: TextStyle(color: Colors.white,fontSize: 20),
                        )
                            : Text(""),
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
                            Text("Starting At : ",style: TextStyle(color: Colors.white,fontSize: 20),),

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



                      isLoading7==false && isLoading2==false?
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(teamByIdFootball.data!.name!+" Squad",style: TextStyle(color: Colors.white),),
                      ):Container(),
                      isLoading7==false?
                      Container(
                        height: 100,
                        width: width,
                        child:
                        ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: squadByTeamidSeasonIdCricket.data!.squad!.length,
                            itemBuilder: (context,index){
                              return
                             InkWell(
                               onTap: (){
                                 Navigator.push(context, MaterialPageRoute(
                                     builder: (context) => PlayerDetailsCricket(
                                         squadByTeamidSeasonIdCricket.data!.squad![index].id.toString(),
                                         squadByTeamidSeasonIdCricket.data!.squad![index].firstname.toString(),
                                       squadByTeamidSeasonIdCricket.data!.squad![index].lastname.toString(),
                                       squadByTeamidSeasonIdCricket.data!.squad![index].fullname.toString(),
                                         squadByTeamidSeasonIdCricket.data!.squad![index].imagePath.toString(),
                                         squadByTeamidSeasonIdCricket.data!.squad![index].dateofbirth.toString(),
                                         squadByTeamidSeasonIdCricket.data!.squad![index].battingstyle.toString(),
                                         squadByTeamidSeasonIdCricket.data!.squad![index].bowlingstyle.toString(),
                                         squadByTeamidSeasonIdCricket.data!.squad![index].position!.name.toString(),

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
                                       squadByTeamidSeasonIdCricket.data!.squad![index].imagePath.toString().contains("png")?
                                       Image.network(

                                         squadByTeamidSeasonIdCricket.data!.squad![index].imagePath.toString()
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
                                     Column(
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       children: [
                                         Text(squadByTeamidSeasonIdCricket.data!.squad![index].fullname.toString(),style: TextStyle(color: Colors.white),),
                                         Text(squadByTeamidSeasonIdCricket.data!.squad![index].position!.name.toString().substring(5).toLowerCase(),style: TextStyle(color: Colors.white),)

                                       ],
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
                      isLoading8==false && isLoading3==false?
                      Container(
                        margin: EdgeInsets.all(10),

                        child: Text(oppositeteamByIdFootball1.data!.name!+" Squad",style: TextStyle(color: Colors.white),),
                      ):Container(),
                      isLoading8==false?
                      Container(
                        height: 100,
                        width: width,
                        child:
                        ListView.builder(

                            scrollDirection: Axis.horizontal,
                            itemCount: squadByTeamidSeasonIdCricket1.data!.squad!.length,
                            itemBuilder: (context,index){
                              return
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => PlayerDetailsCricket(
                                          squadByTeamidSeasonIdCricket1.data!.squad![index].id.toString(),
                                          squadByTeamidSeasonIdCricket1.data!.squad![index].firstname.toString(),
                                          squadByTeamidSeasonIdCricket1.data!.squad![index].lastname.toString(),
                                          squadByTeamidSeasonIdCricket1.data!.squad![index].fullname.toString(),
                                          squadByTeamidSeasonIdCricket1.data!.squad![index].imagePath.toString(),
                                          squadByTeamidSeasonIdCricket1.data!.squad![index].dateofbirth.toString(),
                                          squadByTeamidSeasonIdCricket1.data!.squad![index].battingstyle.toString(),
                                          squadByTeamidSeasonIdCricket1.data!.squad![index].bowlingstyle.toString(),
                                          squadByTeamidSeasonIdCricket1.data!.squad![index].position!.name.toString(),
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
                                          squadByTeamidSeasonIdCricket1.data!.squad![index].imagePath.toString().contains("png")?
                                          Image.network(

                                            squadByTeamidSeasonIdCricket1.data!.squad![index].imagePath.toString()
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

                                          //   Text("No Image",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)
                                          ,
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(squadByTeamidSeasonIdCricket1.data!.squad![index].fullname.toString(),style: TextStyle(color: Colors.white),),
                                            Text(squadByTeamidSeasonIdCricket1.data!.squad![index].position!.name.toString().substring(5).toLowerCase(),style: TextStyle(color: Colors.white),)
                                          ],
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
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        // margin: EdgeInsets.only(left: 40,top: 10,right: 40),
                        child: Row(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Venue : ",style: TextStyle(color: Colors.white,fontSize: 20),),

                            isLoading4==false?
                            Flexible(
                              child: Text(
                                venueByIdFootball.data!.name.toString()
                                ,style: TextStyle(color: Colors.white,fontSize: 20),
                              ),
                            )
                                : Text("")
                            ,








                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),

                        padding: EdgeInsets.symmetric(horizontal: 20),
                        // margin: EdgeInsets.only(left: 40,top: 10,right: 40),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("City : ",style: TextStyle(color: Colors.white,fontSize: 20),),

                            isLoading4==false?
                            Flexible(
                              child: Text(
                                venueByIdFootball.data!.city.toString()
                                ,style: TextStyle(color: Colors.white,fontSize: 20),
                              ),
                            )
                                : Text("")
                            ,








                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),

                        padding: EdgeInsets.symmetric(horizontal: 20),
                        // margin: EdgeInsets.only(left: 40,top: 10,right: 40),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Capacity : ",style: TextStyle(color: Colors.white,fontSize: 20),),

                            isLoading4==false?
                            Flexible(
                              child: Text(
                                venueByIdFootball.data!.capacity.toString()
                                ,style: TextStyle(color: Colors.white,fontSize: 20),
                              ),
                            )
                                : Text("")
                            ,








                          ],
                        ),
                      ),

                      isLoading4==false?
                      Container(
                        height: height*0.4,
                        width: width,
                        child: Image.network(
                          venueByIdFootball.data!.imagePath.toString()
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
                          :
                      Container()
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
