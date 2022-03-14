import 'package:basketballinsider/models/fixture_by_id_football.dart' as v1;
import 'package:basketballinsider/models/head_to_head_football.dart' as v2;
import 'package:basketballinsider/services/get_fixture_by_id_football.dart';
import 'package:basketballinsider/services/head_to_head_football_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

import '../home.dart';
import '../previous_match_data_football.dart';
import 'football_squad.dart';

class FootballMainUpcoimgScreen extends StatefulWidget {
 // const FootballMainScreen({Key? key}) : super(key: key);

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


  FootballMainUpcoimgScreen(
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
      this.visitorTeamId);

  @override
  _FootballMainUpcoimgScreenState createState() => _FootballMainUpcoimgScreenState();
}

class _FootballMainUpcoimgScreenState extends State<FootballMainUpcoimgScreen> {


  bool isLoading = true;
  late v1.FixturesByIdFootball football;


  bool isLoading1 = true;
  late v2.HeadToHeadFootball headToHeadFootball;


  bool isLoading2=true;

  int win1 = 0;
  int draw = 0;
  int win2 = 0;

  getStatistics(){
    setState(() {
      isLoading=true;
    });

    GetFixtureByIdFootballService.getUsers(widget.id).then((sites) {
        print(sites);
        if(sites!=null){
          setState(() {
            if(sites.data!.stats!.data!.length==0){

            }else{
              isLoading2=false;
            }

            print(sites);
            football=sites;
            isLoading=false;

          });

        }
    });

  }

  getHeadtoHead(){
    setState(() {
      isLoading1=true;
    });
    HeadToHeadFootballService.getUsers(widget.localTeamId, widget.visitorTeamId).then((sites) {
      print(sites);
      if(sites!=null){
        print(sites);
        headToHeadFootball=sites;
        isLoading1=false;
        if (headToHeadFootball.data?.length != 0) {
          for (int i = 0; i < headToHeadFootball.data!.length; i++) {
            print(headToHeadFootball.data![i].id.toString());

            // print(headToHeadFootball.data!.length.toString());
            if (headToHeadFootball.data![i].winnerTeamId.toString() == widget.localTeamId) {
              setState(() {
                win1 = win1 + 1;
                // print(win1);
              });
            } else
            if (headToHeadFootball.data![i].winnerTeamId.toString() == widget.visitorTeamId) {
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
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStatistics();
    getHeadtoHead();
  }


  @override
  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double barheight =AppBar().preferredSize.height;
    double height = height1-safe-barheight;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom:   TabBar(
                isScrollable: true,
                labelColor: Colors.white,
                tabs: [
                  Tab(text: "INFO",),
                  Tab(text: "STATISTICS",),
                  Tab(text: "HEAD TO HEAD",),

                ]),
            centerTitle: true,
            leading: IconButton(
              onPressed: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:
                        (context) =>
                        HomeScreen()
                    )
                );
                // Navigator.pop(context);
              },
              icon: Icon(FontAwesomeIcons.arrowLeft),
              color: Colors.white,),
            backgroundColor: Color(0xff083471),
            title:
         //       Text(""),
            FittedBox(child: Text(widget.localTeamName+ "  vs  "+widget.visitorTeamName + "\n" ,style: TextStyle(color: Colors.white),)),
            actions: [
              Container(
                  padding: EdgeInsets.only(right: 5),
                  child: IconButton(
                    onPressed: (){
                      Share.share("https://new-onlineoffers.com/wp-json/wp/v2/share_action?match_id="+widget.id+"&matchType=Football");
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
                        //   +widget.id
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
                              // Row(
                              //   children: [
                              //     Container(
                              //         width: width*0.3,
                              //         child: Text("Match",style: TextStyle(color: Colors.white),)),
                              //     Container(
                              //         child: Text(widget.round,style: TextStyle(color: Colors.white),)),
                              //
                              //   ],
                              // ),
                              Row(
                                children: [
                                  Container(
                                      width: width*0.3,
                                      child: Text("Leage",style: TextStyle(color: Colors.white),)),
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
                                  // if(isLoading0==false){
                                    Navigator.push(context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FootballSquadScreen(widget.localTeamId,widget.localTeamName)
                                        )
                                    );
                                  // }
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
                                  // if(isLoading0==false){
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FootballSquadScreen(widget.visitorTeamId,widget.visitorTeamName)
                                      )
                                  );
                                  // }
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
                  ),
               // isLoading==false && isLoading2==false?
               Container(
                 child: Column(
                   children: [
                     Container(
                       padding: EdgeInsets.symmetric(horizontal: 20),
                       height: height*0.2,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                               ),


                           ),
                           Container(
                             child: Text("Vs",style: TextStyle(color:Colors.white),),
                           ),
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
                             ),


                           ),
                         ],
                       ),
                     ),
                     Container(
                       height: height*0.6,
                       child: Center(child: Text("Match not started yet",style: TextStyle(color:Colors.white),)),
                     )

                   ],
                 ),


               )
                   ,
               // Container(child: Center(child: Text("Match is not started yet",style: TextStyle(color: Colors.white),),),),
                isLoading1==false?
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: height*0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              ),


                            ),
                            Container(
                              child: Text("Vs",style: TextStyle(color:Colors.white),),
                            ),

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
                              ),


                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        height: height*0.1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
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
                      Container(
                        padding: EdgeInsets.only(bottom: 0),
                        height: height*0.6,
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
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => PreviousMatchDataFootballScreen(
                                        // venueByIdFootball.data.name,
                                        headToHeadFootball.data![index].id!,
                                        widget.localTeamLogo,
                                        widget.visitorTeamLogo,
                                        widget.localTeamName,
                                        widget.visitorTeamName,
                                        widget.leage,
                                        football.data!.standings!.visitorteamPosition.toString(),
                                        football.data!.standings!.visitorteamPosition.toString(),
                                        widget.vCity,
                                        widget.vCapacity,
                                        widget.vImagepath,
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
                                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                  height: height*0.07,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(headToHeadFootball.data![index].scores!.localteamScore.toString(),style: TextStyle(color:Color(0xff083471),fontSize: 16),),
                                      Text(headToHeadFootball.data![index].time!.startingAt!.date!.toString(),style: TextStyle(color:Color(0xff083471))),
                                      Text(headToHeadFootball.data![index].scores!.visitorteamScore.toString(),style: TextStyle(color:Color(0xff083471),fontSize: 16)),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ) : Container(child: Center(child: Text("No Data Available",style: TextStyle(color: Colors.white),),),),

              ],
            ),
          ),


        ));
  }
}
