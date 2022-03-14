import 'package:basketballinsider/models/cricket_live.dart';
import 'package:basketballinsider/models/football_live.dart';
import 'package:basketballinsider/models/leage_by_id_cricket.dart';
import 'package:basketballinsider/models/leage_by_id_football.dart';
import 'package:basketballinsider/models/team_by_id_football.dart';
import 'package:basketballinsider/services/cricket_service.dart';
import 'package:basketballinsider/services/football_service.dart';
import 'package:basketballinsider/services/get_leage_by_id_cricket.dart';
import 'package:basketballinsider/services/get_team_by_id_football.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CricketLiveScoreScreen extends StatefulWidget {
  const CricketLiveScoreScreen({Key? key}) : super(key: key);

  @override
  _CricketLiveScoreScreenState createState() => _CricketLiveScoreScreenState();
}

class _CricketLiveScoreScreenState extends State<CricketLiveScoreScreen> {

  bool isLoading = false;
  late CricketLiveScore footballLiveScore;
  bool isLoading1 = true;
  bool isLoading2 = true;
  bool isLoading3 = true;

  late GetLeagueByIdCricket leage;
  late TeamByIdFootball teamByIdFootball;
  late TeamByIdFootball oppositeteamByIdFootball1;

  getData() async{
    setState(() {
      isLoading = true;
    });
    CricketLiveScore? temp;
    CricketLiveScoreServices.getUsers().then((sites){
      temp = sites;
       getLeagebyId(temp!.data[0].venueId.toString());
      print(temp!.data[0].leagueId);

      // getTeambyId(temp!.data[0].localteamId.toString());
      // getOppositeTeambyId(temp!.data[0].visitorteamId.toString());
      // print(temp!.data[0].localteamId.toString());
      setState(() {
        footballLiveScore = sites!;
        isLoading = false;
      });
    });
  }

