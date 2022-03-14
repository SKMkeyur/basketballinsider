import 'dart:async';
import 'dart:math';
import 'package:basketballinsider/models/cricket.dart';
import 'package:basketballinsider/models/fixtures_by_date_range_cricket.dart' as v2;
import 'package:basketballinsider/models/fixtures_by_date_range_football.dart' as v1;
import 'package:basketballinsider/models/football.dart';
import 'package:basketballinsider/models/leage_by_id_cricket.dart';
import 'package:basketballinsider/models/leage_by_id_football.dart';
import 'package:basketballinsider/models/round_by_id_football.dart';
import 'package:basketballinsider/models/services.dart';
import 'package:basketballinsider/models/sites.dart';
import 'package:basketballinsider/models/team_by_id_cricket.dart';
import 'package:basketballinsider/models/team_by_id_football.dart';
import 'package:basketballinsider/models/venue_id_football.dart';
import 'package:basketballinsider/screens/aboutus.dart';
import 'package:basketballinsider/screens/betdescription.dart';
import 'package:basketballinsider/screens/comparison.dart';
import 'package:basketballinsider/screens/faqs.dart';
import 'package:filter_list/filter_list.dart';
import 'fixture_match_data_football_upcoming.dart';
import 'package:basketballinsider/screens/fixture_match_data_cricket_upcoming.dart';
import 'package:basketballinsider/screens/review.dart';
import 'package:basketballinsider/screens/review01.dart';
import 'package:basketballinsider/services/get_fixtures_by_date_range_cricket.dart';
import 'package:basketballinsider/services/get_fixtures_by_date_range_football.dart';
import 'package:basketballinsider/services/get_leage_by_id_cricket.dart';
import 'package:basketballinsider/services/get_leage_by_id_football.dart';
import 'package:basketballinsider/services/get_team_by_id_cricket.dart';
import 'package:basketballinsider/services/get_team_by_id_football.dart';
import 'package:basketballinsider/widgets/card.dart';
import 'package:basketballinsider/widgets/starrating.dart';
import 'package:basketballinsider/widgets/starratting02.dart';
import 'package:flutter/material.dart';
import 'package:basketballinsider/models/options.dart';
import 'package:basketballinsider/screens/getstarted02.dart';
import 'package:basketballinsider/screens/getstarted01.dart';
import 'package:basketballinsider/screens/getstarted03.dart';
import 'package:basketballinsider/screens/getstarted04.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:weather/weather.dart';
import 'package:intl/intl.dart';

class Home03 extends StatefulWidget {
  const Home03({Key? key}) : super(key: key);

  @override
  _Home03State createState() => _Home03State();
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

  FT(this.id, this.localTeamLogo, this.localTeamName, this.visitorTeamLogo,
      this.visitorTeamName, this.leage, this.date, this.time, this.timzone,
      this.status,this.ft);

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


class _Home03State extends State<Home03> {



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
                "C"
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
              "F"
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
     // getFixtureByDateRangeCricket();
     getCricket();
     //getFootball();
   //  getTeam();

  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double barheight =AppBar().preferredSize.height;
    double height = height1-safe;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body:  Container(
          height: height,
          color: Colors.black,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: height*0.1,
                child: InkWell(
                    onTap: (){
                      openFilterDialog();
                    },
                    child: Visibility(
                        visible: true,
                        child: Icon(Icons.filter_list,color: Colors.white,))),
              ),

              Container(
                height: height*0.2,
                child: isLoading0==false && isLoading0c==false?
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: list11.length,
                    itemBuilder: (context,index){
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

                  return Container(
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

                  );
                })
                :Container()
              )
           


