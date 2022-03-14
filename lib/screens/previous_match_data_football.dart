import 'package:basketballinsider/models/leage_by_id_football.dart';
import 'package:basketballinsider/models/round_by_id_football.dart';
import 'package:basketballinsider/models/team_by_id_football.dart';
import 'package:basketballinsider/models/venue_id_football.dart';
import 'package:basketballinsider/services/get_fixture_by_id_football.dart';
import 'package:basketballinsider/services/get_leage_by_id_football.dart';
import 'package:basketballinsider/services/get_round_by_id_football.dart';
import 'package:basketballinsider/services/get_team_by_id_football.dart';
import 'package:basketballinsider/services/get_venue_by_id_football.dart';
import 'package:flutter/material.dart';
import 'package:basketballinsider/models/fixture_by_id_football.dart' as v1;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class PreviousMatchDataFootballScreen extends StatefulWidget {
  //const PreviousMatchDataFootballScreen({Key? key}) : super(key: key);
  late int id;
  late String localteamlogo;
  late String visitorteamlogo;
  late String localteamname;
  late String visitorteamname;
  late String leagename;
  late String standings00;
  late String standings11;
  late String city;
  late String capacity;
  late String stadium_image;
  late String localteamformation;
  late String visitorteamformation;
  late String localteamScore;
  late String visitorteamScrore;
  late String ht_score;
  late String ft_score;


  PreviousMatchDataFootballScreen(
      this.id,
      this.localteamlogo,
      this.visitorteamlogo,
      this.localteamname,
      this.visitorteamname,
      this.leagename,
      this.standings00,
      this.standings11,
      this.city,
      this.capacity,
      this.stadium_image,
      this.localteamformation,
      this.visitorteamformation,
      this.localteamScore,
      this.visitorteamScrore,
      this.ht_score,
      this.ft_score); // PreviousMatchDataFootballScreen(
  //     this.id,
  //     this.localteamlogo,
  //     this.visitorteamlogo,
  //     this.localteamname,
  //     this.visitorteamname,
  //     this.leagename,
  //     this.standings00,
  //     this.standings11,
  //     this.city,
  //     this.capacity,
  //     this.stadium_image); // PreviousMatchDataFootballScreen(this.id);
  @override
  _PreviousMatchDataFootballScreenState createState() => _PreviousMatchDataFootballScreenState();
}

class _PreviousMatchDataFootballScreenState extends State<PreviousMatchDataFootballScreen> {

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
  bool data2 = true;

  late Leage leage;
  late TeamByIdFootball teamByIdFootball;
  late TeamByIdFootball oppositeteamByIdFootball1;
  late VenueByIdFootball venueByIdFootball;
  late RoundByIdFootball roundByIdFootball;