  getLeagebyId(String Id) async{
    setState(() {
      isLoading1 = true;
    });
    GetLeageByIdCricketServices.getUsers(Id).then((sites){
      setState(() {
        leage = sites!;
        print(leage);
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


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
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
                              Text(isLoading2==false ?
                            //  leage.data.name
                              // teamByIdFootball.data.name
                              ""
                                  :
                              ""
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
                                      Container()

                                      // Image.network(
                                      //   teamByIdFootball.data.logoPath,
                                      //   fit: BoxFit.cover,
                                      //   height: height*.48*.51,
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
                                      // )
                                          :
                                      Container()
                                    // Image.asset('graphic_res/India.png',fit: BoxFit.cover,),
                                  ),//TODO put image here
                                  Text(""

                                      // teamByIdFootball.data.name
                                      ,style: TextStyle(color: Colors.white)),

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
                                    Container()

                                    // Image.network(
                                    //   oppositeteamByIdFootball1.data.logoPath,
                                    //   fit: BoxFit.cover,
                                    //   height: height*.48*.51,
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
                                    // )
                                        : Container(),
                                    // Image.asset('graphic_res/england.png',fit: BoxFit.cover,)
                                  ),//TODO put image here
                                  Text(
                                      // oppositeteamByIdFootball1.data.name
                                      ""
                                      ,style: TextStyle(color: Colors.white)),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20,top: 10),
                          child: Text("Match Details ",style: TextStyle(color: Colors.white,fontSize: 20),),
                        ),

                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: height*0.4,
                          width: width,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    height: height*0.1,
                                    width: width*0.5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text("Ind",style: TextStyle(color: Colors.white,fontSize: 20)),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              Text("23-1",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600)),
                                              SizedBox(width: 5,),
                                              Text("(4.4)",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500)),

                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,

                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                    height: height*0.1,
                                    width: width*0.5,
                                    child: Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text("CRR",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400)),
                                              SizedBox(height: 5,),
                                              Text("4.93",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400)),

                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text("REQ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400)),
                                              SizedBox(height: 5,),
                                              Text("8.29",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400)),

                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: height*0.07,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Divider(color: Colors.white,),
                                    Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20),
                                        child: Text("TAR 150   PSHIP 23(23)",style: TextStyle(color: Colors.white,fontSize: 18))),
                                    Divider(color: Colors.white,),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: height*0.23,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: width*0.3,
                                            child: Text("Batter",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("R",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("R",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("R",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("R",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.2,
                                            child: Text("R",style: TextStyle(color: Colors.white,fontSize: 16))),



                                      ],
                                    ),
                                    Divider(color: Colors.white,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: width*0.3,
                                            child: Text("Virat Kohli",style: TextStyle(color: Colors.white70,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("18",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("13",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("2",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("4",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.2,
                                            child: Text("138.5",style: TextStyle(color: Colors.white,fontSize: 16))),



                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: width*0.3,
                                            child: Text("Virat Kohli",style: TextStyle(color: Colors.white70,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("18",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("13",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("2",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("4",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.2,
                                            child: Text("138.5",style: TextStyle(color: Colors.white,fontSize: 16))),



                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: width*0.3,
                                            child: Text("Bowler",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("R",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("R",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("R",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("R",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.2,
                                            child: Text("R",style: TextStyle(color: Colors.white,fontSize: 16))),



                                      ],
                                    ),
                                    Divider(color: Colors.white,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: width*0.3,
                                            child: Text("Virat Kohli",style: TextStyle(color: Colors.white70,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("18",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("13",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("2",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.1,
                                            child: Text("4",style: TextStyle(color: Colors.white,fontSize: 16))),
                                        Container(
                                            width: width*0.2,
                                            child: Text("138.5",style: TextStyle(color: Colors.white,fontSize: 16))),



                                      ],
                                    ),

                                  ],
                                ),
                              ),

                            ],
                          ),


                        ),


                        Container(
                          margin: EdgeInsets.only(left: 20,top: 10),
                          alignment: Alignment.topLeft,
                          child: Text("History Details",style: TextStyle(color: Colors.white,fontSize: 20),),
                        ),

                        Container(
                          padding: EdgeInsets.all(40),
                          height: height*0.21,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        height: height*0.07,
                                        child: Image.asset("graphic_res/India.png",fit: BoxFit.contain,)),
                                    Text("India",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),)
                                  ],
                                ),
                              ),
                              Container(

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("2 - 8",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w700),),
                                    Text("90.1",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600))

                                  ],
                                ),
                              ),
                              Container(

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        height: height*0.07,
                                        child: Image.asset("graphic_res/england.png",fit: BoxFit.contain,)),
                                    Text("England",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),)
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          height: height*0.33,
                          child: Column(
                            children: [
                              Text("Match Details",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w700),),
                              Container(
                                margin: EdgeInsets.only(top: 20),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 70,vertical: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("8",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                                          Text("Shooting",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                                          Text("12",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),

                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 70,vertical: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("22",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                                          Text("Attack",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                                          Text("29",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),

                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 70,vertical: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("8",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                                          Text("Shooting",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                                          Text("12",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),

                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 70,vertical: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("8",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                                          Text("Shooting",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                                          Text("12",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),

                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 70,vertical: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("8",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                                          Text("Shooting",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                                          Text("12",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),

                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              )

                            ],
                          ),

                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: height*0.21,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Divider(color: Colors.white,thickness: 1,),
                              Text("Barcelona Wins or Draw",style: TextStyle(color: Colors.white,fontSize: 20),),
                              Divider(color: Colors.white,thickness: 1,),
                              Text("Estimated Wins Rate - ",style: TextStyle(color: Colors.white,fontSize: 20),),
                              Divider(color: Colors.white,thickness: 1,),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          height: height*0.20,
                          color: Color(0xff57bbb4),
                          child: Column(

                            children: [
                              Text("Head to Head",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),
                              Container(

                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset("graphic_res/India.png",height: 70,width: 70,),
                                    Column(
                                      children: [
                                        Container(
                                          height: height*0.1,
                                          child:
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("10",style: TextStyle(color: Colors.white,fontSize: 18),),
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
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("4",style: TextStyle(color: Colors.white,fontSize: 18),),
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
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("5",style: TextStyle(color: Colors.white,fontSize: 18),),
                                              Text("Wins",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                    Image.asset("graphic_res/england.png",height: 70,width: 70,),


                                  ],
                                ),
                              )
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