              // Container(
              //   height: height*0.2,
              //   // color: Colors.red,
              //   child:
              //   isLoading0c == false ?
              //                 ListView.builder(
              //                     scrollDirection: Axis.horizontal,
              //                     itemCount: list.length,
              //                     itemBuilder: (context,index){
              //                       int i = index - fixturesByDateRangeCricket.data!.length;
              //                       return
              //                       index<fixturesByDateRangeCricket.data!.length?
              //                         InkWell(
              //                         onTap: () {
              //                           Navigator.push(context,
              //                               MaterialPageRoute(
              //                                   builder: (context) =>
              //                                       FixtureMatchDataFootballUpcomingScreen(fixturesByDateRangeCricket.data![index].id!)
              //                               )
              //                           );
              //                         }
              //                         ,
              //                         child: Container(
              //
              //                           margin: EdgeInsets.symmetric(horizontal: 5),
              //                           padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              //                           decoration: BoxDecoration(
              //                             color: Color(0xff083471),
              //                             borderRadius: BorderRadius.all(Radius.circular(20)),
              //                           ),
              //                           height: height*0.2,
              //                           width: width*0.8,
              //                           child: Column(
              //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                             children: [
              //                               Row(
              //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                                 children: [
              //                                   Text(
              //                                     fixturesByDateRangeCricket.data![index].startingAt!.day.toString()+ " "+
              //                                         monthsInYear1[fixturesByDateRangeCricket.data![index].startingAt!.month]!
              //                                     // fixturesByDateRangeCricket.data![index].time!.startingAt!.date!.day.toString()+" "+
              //                                     //   monthsInYear[fixturesByDateRangeCricket.data![index].time!.startingAt!.date!.month]!
              //
              //                                     ,style: TextStyle(color: Colors.white),),
              //                                   Text(
              //
              //                                       isLoading1c==false?
              //                                       leaguec[index].toString()
              //                                       // fixturesByDateRangeFootball.data![index].leagueId.toString()
              //                                       // leaguesname[index]
              //                                           :""
              //
              //                                       ,style: TextStyle(color: Colors.white,fontSize: 12)),
              //                                   Row(
              //                                     crossAxisAlignment: CrossAxisAlignment.center,
              //                                     children: [
              //                                       Icon(FontAwesomeIcons.dotCircle,color: Colors.orange,size: 14,),
              //                                       Text(" Upcoming",style: TextStyle(color: Colors.orange)),
              //                                     ],
              //                                   )
              //                                 ],
              //                               ),
              //                               Row(
              //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                                 children: [
              //                                   Container(
              //                                     alignment: Alignment.center,
              //                                     width: width*0.25,
              //                                     child: Column(
              //                                       children: [
              //                                         Container(
              //                                           width: width*0.1,
              //                                           height: 50,
              //                                           child:  isLoading6c==false?
              //                                           Image.network(
              //                                             localteamlogoc[index].toString()
              //                                             // teamlogo[index]
              //
              //                                             // teamlogo1[0].logolink.toString()
              //                                             ,
              //                                             fit: BoxFit.contain,
              //                                             height: height*.48*.51,
              //                                             loadingBuilder: (BuildContext context, Widget child,
              //                                                 ImageChunkEvent? loadingProgress) {
              //                                               if (loadingProgress == null) return child;
              //                                               return Center(
              //                                                 child: CircularProgressIndicator(
              //                                                   value: loadingProgress.expectedTotalBytes != null
              //                                                       ? loadingProgress.cumulativeBytesLoaded /
              //                                                       loadingProgress.expectedTotalBytes!
              //                                                       : null,
              //                                                 ),
              //                                               );
              //                                             },
              //                                           )
              //                                               :
              //                                           Container(
              //                                             // color: Colors.red,
              //                                           ),
              //                                         ),//TODO put image here
              //                                         Text(isLoading6c==false?
              //                                         localteamc[index].toString()
              //                                         // fixturesByDateRangeFootball.data![index].localteamId.toString()
              //                                         // teamname[index]
              //                                             : "" ,style: TextStyle(color: Colors.white)),
              //
              //                                       ],
              //                                     ),
              //                                   ),
              //                                   Container(
              //                                       width: width*0.2,
              //                                       height: 50,
              //                                       child: Opacity(
              //                                           opacity: 0.4,
              //                                           child: Image.asset("graphic_res/cricket_1.png",fit: BoxFit.contain,))),
              //                                   Container(
              //                                     // color: Colors.red,
              //                                     width: width*0.25,
              //                                     alignment: Alignment.center,
              //
              //                                     child: Column(
              //                                       children: [
              //                                         Container(
              //                                           width: width*0.1,
              //                                           height: 50,
              //                                           child: isLoading7c==false?
              //                                           Image.network(
              //                                             visitorteamlogoc[index].toString()
              //                                             // oppositeteamlogo[index]
              //                                             ,
              //                                             fit: BoxFit.contain,
              //                                             height: height*.48*.51,
              //                                             loadingBuilder: (BuildContext context, Widget child,
              //                                                 ImageChunkEvent? loadingProgress) {
              //                                               if (loadingProgress == null) return child;
              //                                               return Center(
              //                                                 child: CircularProgressIndicator(
              //                                                   value: loadingProgress.expectedTotalBytes != null
              //                                                       ? loadingProgress.cumulativeBytesLoaded /
              //                                                       loadingProgress.expectedTotalBytes!
              //                                                       : null,
              //                                                 ),
              //                                               );
              //                                             },
              //                                           )
              //                                               :
              //                                           Container(),
              //                                           // Image.asset('graphic_res/england.png'),
              //                                         ),//TODO put image here
              //                                         Text(
              //                                             isLoading7c==false?
              //                                             visitorteamc[index]!
              //                                             // fixturesByDateRangeFootball.data![index].visitorteamId.toString()
              //                                             // oppositeteamname[index]
              //                                                 : "",style: TextStyle(color: Colors.white)),
              //
              //                                       ],
              //                                     ),
              //                                   )
              //                                 ],
              //                               ),
              //                               Divider(height: height*0.011,color: Colors.white,thickness: height*0.0029,),
              //                               Row(
              //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                                 children: [
              //                                   Text(
              //                                       fixturesByDateRangeCricket.data![index].startingAt!.hour >12 ?
              //                                       (fixturesByDateRangeCricket.data![index].startingAt!.hour-12).toString() + " PM"
              //                                           :
              //                                       fixturesByDateRangeCricket.data![index].startingAt!.hour==12?
              //                                       (fixturesByDateRangeCricket.data![index].startingAt!.hour).toString() + " PM"
              //                                           :
              //                                       (fixturesByDateRangeCricket.data![index].startingAt!.hour).toString() + " AM"
              //
              //                                       //       int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))>12?
              //                                       // (int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))-12).toString() + " PM"
              //                                       //     :
              //                                       // int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))==12?
              //                                       // (int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))).toString() + " PM"
              //                                       //     :
              //                                       // fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2) + " AM"
              //
              //
              //                                       ,style: TextStyle(color: Colors.white)),
              //                                   Text("",style: TextStyle(color: Colors.white))
              //                                 ],
              //                               )
              //                             ],
              //                           ),
              //                         ),
              //                       )
              //                       :
              //                       InkWell(
              //                         onTap: () {
              //                           Navigator.push(context,
              //                               MaterialPageRoute(
              //                                   builder: (context) =>
              //                                       FixtureMatchDataCricketScreen(fixturesByDateRangeCricket.data![i].id!)
              //                               )
              //                           );
              //                         }
              //                         ,
              //                         child: Container(
              //
              //                           margin: EdgeInsets.symmetric(horizontal: 5),
              //                           padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              //                           decoration: BoxDecoration(
              //                             color: Color(0xff083471),
              //                             borderRadius: BorderRadius.all(Radius.circular(20)),
              //                           ),
              //                           height: height*0.2,
              //                           width: width*0.8,
              //                           child: Column(
              //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                             children: [
              //                               Row(
              //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                                 children: [
              //                                   Text(
              //                                     fixturesByDateRangeCricket.data![i].startingAt!.day.toString()+ " "+
              //                                         monthsInYear1[fixturesByDateRangeCricket.data![i].startingAt!.month]!
              //                                     // fixturesByDateRangeCricket.data![index].time!.startingAt!.date!.day.toString()+" "+
              //                                     //   monthsInYear[fixturesByDateRangeCricket.data![index].time!.startingAt!.date!.month]!
              //
              //                                     ,style: TextStyle(color: Colors.white),),
              //                                   Text(
              //
              //                                       isLoading1c==false?
              //                                       leaguec[i].toString()
              //                                       // fixturesByDateRangeFootball.data![index].leagueId.toString()
              //                                       // leaguesname[index]
              //                                           :""
              //
              //                                       ,style: TextStyle(color: Colors.white,fontSize: 12)),
              //                                   Row(
              //                                     crossAxisAlignment: CrossAxisAlignment.center,
              //                                     children: [
              //                                       Icon(FontAwesomeIcons.dotCircle,color: Colors.orange,size: 14,),
              //                                       Text(" Upcoming",style: TextStyle(color: Colors.orange)),
              //                                     ],
              //                                   )
              //                                 ],
              //                               ),
              //                               Row(
              //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                                 children: [
              //                                   Container(
              //                                     alignment: Alignment.center,
              //                                     width: width*0.25,
              //                                     child: Column(
              //                                       children: [
              //                                         Container(
              //                                           width: width*0.1,
              //                                           height: 50,
              //                                           child:  isLoading6c==false?
              //                                           Image.network(
              //                                             localteamlogoc[i].toString()
              //                                             // teamlogo[index]
              //
              //                                             // teamlogo1[0].logolink.toString()
              //                                             ,
              //                                             fit: BoxFit.contain,
              //                                             height: height*.48*.51,
              //                                             loadingBuilder: (BuildContext context, Widget child,
              //                                                 ImageChunkEvent? loadingProgress) {
              //                                               if (loadingProgress == null) return child;
              //                                               return Center(
              //                                                 child: CircularProgressIndicator(
              //                                                   value: loadingProgress.expectedTotalBytes != null
              //                                                       ? loadingProgress.cumulativeBytesLoaded /
              //                                                       loadingProgress.expectedTotalBytes!
              //                                                       : null,
              //                                                 ),
              //                                               );
              //                                             },
              //                                           )
              //                                               :
              //                                           Container(
              //                                             // color: Colors.red,
              //                                           ),
              //                                         ),//TODO put image here
              //                                         Text(isLoading6c==false?
              //                                         localteamc[i].toString()
              //                                         // fixturesByDateRangeFootball.data![index].localteamId.toString()
              //                                         // teamname[index]
              //                                             : "" ,style: TextStyle(color: Colors.white)),
              //
              //                                       ],
              //                                     ),
              //                                   ),
              //                                   Container(
              //                                       width: width*0.2,
              //                                       height: 50,
              //                                       child: Opacity(
              //                                           opacity: 0.4,
              //                                           child: Image.asset("graphic_res/cricket_1.png",fit: BoxFit.contain,))),
              //                                   Container(
              //                                     // color: Colors.red,
              //                                     width: width*0.25,
              //                                     alignment: Alignment.center,
              //
              //                                     child: Column(
              //                                       children: [
              //                                         Container(
              //                                           width: width*0.1,
              //                                           height: 50,
              //                                           child: isLoading7c==false?
              //                                           Image.network(
              //                                             visitorteamlogoc[i].toString()
              //                                             // oppositeteamlogo[index]
              //                                             ,
              //                                             fit: BoxFit.contain,
              //                                             height: height*.48*.51,
              //                                             loadingBuilder: (BuildContext context, Widget child,
              //                                                 ImageChunkEvent? loadingProgress) {
              //                                               if (loadingProgress == null) return child;
              //                                               return Center(
              //                                                 child: CircularProgressIndicator(
              //                                                   value: loadingProgress.expectedTotalBytes != null
              //                                                       ? loadingProgress.cumulativeBytesLoaded /
              //                                                       loadingProgress.expectedTotalBytes!
              //                                                       : null,
              //                                                 ),
              //                                               );
              //                                             },
              //                                           )
              //                                               :
              //                                           Container(),
              //                                           // Image.asset('graphic_res/england.png'),
              //                                         ),//TODO put image here
              //                                         Text(
              //                                             isLoading7c==false?
              //                                             visitorteamc[i]!
              //                                             // fixturesByDateRangeFootball.data![index].visitorteamId.toString()
              //                                             // oppositeteamname[index]
              //                                                 : "",style: TextStyle(color: Colors.white)),
              //
              //                                       ],
              //                                     ),
              //                                   )
              //                                 ],
              //                               ),
              //                               Divider(height: height*0.011,color: Colors.white,thickness: height*0.0029,),
              //                               Row(
              //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                                 children: [
              //                                   Text(
              //                                       fixturesByDateRangeCricket.data![i].startingAt!.hour >12 ?
              //                                       (fixturesByDateRangeCricket.data![i].startingAt!.hour-12).toString() + " PM"
              //                                           :
              //                                       fixturesByDateRangeCricket.data![i].startingAt!.hour==12?
              //                                       (fixturesByDateRangeCricket.data![i].startingAt!.hour).toString() + " PM"
              //                                           :
              //                                       (fixturesByDateRangeCricket.data![i].startingAt!.hour).toString() + " AM"
              //
              //                                       //       int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))>12?
              //                                       // (int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))-12).toString() + " PM"
              //                                       //     :
              //                                       // int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))==12?
              //                                       // (int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))).toString() + " PM"
              //                                       //     :
              //                                       // fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2) + " AM"
              //
              //
              //                                       ,style: TextStyle(color: Colors.white)),
              //                                   Text("",style: TextStyle(color: Colors.white))
              //                                 ],
              //                               )
              //                             ],
              //                           ),
              //                         ),
              //                       )
              //
              //                       ;
              //                     })
              //
              //
              //
              //
              //       : Container()
              //   ,
              // ),

            ],
          )
          ,
        ),

      ),
    );
  }
}

// Container(
//   alignment: Alignment.center,
//   height: height*0.2,
//   color: Colors.red,
//   child: InkWell(
//     onTap: (){
//       setState(() {
//         // localteam[2]="hello3";
//         // print(localteam);
//         // print(localteam[1]);
//       });
//
//     },
//     child: Container(
//       width: width*0.4,
//       height: height*0.1,
//       color: Colors.blue,
//     ),
//   ),
// )