  getFixtureById() async{
    setState(() {
      isLoading = true;
    });
    print(widget.id.toString());
    GetFixtureByIdFootballService.getUsers(widget.id.toString()).then((sites){
      print(sites);
      if(sites!=null) {
        setState(() {
          data1=true;
          print("dd");

          fixturesByIdFootball = sites;
          if(fixturesByIdFootball.data!.stats!.data!.length==0){
            data2=false;
          }
          print("scores ==  "+fixturesByIdFootball.data!.id.toString());

          getLeagebyId(
              fixturesByIdFootball.data!.leagueId.toString());
          getTeambyId(
              fixturesByIdFootball.data!.localteamId.toString());
          getOppositeTeambyId(
              fixturesByIdFootball.data!.visitorteamId.toString());
          getVenueById(fixturesByIdFootball.data!.venueId.toString());
          getRoundById(fixturesByIdFootball.data!.roundId.toString());
          isLoading = false;
        });
      }else{
        setState(() {
          data1 = false;
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
        title: Text("Previous Match",style: TextStyle(color: Colors.black),),
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
                                    // isLoading2==false?
                                    Image.network(
                                      widget.visitorteamlogo,
                                      // teamByIdFootball.data!.logoPath!,
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
                                    //     :
                                    // Container()
                                  // Image.asset('graphic_res/India.png',fit: BoxFit.cover,),
                                ),//TODO put image here
                                Text(
                                     // isLoading2==false?
                                  // teamByIdFootball.data!.name!
                                   widget.visitorteamname
                                        // :"Loading..."
                                    , style: TextStyle(color: Colors.white)),

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
                                  // isLoading3==false?
                                  Image.network(
                                    widget.localteamlogo,
                                    // oppositeteamByIdFootball1.data!.logoPath!,
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
                                      // : Container(),
                                  // Image.asset('graphic_res/england.png',fit: BoxFit.cover,)
                                ),//TODO put image here
                                Text(
                                    // isLoading3==false?
                                widget.localteamname
                                        // :"Loading..."
                                    , style: TextStyle(color: Colors.white)),
                              ],
                            )
                          ],
                        ),
                      ),
                      // Container(
                      //   height: height*0.08,
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       Text(isLoading1==false ?
                      //       leage.data.name
                      //       // teamByIdFootball.data.name
                      //           :
                      //       "Loading..."
                      //         ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                      //     ],
                      //   ),
                      // ),
                    data1==true && data2==true?
                      Column(
                        children: [
                          Container(
                            height: height*0.08,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(isLoading==false?
                                fixturesByIdFootball.data!.stats!.data![0].goals.toString()
                                // teamByIdFootball.data.name
                                    :
                                "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                Text(
                                  "Goals"
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                Text(isLoading==false?

                                fixturesByIdFootball.data!.stats!.data![1].goals.toString()
                                // teamByIdFootball.data.name
                                    :
                                "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),

                              ],
                            ),
                          ),
                          Container(
                            height: height*0.08,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(isLoading==false?

                                fixturesByIdFootball.data!.stats!.data![0].fouls.toString()
                                // teamByIdFootball.data.name
                                    :
                                "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                Text(
                                  "Fouls"
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                Text(isLoading==false?

                                fixturesByIdFootball.data!.stats!.data![1].fouls.toString()
                                // teamByIdFootball.data.name
                                    :
                                "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),

                              ],
                            ),
                          ),
                          Container(
                            height: height*0.08,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(isLoading==false?

                                fixturesByIdFootball.data!.stats!.data![0].corners.toString()
                                // teamByIdFootball.data.name
                                    :
                                "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                Text(
                                  "Corners"
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                Text(isLoading==false?

                                fixturesByIdFootball.data!.stats!.data![1].corners.toString()
                                // teamByIdFootball.data.name
                                    :
                                "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),

                              ],
                            ),
                          ),
                          Container(
                            height: height*0.08,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(isLoading==false?

                                fixturesByIdFootball.data!.stats!.data![0].shots!.total.toString()
                                // teamByIdFootball.data.name
                                    :
                                "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                Text(
                                  "Total Shots"
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                Text(isLoading==false?

                                fixturesByIdFootball.data!.stats!.data![1].shots!.total.toString()
                                // teamByIdFootball.data.name
                                    :
                                "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),

                              ],
                            ),
                          ),
                          Container(
                            height: height*0.08,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(isLoading==false?

                                fixturesByIdFootball.data!.stats!.data![0].shots!.ongoal.toString()
                                // teamByIdFootball.data.name
                                    :
                                "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                Text(
                                  "OnGoal Shots"
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                Text(isLoading==false?

                                fixturesByIdFootball.data!.stats!.data![1].shots!.ongoal.toString()
                                // teamByIdFootball.data.name
                                    :
                                "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),

                              ],
                            ),
                          ),
                          Container(
                            height: height*0.08,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(isLoading==false?

                                fixturesByIdFootball.data!.stats!.data![0].offsides.toString()
                                // teamByIdFootball.data.name
                                    :
                                "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                Text(
                                  "Offsides"
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                Text(isLoading==false?

                                fixturesByIdFootball.data!.stats!.data![1].offsides.toString()
                                // teamByIdFootball.data.name
                                    :
                                "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),

                              ],
                            ),
                          ),

                          Container(
                            height: height*0.08,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(isLoading==false?

                                fixturesByIdFootball.data!.stats!.data![0].yellowcards.toString()
                                // teamByIdFootball.data.name
                                    :
                                "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                Text(
                                  "Yellow Card"
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                Text(isLoading==false?

                                fixturesByIdFootball.data!.stats!.data![1].yellowcards.toString()
                                // teamByIdFootball.data.name
                                    :
                                "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),

                              ],
                            ),
                          ),
                          Container(
                            height: height*0.08,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(isLoading==false?

                                fixturesByIdFootball.data!.stats!.data![0].redcards.toString()
                                // teamByIdFootball.data.name
                                    :
                                "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                Text(
                                  "Red Card"
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                Text(isLoading==false?

                                fixturesByIdFootball.data!.stats!.data![1].redcards.toString()
                                // teamByIdFootball.data.name
                                    :
                                "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),

                              ],
                            ),
                          ),
                          Container(
                            height: height*0.08,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(isLoading==false?

                                fixturesByIdFootball.data!.stats!.data![0].possessiontime.toString()+" %"
                                // teamByIdFootball.data.name
                                    :
                                "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                Text(
                                  "Ball Possession %"
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                                Text(isLoading==false?

                                fixturesByIdFootball.data!.stats!.data![1].possessiontime.toString()+ " %"
                                // teamByIdFootball.data.name
                                    :
                                "Loading..."
                                  ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),

                              ],
                            ),
                          ),
                        ],
                      )
                      :

                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 80,top: 10,right: 80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.localteamScore,style: TextStyle(color: Colors.white,fontSize: 20),),
                                  Text("Score",style: TextStyle(color: Colors.white,fontSize: 20),),
                                  Text(widget.visitorteamScrore,style: TextStyle(color: Colors.white,fontSize: 20),),

                                ],
                              ),
                            ),
                            // Container(
                            //   alignment: Alignment.topLeft,
                            //   margin: EdgeInsets.only(left: 40,top: 10,right: 40),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Text(
                            //         widget.localteamformation,style: TextStyle(color: Colors.white,fontSize: 20),),
                            //       Text("Formation",style: TextStyle(color: Colors.white,fontSize: 20),),
                            //       Text(widget.visitorteamformation,style: TextStyle(color: Colors.white,fontSize: 20),),
                            //
                            //     ],
                            //   ),
                            // ),

                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(left: 80,top: 10,right: 80),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.standings00,style: TextStyle(color: Colors.white,fontSize: 20),),
                                  Text("Standings",style: TextStyle(color: Colors.white,fontSize: 20),),
                                  Text(widget.standings11,style: TextStyle(color: Colors.white,fontSize: 20),),

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
                                    "Full Time  "
                                    ,style: TextStyle(color: Colors.white,fontSize: 20),),
                                  Text(widget.ft_score,style: TextStyle(color: Colors.white,fontSize: 20),),
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
                                    "Half Time  "
                                    ,style: TextStyle(color: Colors.white,fontSize: 20),),
                                  Text(
                                    widget.ht_score==null?
                                    widget.ht_score:"-  ",style: TextStyle(color: Colors.white,fontSize: 20),),
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
                                  Text(widget.city,style: TextStyle(color: Colors.white,fontSize: 20),),
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
                                  Text(widget.capacity,style: TextStyle(color: Colors.white,fontSize: 20),),
                                ],
                              ),
                            ),

                            Container(
                              height: height*0.4,
                              width: width,
                              child: Image.network(
                                widget.stadium_image
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

                            ,
                          ],
                        )

                        // Container(
                        //   child: Text("data not available",style: TextStyle(color: Colors.white),),
                        // )
                      ,
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
