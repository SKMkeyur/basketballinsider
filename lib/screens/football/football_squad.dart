import 'package:basketballinsider/models/team_with_squad_by_id_football.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:basketballinsider/services/get_team_squad_by_id_football.dart';

import '../player_details_football.dart';

class FootballSquadScreen extends StatefulWidget {

  late String id;
  late String name;

  FootballSquadScreen(this.id,this.name);

  @override
  _FootballSquadScreenState createState() => _FootballSquadScreenState();
}

class _FootballSquadScreenState extends State<FootballSquadScreen> {


  late bool isLoading = true;
  late TeamWithSquadByIdFootball teamWithSquadByIdFootball;

  getSquad()async {
    setState(() {
      isLoading=true;
    });

    GetTeamSquadByIdFootvball.getUsers(widget.id).then((sites) {
      print(sites);
      if(sites!=null){
        setState(() {
          print(sites);
          teamWithSquadByIdFootball=sites;
          isLoading=false;
        });

      }
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSquad();
  }



  @override
  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double barheight =AppBar().preferredSize.height;
    double height = height1-safe-barheight;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(FontAwesomeIcons.arrowLeft),
          color: Colors.white,),
        backgroundColor: Color(0xff083471),
        title: FittedBox(child: Text(
          widget.name+
              " Squad"
          ,style: TextStyle(color: Colors.white),)),
        // actions: [
        //   // Container(
        //   //     padding: EdgeInsets.symmetric(horizontal: 20),
        //   //     child: Icon(Icons.share,color: Colors.white,))
        // ],
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
            height: height,
            width: width,
            child:
            isLoading==false?
            Container(
              child: ListView.builder(
                  itemCount: teamWithSquadByIdFootball.data!.squad!.data!.length,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => PlayerDetailsFootball(
                              teamWithSquadByIdFootball.data!.squad!.data![index].playerId.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].positionId.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].number.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].captain.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].injured.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].minutes.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].appearences.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].lineups.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].substituteIn.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].substituteOut.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].substitutesOnBench.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].goals.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].owngoals.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].assists.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].saves.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].insideBoxSaves.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].dispossesed.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].interceptions.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].yellowcards.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].yellowred.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].redcards.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].tackles.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].blocks.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].hitPost.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].cleansheets.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].rating.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].crosses!.total.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].crosses!.accurate.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].dribbles!.attempts.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].dribbles!.success.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].dribbles!.dribbledPast.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].duels!.won.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].fouls!.committed.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].fouls!.drawn.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].passes!.total.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].passes!.accuracy.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].passes!.keyPasses.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].penalties!.won.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].penalties!.scores.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].penalties!.missed.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].penalties!.committed.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].penalties!.saves.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].player!.data!.countryId.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].player!.data!.commonName.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].player!.data!.displayName.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].player!.data!.fullname.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].player!.data!.firstname.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].player!.data!.lastname.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].player!.data!.nationality.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].player!.data!.birthdate.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].player!.data!.birthcountry.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].player!.data!.birthplace.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].player!.data!.height.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].player!.data!.weight.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].player!.data!.imagePath.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].shots!.shotsTotal.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].shots!.shotsOnTarget.toString(),
                              teamWithSquadByIdFootball.data!.squad!.data![index].shots!.shotsOffTarget.toString(),
                            )
                        )
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        width: width,
                        margin: EdgeInsets.all(10),
                        height: height*0.1,
                        child:  Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
                              alignment: Alignment.center,
                              height: 120,
                              width: 100,
                              child:
                              teamWithSquadByIdFootball.data!.squad!.data![index].player!.data!.imagePath.toString().contains("png")?
                              Image.network(

                                teamWithSquadByIdFootball.data!.squad!.data![index].player!.data!.imagePath.toString()
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(teamWithSquadByIdFootball.data!.squad!.data![index].player!.data!.displayName.toString()+
                                    " ",style: TextStyle(color: Colors.white),),
                                Text(teamWithSquadByIdFootball.data!.squad!.data![index].captain.toString()=="0"?
                                "":"(c)",style: TextStyle(color: Colors.white),)

                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),

            ):
            Container(
                width: width,
                height: height*0.7,
                alignment: Alignment.center,
                child: Center(child: CircularProgressIndicator())
            ),
          )


    );
  }
}
