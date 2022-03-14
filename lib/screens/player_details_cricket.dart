import 'package:basketballinsider/models/player_by_id_cricket.dart';
import 'package:basketballinsider/screens/cricket/cricket_player_model.dart';
import 'package:basketballinsider/services/player_by_id_cricket.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayerDetailsCricket extends StatefulWidget {

  late String firstname;
  late String lastname;
  late String fullname;
  late String imageName;
  late String dob;
  late String battingStyle;
  late String bowlingStyle;
  late String positionname;
  late String id;


  PlayerDetailsCricket(
      this.id,
      this.firstname,
      this.lastname,
      this.fullname,
      this.imageName,
      this.dob,
      this.battingStyle,
      this.bowlingStyle,
      this.positionname
      );

  @override
  _PlayerDetailsCricketState createState() => _PlayerDetailsCricketState();
}

class Batting{
  dynamic type;
  dynamic matches;
  dynamic innings;
  dynamic runsScored;
  dynamic notOuts;
  dynamic highestInningScore;
  dynamic strikeRate;
  dynamic ballsFaced;
  dynamic average;
  dynamic fourX;
  dynamic sixX;
  dynamic fowScore;
  dynamic fowBalls;
  dynamic hundreds;
  dynamic fifties;

  Batting(
      this.type,
      this.matches,
      this.innings,
      this.runsScored,
      this.notOuts,
      this.highestInningScore,
      this.strikeRate,
      this.ballsFaced,
      this.average,
      this.fourX,
      this.sixX,
      this.fowScore,
      this.fowBalls,
      this.hundreds,
      this.fifties);
}

class _PlayerDetailsCricketState extends State<PlayerDetailsCricket> {



  late bool isLoading0 = true;
  late CricketPlayer playerDetailsCricket;
  late List<Batting> batting=[];
  int matchesTest=0;
  int matchesODI=0;
  int matchesT20=0;
  int matchesD=0;

  int inningsTest=0;
  int inningsODI=0;
  int inningsT20=0;
  int inningsD=0;

  int runsTest=0;
  int runsODI=0;
  int runsT20=0;
  int runsD=0;

  int ballsTest=0;
  int ballsODI=0;
  int ballsT20=0;
  int ballsD=0;

  int highestTest=0;
  int highestODI=0;
  int highestT20=0;
  int highestD=0;

  dynamic averageTest=0;
  dynamic averageODI=0;
  dynamic averageT20=0;
  dynamic averageD=0;

  dynamic strickRateTest=0;
  dynamic strickRateODI=0;
  dynamic strickRateT20=0;
  dynamic strickRateD=0;

  int foursTest=0;
  int foursODI=0;
  int foursT20=0;
  int foursD=0;

  int sixesTest=0;
  int sixesODI=0;
  int sixesT20=0;
  int sixesD=0;

  int fiftiesTest=0;
  int fiftiesODI=0;
  int fiftiesT20=0;
  int fiftiesD=0;

  int hundredsTest=0;
  int hundredsODI=0;
  int hundredsT20=0;
  int hundredsD=0;

  int notOutsTest=0;
  int notOutsODI=0;
  int notOutsT20=0;
  int notOutsD=0;


  dynamic averagecountt20=0;
  dynamic averagecountodi=0;
  dynamic averagecounttest=0;
  dynamic averagecountdomestic=0;



  dynamic testmatches=0;
  dynamic testovers=0;
  dynamic testinnings=0;
  dynamic testaverage=0;
  dynamic testeconRate=0;
  dynamic testmedians=0;
  dynamic testruns=0;
  dynamic testwickets=0;
  dynamic testwide=0;
  dynamic testnoball=0;
  dynamic teststrikeRate=0;
  dynamic testfourWickets=0;
  dynamic testfiveWickets=0;
  dynamic testtenWickets=0;
  dynamic testrate=0;

  dynamic odimatches=0;
  dynamic odiovers=0;
  dynamic odiinnings=0;
  dynamic odiaverage=0;
  dynamic odieconRate=0;
  dynamic odimedians=0;
  dynamic odiruns=0;
  dynamic odiwickets=0;
  dynamic odiwide=0;
  dynamic odinoball=0;
  dynamic odistrikeRate=0;
  dynamic odifourWickets=0;
  dynamic odifiveWickets=0;
  dynamic oditenWickets=0;
  dynamic odirate=0;

  dynamic t20matches=0;
  dynamic t20overs=0;
  dynamic t20innings=0;
  dynamic t20average=0;
  dynamic t20econRate=0;
  dynamic t20medians=0;
  dynamic t20runs=0;
  dynamic t20wickets=0;
  dynamic t20wide=0;
  dynamic t20noball=0;
  dynamic t20strikeRate=0;
  dynamic t20fourWickets=0;
  dynamic t20fiveWickets=0;
  dynamic t20tenWickets=0;
  dynamic t20rate=0;

