// import 'dart:async';
// import 'dart:math';
// import 'package:basketballinsider/models/fixtures_by_date_range_football.dart' as v1;
// import 'package:basketballinsider/models/leage_by_id_football.dart';
// import 'package:basketballinsider/models/round_by_id_football.dart';
// import 'package:basketballinsider/models/services.dart';
// import 'package:basketballinsider/models/sites.dart';
// import 'package:basketballinsider/models/team_by_id_football.dart';
// import 'package:basketballinsider/models/venue_id_football.dart';
// import 'package:basketballinsider/screens/aboutus.dart';
// import 'package:basketballinsider/screens/betdescription.dart';
// import 'package:basketballinsider/screens/comparison.dart';
// import 'package:basketballinsider/screens/faqs.dart';
// import 'fixture_match_data_football_upcoming.dart';
// import 'package:basketballinsider/screens/review.dart';
// import 'package:basketballinsider/screens/review01.dart';
// import 'package:basketballinsider/services/get_fixtures_by_date_range_football.dart';
// import 'package:basketballinsider/services/get_leage_by_id_football.dart';
// import 'package:basketballinsider/services/get_team_by_id_football.dart';
// import 'package:basketballinsider/widgets/card.dart';
// import 'package:basketballinsider/widgets/starrating.dart';
// import 'package:basketballinsider/widgets/starratting02.dart';
// import 'package:flutter/material.dart';
// import 'package:basketballinsider/models/options.dart';
// import 'package:basketballinsider/screens/getstarted02.dart';
// import 'package:basketballinsider/screens/getstarted01.dart';
// import 'package:basketballinsider/screens/getstarted03.dart';
// import 'package:basketballinsider/screens/getstarted04.dart';
// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// //import 'package:weather/weather.dart';
// import 'package:intl/intl.dart';
//
// class Home02 extends StatefulWidget {
//   const Home02({Key? key}) : super(key: key);
//
//   @override
//   _Home02State createState() => _Home02State();
// }
//
// class _Home02State extends State<Home02> {
//   late Map<int,String> localteam= {};
//   late Map<int,String> visitorteam= {};
//   late Map<int,String> league= {};
//   late Map<int,String> localteamlogo= {};
//   late Map<int,String> visitorteamlogo= {};
//
//   bool isLoading0 = false;
//   bool isLoading1 = true;
//   bool isLoading2 = true;
//   bool isLoading3 = true;
//   bool isLoading4 = true;
//   bool isLoading5 = true;
//   bool isLoading6 = true;
//   bool isLoading7 = true;
//
//   Map<int,String> monthsInYear = {
//     1: "Jan",
//     2: "Feb",
//     3: "Mar",
//     4: "Apr",
//     5: "May",
//     6: "June",
//     7: "July",
//     8: "Aug",
//     9: "Sep",
//     10: "Oct",
//     11: "Nov",
//     12: "Dec",
//   };
//
//   late v1.FixturesByDateRangeFootball fixturesByDateRangeFootball;
//   late Leage leage;
//   late TeamByIdFootball teamByIdFootball;
//   late TeamByIdFootball oppositeteamByIdFootball1;
//   late VenueByIdFootball venueByIdFootball;
//   late RoundByIdFootball roundByIdFootball;
//   getFixtureByDateRange() async{
//     setState(() {
//       isLoading0 = true;
//       isLoading6 = true;
//       isLoading7 = true;
//       isLoading1 = true;
//     });
//     // print(widget.id.toString());
//
//     GetFixturesByDateRangeFootballService.getUsers("","").then((sites){
//       print(sites);
//
//       if(sites!=null) {
//         setState(() {
//           print("dd");
//           fixturesByDateRangeFootball = sites;
//           print("scores ==  "+fixturesByDateRangeFootball.data!.length.toString());
//           isLoading0 = false;
//
//           for(int i=0;i<fixturesByDateRangeFootball.data!.length;i++){
//             String Id = fixturesByDateRangeFootball.data![i].localteamId.toString();
//             String Id1 = fixturesByDateRangeFootball.data![i].visitorteamId.toString();
//             String Id2= fixturesByDateRangeFootball.data![i].leagueId.toString();
//             print(Id);
//             GetTeamByIdFootvball.getUsers(Id).then((sites){
//                 if(sites!=null){
//                   setState(() {
//
//                     teamByIdFootball = sites;
//                   if(teamByIdFootball.data!=null) {
//                       localteam[i] = teamByIdFootball.data!.name.toString();
//                       localteamlogo[i] =
//                           teamByIdFootball.data!.logoPath.toString();
//                       print(teamByIdFootball.data!.id.toString());
//                       print(localteam);
//                       print(localteam.length);
//                       if (fixturesByDateRangeFootball.data!.length >=
//                           localteam.length) {
//                         isLoading6 = false;
//                         print(isLoading6);
//
//                       }
//                   }
//                   });
//
//                 }
//
//                 });
//
//             GetTeamByIdFootvball.getUsers(Id1).then((sites){
//               // setState(() {
//                // print(sites);
//                 if(sites!=null){
//                   teamByIdFootball = sites;
//                   if(teamByIdFootball.data!=null){
//                     visitorteam[i]=teamByIdFootball.data!.name.toString();
//                     visitorteamlogo[i]=teamByIdFootball.data!.logoPath.toString();
//                     print(teamByIdFootball.data!.id.toString());
//                     print(visitorteam);
//                   }
//                   if(fixturesByDateRangeFootball.data!.length==visitorteam.length){
//                     isLoading7 = false;
//                   }
//                 }
//               // });
//             });
//
//             GetLeageByIdServices.getUsers(Id2).then((sites){
//                setState(() {
//                 if(sites!=null){
//                   leage = sites;
//                   league[i]=leage.data.name.toString();
//                   // leaguesname.add(leage.data.name);
//                   if(fixturesByDateRangeFootball.data!.length==league.length){
//                     isLoading1 = false;
//                   }
//                 }
//                });
//             });
//
//
//
//           }
//
//
//
//         });
//       }
//     });
//   }
//
//
//   getTeam() async{
//     setState(() {
//       isLoading0 = true;
//       isLoading6 = true;
//     });
//
//     GetFixturesByDateRangeFootballService.getUsers("","").then((sites){
//       print(sites);
//       if(sites!=null) {
//         setState(() {
//           print("dd");
//           fixturesByDateRangeFootball = sites;
//           print("scores ==  "+fixturesByDateRangeFootball.data!.length.toString());
//           isLoading0 = false;
//
//           for(int i=0;i<fixturesByDateRangeFootball.data!.length;i++){
//             String Id = fixturesByDateRangeFootball.data![i].localteamId.toString();
//             print(i);
//             GetTeamByIdFootvball.getUsers(Id).then((sites){
//               if(sites!=null){
//                 setState(() {
//
//                   teamByIdFootball = sites;
//                   if(teamByIdFootball.data!=null) {
//                     localteam[i] = teamByIdFootball.data!.name.toString();
//                     localteamlogo[i] =
//                         teamByIdFootball.data!.logoPath.toString();
//                     print(teamByIdFootball.data!.id.toString());
//                     print(localteam);
//                     print(localteam.length);
//                     if (fixturesByDateRangeFootball.data!.length >=
//                         localteam.length) {
//                       isLoading6 = false;
//                       print(isLoading6);
//
//                     }
//                   }
//                 });
//
//               }
//
//             });
//
//
//           }
//
//
//
//         });
//       }
//     });
//   }
//
//
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getFixtureByDateRange();
//     // getTeam();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final now = DateTime.now();
//     final today = DateTime(now.year, now.month, now.day);
//  double safe = MediaQuery.of(context).padding.top;
//     double height1 = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     double barheight =AppBar().preferredSize.height;
//     double height = height1-safe;
//
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Container(
//           height: height,
//           color: Colors.black,
//           alignment: Alignment.center,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 height: height*0.2,
//                 // color: Colors.red,
//                 child:
//                 isLoading0 == false ?
//                 ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: fixturesByDateRangeFootball.data!.length,
//                     itemBuilder: (context,index){
//                       return InkWell(
//                         onTap: () {
//                           Navigator.push(context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       FixtureMatchDataFootballUpcomingScreen(fixturesByDateRangeFootball.data![index].id!)
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
//                                   Text(fixturesByDateRangeFootball.data![index].time!.startingAt!.date!.day.toString()+" "+
//                                       monthsInYear[fixturesByDateRangeFootball.data![index].time!.startingAt!.date!.month]!,style: TextStyle(color: Colors.white),),
//                                   Text(
//
//                                       isLoading1==false?
//                                           league[index].toString()
//                                           // fixturesByDateRangeFootball.data![index].leagueId.toString()
//                                       // leaguesname[index]
//                                           :""
//
//                                       ,style: TextStyle(color: Colors.white)),
//                                   Row(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       Icon(FontAwesomeIcons.dotCircle,color: Colors.red,size: 14,),
//                                       Text(" Live",style: TextStyle(color: Colors.red)),
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
//                                           child:  isLoading6==false?
//                                           Image.network(
//                                             localteamlogo[index].toString()
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
//                                             color: Colors.red,
//                                           ),
//                                         ),//TODO put image here
//                                         Text(isLoading6==false?
//                                             localteam[index].toString()
//                                             // fixturesByDateRangeFootball.data![index].localteamId.toString()
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
//                                           child: Image.asset("graphic_res/football.png",fit: BoxFit.contain,))),
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
//                                           child: isLoading7==false?
//                                           Image.network(
//                                             visitorteamlogo[index].toString()
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
//                                             isLoading7==false?
//                                                 visitorteam[index]!
//                                             // fixturesByDateRangeFootball.data![index].visitorteamId.toString()
//                                         // oppositeteamname[index]
//                                             : "",style: TextStyle(color: Colors.white)),
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
//                                       int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))>12?
//                                       (int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))-12).toString() + " PM"
//                                           :
//                                       int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))==12?
//                                       (int.parse(fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2))).toString() + " PM"
//                                           :
//                                       fixturesByDateRangeFootball.data![index].time!.startingAt!.time!.substring(0,2) + " AM"
//
//
//
//                                       ,style: TextStyle(color: Colors.white)),
//                                   Text("",style: TextStyle(color: Colors.white))
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     })
//                     : Container()
//                 ,
//               ),
//               // Container(
//               //   alignment: Alignment.center,
//               //   height: height*0.2,
//               //   color: Colors.red,
//               //   child: InkWell(
//               //     onTap: (){
//               //       setState(() {
//               //         localteam[2]="hello3";
//               //         print(localteam);
//               //         print(localteam[1]);
//               //       });
//               //
//               //     },
//               //     child: Container(
//               //       width: width*0.4,
//               //       height: height*0.1,
//               //       color: Colors.blue,
//               //     ),
//               //   ),
//               // )
//             ],
//           )
//           ,
//         ),
//
//       ),
//     );
//   }
// }
//