  dynamic dmatches=0;
  dynamic dovers=0;
  dynamic dinnings=0;
  dynamic daverage=0;
  dynamic deconRate=0;
  dynamic dmedians=0;
  dynamic druns=0;
  dynamic dwickets=0;
  dynamic dwide=0;
  dynamic dnoball=0;
  dynamic dstrikeRate=0;
  dynamic dfourWickets=0;
  dynamic dfiveWickets=0;
  dynamic dtenWickets=0;
  dynamic drate=0;


  // dynamic testmatches;
  // dynamic testovers;
  // dynamic testinnings;
  // dynamic testaverage;
  // dynamic testeconRate;
  // dynamic testmedians;
  // dynamic testruns;
  // dynamic testwickets;
  // dynamic testwide;
  // dynamic testnoball;
  // dynamic teststrikeRate;
  // dynamic testfourWickets;
  // dynamic testfiveWickets;
  // dynamic testtenWickets;
  // dynamic testrate;

  // dynamic odimatches;
  // dynamic odiovers;
  // dynamic odiinnings;
  // dynamic odiaverage;
  // dynamic odieconRate;
  // dynamic odimedians;
  // dynamic odiruns;
  // dynamic odiwickets;
  // dynamic odiwide;
  // dynamic odinoball;
  // dynamic odistrikeRate;
  // dynamic odifourWickets;
  // dynamic odifiveWickets;
  // dynamic oditenWickets;
  // dynamic odirate;

  // dynamic t20matches;
  // dynamic t20overs;
  // dynamic t20innings;
  // dynamic t20average;
  // dynamic t20econRate;
  // dynamic t20medians;
  // dynamic t20runs;
  // dynamic t20wickets;
  // dynamic t20wide;
  // dynamic t20noball;
  // dynamic t20strikeRate;
  // dynamic t20fourWickets;
  // dynamic t20fiveWickets;
  // dynamic t20tenWickets;
  // dynamic t20rate;

  // dynamic dmatches;
  // dynamic dovers;
  // dynamic dinnings;
  // dynamic daverage;
  // dynamic deconRate;
  // dynamic dmedians;
  // dynamic druns;
  // dynamic dwickets;
  // dynamic dwide;
  // dynamic dnoball;
  // dynamic dstrikeRate;
  // dynamic dfourWickets;
  // dynamic dfiveWickets;
  // dynamic dtenWickets;
  // dynamic drate;

  dynamic highest_t20 = 0;
  dynamic highest_odi = 0;
  dynamic highest_test =0;
  dynamic highest_domestic = 0;


  dynamic average_t20 = 0 ;
  dynamic average_odi = 0 ;
  dynamic average_test = 0 ;
  dynamic average_domestic = 0 ;



  dynamic eratet20=0;
  dynamic erateodi=0;
  dynamic eratetest=0;

  dynamic sratet20=0;
  dynamic srateodi=0;
  dynamic sratetest=0;

  dynamic averageballt20=0;
  dynamic averageballt20odi=0;
  dynamic averageballt20test=0;





  getData() async {
    setState(() {
      isLoading0=true;
    });

    GetPlayerInfoByIdCrickerService.getUsers(widget.id).then((sites){
     // print(sites);
      if(sites!=null){
        setState(() {
          playerDetailsCricket = sites;
          isLoading0 = false;
          // print(playerDetailsCricket.data!.career);
          for(int i=0;i<playerDetailsCricket.data!.career!.length;i++){
            if(playerDetailsCricket.data!.career![i].type=="T20I" &&
                playerDetailsCricket.data!.career![i].batting!=null){
              int temp = playerDetailsCricket.data!.career![i].batting!.matches;
              int runs = playerDetailsCricket.data!.career![i].batting!.runsScored;
              int balls = playerDetailsCricket.data!.career![i].batting!.ballsFaced;
              int highests = playerDetailsCricket.data!.career![i].batting!.highestInningScore;
              dynamic average= playerDetailsCricket.data!.career![i].batting!.average;
              int notouts = playerDetailsCricket.data!.career![i].batting!.notOuts;
              int innings = playerDetailsCricket.data!.career![i].batting!.innings;
              int fours = playerDetailsCricket.data!.career![i].batting!.fourX;
              int sixes = playerDetailsCricket.data!.career![i].batting!.sixX;
              int fifties = playerDetailsCricket.data!.career![i].batting!.fifties;
              int hundrers = playerDetailsCricket.data!.career![i].batting!.hundreds;
              dynamic strickrates = playerDetailsCricket.data!.career![i].batting!.strikeRate;
              matchesT20=matchesT20+temp;
           //   print(matchesT20);
              inningsT20=inningsT20+innings;
              runsT20=runsT20+runs;
              ballsT20=ballsT20+balls;
              highestT20=highests;
              if(highest_t20<highestT20){
                highest_t20=highestT20;
                print(highest_t20);
              }
              averageT20=averageT20+average;
              notOutsT20=notOutsT20+notouts;
              foursT20=foursT20+fours;
              sixesT20=sixesT20+sixes;
              fiftiesT20=fiftiesT20+fifties;
              hundredsT20=hundredsT20+hundrers;
              strickRateT20=strickRateT20+strickrates;
              averagecountt20=averagecountt20+1;
            }
            if(playerDetailsCricket.data!.career![i].type=="ODI" && playerDetailsCricket.data!.career![i].batting!=null){

              int temp1 = playerDetailsCricket.data!.career![i].batting!.matches;
              matchesODI=matchesODI+temp1;

              int temp = playerDetailsCricket.data!.career![i].batting!.matches;
              int runs = playerDetailsCricket.data!.career![i].batting!.runsScored;
              int balls = playerDetailsCricket.data!.career![i].batting!.ballsFaced;
              int highests = playerDetailsCricket.data!.career![i].batting!.highestInningScore;
              dynamic average= playerDetailsCricket.data!.career![i].batting!.average;
              int notouts = playerDetailsCricket.data!.career![i].batting!.notOuts;
              int innings = playerDetailsCricket.data!.career![i].batting!.innings;
              int fours = playerDetailsCricket.data!.career![i].batting!.fourX;
              int sixes = playerDetailsCricket.data!.career![i].batting!.sixX;
              int fifties = playerDetailsCricket.data!.career![i].batting!.fifties;
              int hundrers = playerDetailsCricket.data!.career![i].batting!.hundreds;
              dynamic strickrates =playerDetailsCricket.data!.career![i].batting!.strikeRate;

              matchesODI=matchesODI+temp;
              inningsODI=inningsODI+innings;
              runsODI=runsODI+runs;
              ballsODI=ballsODI+balls;

              highestODI=highests;
              if(highest_odi<highestODI){
                highest_odi=highestODI;
              }
              print(highest_odi);

              averagecountodi=averagecountodi+1;
              averageODI=averageODI+average;
              notOutsODI=notOutsODI+notouts;
              foursODI=foursODI+fours;
              sixesODI=sixesODI+sixes;
              fiftiesODI=fiftiesODI+fifties;
              hundredsODI=hundredsODI+hundrers;
              if(strickrates!=null){
                strickRateODI=strickRateODI+strickrates;

              }


            }
            if((playerDetailsCricket.data!.career![i].type=="Test/5day" || playerDetailsCricket.data!.career![i].type=="Test") && playerDetailsCricket.data!.career![i].batting!=null){
              int temp2 = playerDetailsCricket.data!.career![i].batting!.matches;
              matchesTest=matchesTest+temp2;
            //  print(temp2);
              //print(matchesTest);

              averagecounttest=averagecounttest+1;

              int temp = playerDetailsCricket.data!.career![i].batting!.matches;
              int runs = playerDetailsCricket.data!.career![i].batting!.runsScored;
              int balls = playerDetailsCricket.data!.career![i].batting!.ballsFaced;
              int highests = playerDetailsCricket.data!.career![i].batting!.highestInningScore;
              dynamic average= playerDetailsCricket.data!.career![i].batting!.average;
              int notouts = playerDetailsCricket.data!.career![i].batting!.notOuts;
              int innings = playerDetailsCricket.data!.career![i].batting!.innings;
              int fours = playerDetailsCricket.data!.career![i].batting!.fourX;
              int sixes = playerDetailsCricket.data!.career![i].batting!.sixX;
              int fifties = playerDetailsCricket.data!.career![i].batting!.fifties;
              int hundrers = playerDetailsCricket.data!.career![i].batting!.hundreds;
              dynamic strickrates =playerDetailsCricket.data!.career![i].batting!.strikeRate;

              matchesTest=matchesTest+temp;
              inningsTest=inningsTest+innings;
              runsTest=runsTest+runs;
              ballsTest=ballsTest+balls;
              highestTest=highests;

              if(highest_test<highestTest){
                highest_test=highestTest;
              }
              print(highest_test);
              averageTest=averageTest+average;
              notOutsTest=notOutsTest+notouts;
              foursTest=foursTest+fours;
              sixesTest=sixesTest+sixes;
              fiftiesTest=fiftiesTest+fifties;
              hundredsTest=hundredsTest+hundrers;
              strickRateTest=strickRateTest+strickrates;

            }
            if(playerDetailsCricket.data!.career![i].type!="T20" &&
                playerDetailsCricket.data!.career![i].type!="Test/5day" &&
                playerDetailsCricket.data!.career![i].type!="Test" &&
                playerDetailsCricket.data!.career![i].type!="ODI" &&
            playerDetailsCricket.data!.career![i].batting!=null
            ){
              int temp3 = playerDetailsCricket.data!.career![i].batting!.matches;
              matchesD=matchesD+temp3;

              averagecountdomestic=averagecountdomestic+1;

              int temp = playerDetailsCricket.data!.career![i].batting!.matches;
              int runs = playerDetailsCricket.data!.career![i].batting!.runsScored;
              int balls = playerDetailsCricket.data!.career![i].batting!.ballsFaced;
              int highests = playerDetailsCricket.data!.career![i].batting!.highestInningScore;
              dynamic average= playerDetailsCricket.data!.career![i].batting!.average;
              int notouts = playerDetailsCricket.data!.career![i].batting!.notOuts;
              int innings = playerDetailsCricket.data!.career![i].batting!.innings;
              int fours = playerDetailsCricket.data!.career![i].batting!.fourX;
              int sixes = playerDetailsCricket.data!.career![i].batting!.sixX;
              int fifties = playerDetailsCricket.data!.career![i].batting!.fifties;
              int hundrers = playerDetailsCricket.data!.career![i].batting!.hundreds;
              dynamic strickrates = playerDetailsCricket.data!.career![i].batting!.strikeRate;

              matchesD=matchesD+temp;
              inningsD=inningsD+innings;
              runsD=runsD+runs;
              ballsD=ballsD+balls;
              highestD=highests;
              if(highest_domestic<highestD){
                highest_domestic=highestD;
              }
              averageD=averageD+average;
              notOutsD=notOutsD+notouts;
              foursD=foursD+fours;
              sixesD=sixesD+sixes;
              fiftiesD=fiftiesD+fifties;
              hundredsD=hundredsD+hundrers;
              strickRateD=strickRateD+strickrates;

            }



            // average_t20 = averageT20/matchesT20;








          }
          averageODI=averageODI/averagecountodi;
          averageT20=averageT20/averagecountt20;
          averageTest=averageTest/averagecounttest;


          strickRateT20=strickRateT20/averagecountt20;
          strickRateODI=strickRateODI/averagecountodi;
          strickRateTest=strickRateTest/averagecounttest;





          for(int i=0;i<playerDetailsCricket.data!.career!.length;i++){

            if(playerDetailsCricket.data!.career![i].type=="T20I" &&
                playerDetailsCricket.data!.career![i].bowling!=null)
            {
              dynamic matches = playerDetailsCricket.data!.career![i].bowling!.matches;
              dynamic overs = playerDetailsCricket.data!.career![i].bowling!.overs;
              dynamic innings = playerDetailsCricket.data!.career![i].bowling!.innings;
              dynamic average = playerDetailsCricket.data!.career![i].bowling!.average;
              dynamic econRate= playerDetailsCricket.data!.career![i].bowling!.econRate;
              dynamic medians = playerDetailsCricket.data!.career![i].bowling!.medians;
              dynamic runs = playerDetailsCricket.data!.career![i].bowling!.runs;
              dynamic wickets = playerDetailsCricket.data!.career![i].bowling!.wickets;
              dynamic wide = playerDetailsCricket.data!.career![i].bowling!.wide;
              dynamic noball = playerDetailsCricket.data!.career![i].bowling!.noball;
              dynamic strikeRate = playerDetailsCricket.data!.career![i].bowling!.strikeRate;
              dynamic fourWickets = playerDetailsCricket.data!.career![i].bowling!.fourWickets;
              dynamic fiveWickets = playerDetailsCricket.data!.career![i].bowling!.fiveWickets;
              dynamic tenWickets = playerDetailsCricket.data!.career![i].bowling!.tenWickets;
              dynamic rate = playerDetailsCricket.data!.career![i].bowling!.rate;

        //      if(matches!=null){matchesT20=0;}

              // print(matches);
              // print(t20matches);
              // print("----");
              // print(matches);
              // print(t20matches);

              if(matches!=null){
               // print(matches);

                t20matches=t20matches+matches;
              }
              if(overs!=null){
                t20overs=t20overs+overs;
              }
              if(innings!=null){
                t20innings=t20innings+innings;
              }
              if(average!=null){
                t20average=t20average+average;
                averageballt20=averageballt20+1;
              }

              if(econRate!=null){
                eratet20=eratet20+1;
                t20econRate=t20econRate+econRate;

              }
              if(medians!=null){
                t20medians=t20medians+medians;

              }
              if(runs!=null){
                t20runs=t20runs+runs;

              }
              if(wickets!=null){
                t20wickets=t20wickets+wickets;

              }
              if(wide!=null){
                t20wide=t20wide+wide;

              }
              if(noball!=null){
          t20noball=t20noball+noball;

              }
              if(strikeRate!=null){
          t20strikeRate=t20strikeRate+strikeRate;

              }
              if(fourWickets!=null){
          t20fourWickets=t20fourWickets+fourWickets;

              }
              if(fiveWickets!=null){
          t20fiveWickets=t20fiveWickets+fiveWickets;

              }
              if(tenWickets!=null){
          t20tenWickets=t20tenWickets+tenWickets;
              }
              if(rate!=null){
          t20rate=t20rate+rate;
              }


            }
            if(playerDetailsCricket.data!.career![i].type=="ODI"
             && playerDetailsCricket.data!.career![i].bowling!=null
            ){

              dynamic matches = playerDetailsCricket.data!.career![i].bowling!.matches;
              dynamic overs = playerDetailsCricket.data!.career![i].bowling!.overs;
              dynamic innings = playerDetailsCricket.data!.career![i].bowling!.innings;
              dynamic average = playerDetailsCricket.data!.career![i].bowling!.average;
              dynamic econRate= playerDetailsCricket.data!.career![i].bowling!.econRate;
              dynamic medians = playerDetailsCricket.data!.career![i].bowling!.medians;
              dynamic runs = playerDetailsCricket.data!.career![i].bowling!.runs;
              dynamic wickets = playerDetailsCricket.data!.career![i].bowling!.wickets;
              dynamic wide = playerDetailsCricket.data!.career![i].bowling!.wide;
              dynamic noball = playerDetailsCricket.data!.career![i].bowling!.noball;
              dynamic strikeRate = playerDetailsCricket.data!.career![i].bowling!.strikeRate;
              dynamic fourWickets = playerDetailsCricket.data!.career![i].bowling!.fourWickets;
              dynamic fiveWickets = playerDetailsCricket.data!.career![i].bowling!.fiveWickets;
              dynamic tenWickets = playerDetailsCricket.data!.career![i].bowling!.tenWickets;
              dynamic rate = playerDetailsCricket.data!.career![i].bowling!.rate;


              // print(matches);
              // print(odimatches);
              // print("----");
              // print(matches);
              // print(odimatches);

              if(matches!=null){
           //     print(matches);

                odimatches=odimatches+matches;
              }
              if(overs!=null){
                odiovers=odiovers+overs;
              }
              if(innings!=null){
                odiinnings=odiinnings+innings;
              }
              if(average!=null){
                averageballt20odi=averageballt20odi+1;

                odiaverage=odiaverage+average;
              }

              if(econRate!=null){
                erateodi=erateodi+1;
                odieconRate=odieconRate+econRate;

              }
              if(medians!=null){
                odimedians=odimedians+medians;

              }
              if(runs!=null){
                odiruns=odiruns+runs;

              }
              if(wickets!=null){
                odiwickets=odiwickets+wickets;

              }
              if(wide!=null){
                odiwide=odiwide+wide;

              }
              if(noball!=null){
                odinoball=odinoball+noball;

              }
              if(strikeRate!=null){
                odistrikeRate=odistrikeRate+strikeRate;

              }
              if(fourWickets!=null){
                odifourWickets=odifourWickets+fourWickets;

              }
              if(fiveWickets!=null){
                odifiveWickets=odifiveWickets+fiveWickets;

              }
              if(tenWickets!=null){
                oditenWickets=oditenWickets+tenWickets;
              }
              if(rate!=null){
                odirate=odirate+rate;
              }


            }
            if((playerDetailsCricket.data!.career![i].type=="Test/5day" || playerDetailsCricket.data!.career![i].type=="Test") && playerDetailsCricket.data!.career![i].bowling!=null)
            {

              dynamic matches = playerDetailsCricket.data!.career![i].bowling!.matches;
              dynamic overs = playerDetailsCricket.data!.career![i].bowling!.overs;
              dynamic innings = playerDetailsCricket.data!.career![i].bowling!.innings;
              dynamic average = playerDetailsCricket.data!.career![i].bowling!.average;
              dynamic econRate= playerDetailsCricket.data!.career![i].bowling!.econRate;
              dynamic medians = playerDetailsCricket.data!.career![i].bowling!.medians;
              dynamic runs = playerDetailsCricket.data!.career![i].bowling!.runs;
              dynamic wickets = playerDetailsCricket.data!.career![i].bowling!.wickets;
              dynamic wide = playerDetailsCricket.data!.career![i].bowling!.wide;
              dynamic noball = playerDetailsCricket.data!.career![i].bowling!.noball;
              dynamic strikeRate = playerDetailsCricket.data!.career![i].bowling!.strikeRate;
              dynamic fourWickets = playerDetailsCricket.data!.career![i].bowling!.fourWickets;
              dynamic fiveWickets = playerDetailsCricket.data!.career![i].bowling!.fiveWickets;
              dynamic tenWickets = playerDetailsCricket.data!.career![i].bowling!.tenWickets;
              dynamic rate = playerDetailsCricket.data!.career![i].bowling!.rate;


              // print(matches);
              // print(testmatches);
              // print("----");
              // print(matches);
              // print(testmatches);

              if(matches!=null){
              //  print(matches);

                testmatches=testmatches+matches;
              }
              if(overs!=null){
                testovers=testovers+overs;
              }
              if(innings!=null){
                testinnings=testinnings+innings;
              }
              if(average!=null){
                testaverage=testaverage+average;
                averageballt20test=averageballt20test+1;
              }

              if(econRate!=null){
                eratetest=eratetest+1;
                testeconRate=testeconRate+econRate;

              }
              if(medians!=null){
                testmedians=testmedians+medians;

              }
              if(runs!=null){
                testruns=testruns+runs;

              }
              if(wickets!=null){
                testwickets=testwickets+wickets;

              }
              if(wide!=null){
                testwide=testwide+wide;

              }
              if(noball!=null){
                testnoball=testnoball+noball;

              }
              if(strikeRate!=null){
                teststrikeRate=teststrikeRate+strikeRate;

              }
              if(fourWickets!=null){
                testfourWickets=testfourWickets+fourWickets;

              }
              if(fiveWickets!=null){
                testfiveWickets=testfiveWickets+fiveWickets;

              }
              if(tenWickets!=null){
                testtenWickets=testtenWickets+tenWickets;
              }
              if(rate!=null){
                testrate=testrate+rate;
              }


            }
            if(playerDetailsCricket.data!.career![i].type!="d" &&
                playerDetailsCricket.data!.career![i].type!="Test/5day" &&
                playerDetailsCricket.data!.career![i].type!="Test" &&
                playerDetailsCricket.data!.career![i].type!="ODI" && playerDetailsCricket.data!.career![i].bowling!=null)
            {
              dynamic matches = playerDetailsCricket.data!.career![i].bowling!.matches;
              dynamic overs = playerDetailsCricket.data!.career![i].bowling!.overs;
              dynamic innings = playerDetailsCricket.data!.career![i].bowling!.innings;
              dynamic average = playerDetailsCricket.data!.career![i].bowling!.average;
              dynamic econRate= playerDetailsCricket.data!.career![i].bowling!.econRate;
              dynamic medians = playerDetailsCricket.data!.career![i].bowling!.medians;
              dynamic runs = playerDetailsCricket.data!.career![i].bowling!.runs;
              dynamic wickets = playerDetailsCricket.data!.career![i].bowling!.wickets;
              dynamic wide = playerDetailsCricket.data!.career![i].bowling!.wide;
              dynamic noball = playerDetailsCricket.data!.career![i].bowling!.noball;
              dynamic strikeRate = playerDetailsCricket.data!.career![i].bowling!.strikeRate;
              dynamic fourWickets = playerDetailsCricket.data!.career![i].bowling!.fourWickets;
              dynamic fiveWickets = playerDetailsCricket.data!.career![i].bowling!.fiveWickets;
              dynamic tenWickets = playerDetailsCricket.data!.career![i].bowling!.tenWickets;
              dynamic rate = playerDetailsCricket.data!.career![i].bowling!.rate;


              // print(matches);
              // print(dmatches);
              // print("----");
              // print(matches);
              // print(dmatches);

              if(matches!=null){
               // print(matches);

                dmatches=dmatches+matches;
              }
              if(overs!=null){
                dovers=dovers+overs;
              }
              if(innings!=null){
                dinnings=dinnings+innings;
              }
              if(average!=null){
                daverage=daverage+average;
              }

              if(econRate!=null){
                deconRate=deconRate+econRate;

              }
              if(medians!=null){
                dmedians=dmedians+medians;

              }
              if(runs!=null){
                druns=druns+runs;

              }
              if(wickets!=null){
                dwickets=dwickets+wickets;

              }
              if(wide!=null){
                dwide=dwide+wide;

              }
              if(noball!=null){
                dnoball=dnoball+noball;

              }
              if(strikeRate!=null){
                dstrikeRate=dstrikeRate+strikeRate;

              }
              if(fourWickets!=null){
                dfourWickets=dfourWickets+fourWickets;

              }
              if(fiveWickets!=null){
                dfiveWickets=dfiveWickets+fiveWickets;

              }
              if(tenWickets!=null){
                dtenWickets=dtenWickets+tenWickets;
              }
              if(rate!=null){
                drate=drate+rate;
              }




            }
          }
          // print(matchesD);
          // print(matchesODI);
          // print(matchesTest);
          // print(matchesT20);


          t20econRate=t20econRate/eratet20;
          odieconRate=odieconRate/erateodi;
          testeconRate=testeconRate/eratetest;

          t20average=t20average/averageballt20;
          odiaverage=odiaverage/averageballt20odi;
          testaverage=testaverage/averageballt20test;



        });
      }

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
    double height = height1-safe-barheight;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          bottom:   TabBar(
            //  isScrollable: true,
              labelColor: Colors.white,
              tabs: [
                Tab(text: "INFO",),
                Tab(text: "BATTING",),
                Tab(text: "BOWLING",),
              ]),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(FontAwesomeIcons.arrowLeft),
            color: Colors.white,),
          backgroundColor: Color(0xff083471),
          title: Text("Player Info",style: TextStyle(color: Colors.white),),
        ),
        body:
        Container(
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
                height: height,
                width: width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: height*0.4,
                        child:
                            widget.imageName.contains("png")?
                        Image.network(
                          widget.imageName,
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
                          :  Image.asset('graphic_res/user_.jpeg'),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                        child: FittedBox(
                          child: Text(
                            widget.fullname!="null" ?
                            widget.fullname : "-"
                            ,style: TextStyle(fontSize: 24,color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        child: FittedBox(
                          child: Text(
                            widget.positionname!="null" ?
                            widget.positionname.substring(5) : "-"
                            ,style: TextStyle(fontSize: 20,color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        child: FittedBox(
                          child: Row(
                            children: [
                              Text(
                                "First Name : "
                                ,style: TextStyle(fontSize: 18,color: Colors.grey),
                              ),
                              Text(
                                widget.firstname!="null" ?
                                widget.firstname : "-"
                                ,style: TextStyle(fontSize: 18,color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        child: FittedBox(
                          child: Row(
                            children: [
                              Text(
                                "Last Name : "
                                ,style: TextStyle(fontSize: 18,color: Colors.grey),
                              ),
                              Text(
                                widget.lastname!="null" ?
                                widget.lastname : "-"
                                ,style: TextStyle(fontSize: 18,color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        child: FittedBox(
                          child: Row(
                            children: [
                              Text(
                                "Full Name : "
                                ,style: TextStyle(fontSize: 18,color: Colors.grey),
                              ),
                              Text(
                                widget.fullname!="null" ?
                                widget.fullname : "-"
                                ,style: TextStyle(fontSize: 18,color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        child: FittedBox(
                          child: Row(
                            children: [
                              Text(
                                "Date of Birth : "
                                ,style: TextStyle(fontSize: 18,color: Colors.grey),
                              ),
                              Text(
                                widget.dob!="null" ?
                                widget.dob.substring(0,10) : "-"
                                ,style: TextStyle(fontSize: 18,color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        child: FittedBox(
                          child: Row(
                            children: [
                              Text(
                                "Batting Style : "
                                ,style: TextStyle(fontSize: 18,color: Colors.grey),
                              ),
                              Text(
                                widget.battingStyle!="null" ?
                                widget.battingStyle.substring(13).replaceAll('_', " ") : "-"
                                ,style: TextStyle(fontSize: 18,color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        child: FittedBox(
                          child: Row(
                            children: [
                              Text(
                                "Bowling Style : "
                                ,style: TextStyle(fontSize: 18,color: Colors.grey),
                              ),
                              Text(
                                widget.bowlingStyle!="null" ?
                                widget.bowlingStyle.replaceAll('-', ' ') : "-"
                                ,style: TextStyle(fontSize: 18,color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              Container(
                height: height-barheight,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white24,
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Batting",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text("TEST",style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text("ODI",style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text("T20",style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text("Domestic",style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Matches",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(matchesTest.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(matchesODI.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(matchesT20.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(matchesD.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Innings",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(inningsTest.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(inningsODI.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(inningsT20.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(inningsD.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Runs",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(runsTest.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(runsODI.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(runsT20.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(runsD.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Balls",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(ballsTest.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(ballsODI.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(ballsT20.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(ballsD.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Highest",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                  highest_test.toString().substring(0,1)=="N"?
                                  "-":
                                  highest_test.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(
                                  highest_odi.toString().substring(0,1)=="N"?
                                  "-":
                                  highest_odi.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(
                                  highest_t20.toString().substring(0,1)=="N"?
                                  "-":
                                  highest_t20.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(highest_domestic.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Average",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                  averageTest.toString().substring(0,1)=="N"?
                                  "-":
                                  averageTest.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(
                                  averageODI.toString().substring(0,1)=="N"?
                                  "-":
                                  averageODI.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(
                                  averageT20.toString().substring(0,1)=="N"?
                                  "-":
                                  averageT20.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(averageD.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("SR",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                  strickRateTest.toString().substring(0,1)=="N"?
                                  "-":
                                  strickRateTest.toStringAsFixed(2)
                                  ,style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(
                                  strickRateODI.toString().substring(0,1)=="N"?
                                  "-":
                                  strickRateODI.toStringAsFixed(2)
                                  ,style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(
                                  strickRateT20.toString().substring(0,1)=="N"?
                                  "-":
                                  strickRateT20.toStringAsFixed(2)
                                  ,style: TextStyle(color: Colors.white)),
                            )
                            // ,Container(
                            //   alignment: Alignment.center,
                            //   child: Text(
                            //
                            //       strickRateD.toStringAsFixed(2)
                            //
                            //       ,style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Not Out",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(notOutsTest.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(notOutsODI.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(notOutsT20.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(notOutsD.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Fours",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(foursTest.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(foursODI.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(foursT20.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(foursD.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Sixes",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(sixesTest.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(sixesODI.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(sixesT20.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(sixesD.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("50s",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(fiftiesTest.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(fiftiesODI.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(fiftiesT20.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(fiftiesD.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("100s",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(hundredsTest.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(hundredsODI.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(hundredsT20.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(hundredsD.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ),
              Container(
                height: height-barheight,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white24,
                        height: barheight,
                        padding:
                        EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30)
                        // EdgeInsets.symmetric(horizontal: 10,vertical: 10)
                        ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Bowling",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text("TEST",style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text("ODI",style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text("T20",style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text("Domestic",style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Matches",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(testmatches.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(odimatches.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(t20matches.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(dmatches.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Overs",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(testovers.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(odiovers.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(t20overs.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(dovers.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Innings",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(testinnings.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(odiinnings.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(t20innings.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(dinnings.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Average",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                  testaverage.toString().substring(0,1)=="N"?
                                  "-":
                                  testaverage.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                  odiaverage.toString().substring(0,1)=="N"?
                                  "-":
                                  odiaverage.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                  t20average.toString().substring(0,1)=="N"?
                                  "-":
                                  t20average.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(daverage.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: FittedBox(child: Text("E.Rate",style: TextStyle(color: Colors.white),)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                  testeconRate.toString().substring(0,1)=="N"?
                                  "-":
                                  testeconRate.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(
                                  odieconRate.toString().substring(0,1)=="N"?
                                  "-":
                                  odieconRate.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(
                                  t20econRate.toString().substring(0,1)=="N"?
                                  "-":
                                  t20econRate.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(deconRate.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Medians",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(testmedians.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(odimedians.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(t20medians.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(dmedians.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Runs",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                  testruns.toString()
                                  ,style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(
                                  odiruns.toString()
                                  ,style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(
                                  t20runs.toString()
                                  ,style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(
                            //       druns.toString()
                            //       ,style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Wickets",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(testwickets.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(odiwickets.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(t20wickets.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(dwickets.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Wide",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(testwide.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(odiwide.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(t20wide.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(dwide.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("No ball",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(testnoball.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(odinoball.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(t20noball.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(dnoball.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("Strike Rate",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(teststrikeRate.toStringAsFixed(3),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(odistrikeRate.toStringAsFixed(3),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(t20strikeRate.toStringAsFixed(3),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(dstrikeRate.toStringAsFixed(3),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("4W",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(testfourWickets.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(odifourWickets.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(t20fourWickets.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(dfourWickets.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("5W",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(testfiveWickets.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(odifiveWickets.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(t20fiveWickets.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(dfiveWickets.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: barheight,
                        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width*0.2,
                              alignment: Alignment.center,
                              child: Text("10W",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(testtenWickets.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(oditenWickets.toString(),style: TextStyle(color: Colors.white)),
                            ),Container(
                              alignment: Alignment.center,
                              child: Text(t20tenWickets.toString(),style: TextStyle(color: Colors.white)),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Text(dtenWickets.toString(),style: TextStyle(color: Colors.white)),
                            // ),
                          ],
                        ),
                      ),
                      // Container(
                      //   height: barheight,
                      //   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Container(
                      //         width: width*0.2,
                      //         alignment: Alignment.center,
                      //         child: Text("Rate",style: TextStyle(color: Colors.white),),
                      //       ),
                      //       Container(
                      //         alignment: Alignment.center,
                      //         child: Text(testrate.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                      //       ),Container(
                      //         alignment: Alignment.center,
                      //         child: Text(odirate.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                      //       ),Container(
                      //         alignment: Alignment.center,
                      //         child: Text(t20rate.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                      //       ),
                      //       // Container(
                      //       //   alignment: Alignment.center,
                      //       //   child: Text(drate.toStringAsFixed(2),style: TextStyle(color: Colors.white)),
                      //       // ),
                      //     ],
                      //   ),
                      // ),

                    ],
                  ),
                ),

              ),

            ],
          ),
        )



      ),
    );
  }
}
