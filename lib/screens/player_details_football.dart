import 'package:basketballinsider/models/team_with_squad_by_id_football.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayerDetailsFootball extends StatefulWidget {

  late String playerId;
  late String positionId;
  late String number;
  late String captain;
  late String injured;
  late String minutes;
  late String appearences;
  late String lineups;
  late String substituteIn;
  late String substituteOut;
  late String substitutesOnBench;
  late String goals;
  late String owngoals;
  late String assists;
  late String saves;
  late String insideBoxSaves;
  late String dispossesed;
  late String interceptions;
  late String yellowcards;
  late dynamic yellowred;
  late dynamic redcards;
  late String tackles;
  late String blocks;
  late String hitPost;
  late String cleansheets;
  late String rating;
  late String total;
  late String accurate;
  late String attempts;
  late String success;
  late String dribbledPast;
  late String won;
  late String committed;
  late String drawn;
  late String totalpasses;
  late String accuracy;
  late String keyPasses;
  late String wonPenalties;
  late String scoresPenalties;
  late String missedPenalties;
  late dynamic committedPenalties;
  late dynamic savesPenalties;
  late String countryId;
  late String commonName;
  late String displayName;
  late String fullname;
  late String firstname;
  late String lastname;
  late String nationality;
  late String birthdate;
  late String birthcountry;
  late String birthplace;
  late String height;
  late String weight;
  late String imagePath;
  late String shotsTotal;
  late String shotsOnTarget;
  late dynamic shotsOffTarget;


  PlayerDetailsFootball(
      this.playerId,
      this.positionId,
      this.number,
      this.captain,
      this.injured,
      this.minutes,
      this.appearences,
      this.lineups,
      this.substituteIn,
      this.substituteOut,
      this.substitutesOnBench,
      this.goals,
      this.owngoals,
      this.assists,
      this.saves,
      this.insideBoxSaves,
      this.dispossesed,
      this.interceptions,
      this.yellowcards,
      this.yellowred,
      this.redcards,
      this.tackles,
      this.blocks,
      this.hitPost,
      this.cleansheets,
      this.rating,
      this.total,
      this.accurate,
      this.attempts,
      this.success,
      this.dribbledPast,
      this.won,
      this.committed,
      this.drawn,
      this.totalpasses,
      this.accuracy,
      this.keyPasses,
      this.wonPenalties,
      this.scoresPenalties,
      this.missedPenalties,
      this.committedPenalties,
      this.savesPenalties,
      this.countryId,
      this.commonName,
      this.displayName,
      this.fullname,
      this.firstname,
      this.lastname,
      this.nationality,
      this.birthdate,
      this.birthcountry,
      this.birthplace,
      this.height,
      this.weight,
      this.imagePath,
      this.shotsTotal,
      this.shotsOnTarget,
      this.shotsOffTarget);

  @override
  _PlayerDetailsFootballState createState() => _PlayerDetailsFootballState();
}

class _PlayerDetailsFootballState extends State<PlayerDetailsFootball> {
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
          color: Colors.black,),
        backgroundColor: Colors.white,
        title: Text("Player Info",style: TextStyle(color: Colors.black),),
      ),

      body: Container(
        color: Colors.white,
        height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                  Container(
                    height: height*0.4,
                    child:
                    Image.network(
                      widget.imagePath,
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
                    ),
                  ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: FittedBox(
                    child: Text(
                        widget.displayName!="null" ?
                            widget.displayName : "-"
                        ,style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              Container(
                width: width*0.9,
                child: Divider(
                  height: 10,color: Colors.grey,
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
                          "Common Name : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.commonName!="null" ?
                          widget.commonName : "-"
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
                          "Nationality : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.nationality!="null" ?
                          widget.nationality : "-"
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
                          "Birth Date : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.birthdate!="null" ?
                          widget.birthdate : "-"
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
                          "Birth Place : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.birthplace!="null" ?
                          widget.birthplace : "-"
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
                          "Birth Country : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.birthcountry!="null" ?
                          widget.birthcountry : "-"
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
                          "Height : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.height!="null" ?
                          widget.height : "-"
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
                          "Weight : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.weight!="null" ?
                          widget.weight : "-"
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width*0.9,
                  child: Divider(
                    height: 10,color: Colors.grey,
                  ),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: FittedBox(
                    child: Row(
                      children: [
                        Text(
                          "Own Goal : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.owngoals!="null" ?
                          widget.owngoals : "-"
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
                          "Goals : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.goals!="null" ?
                          widget.goals : "-"
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
                          "Assist : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.assists!="null" ?
                          widget.assists : "-"
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
                          "Inside Box Saves : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.insideBoxSaves!="null" ?
                          widget.insideBoxSaves : "-"
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
                          "Saves : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.saves!="null" ?
                          widget.saves : "-"
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
                          "Dispossesed : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.dispossesed!="null" ?
                          widget.dispossesed : "-"
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
                          "Interception : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.interceptions!="null" ?
                          widget.interceptions : "-"
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
                          "Yellow Cards : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.yellowcards!="null" ?
                          widget.yellowcards : "-"
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
                          "Yellow and Red Cards : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.yellowred!="null" ?
                          widget.yellowred : "-"
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
                          "Red Cards : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.redcards!="null" ?
                          widget.redcards : "-"
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
                          "Tackles : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.tackles!="null" ?
                          widget.tackles : "-"
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
                          "Blocks : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.blocks!="null" ?
                          widget.blocks : "-"
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
                          "Clean Sheets : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.cleansheets!="null" ?
                          widget.cleansheets : "-"
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
                          "Rating : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.rating!="null" ?
                          widget.rating : "-"
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width*0.9,
                  child: Divider(
                    height: 10,color: Colors.grey,
                  ),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: FittedBox(
                    child: Row(
                      children: [
                        Text(
                          "Fouls Commited : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.committed!="null" ?
                          widget.committed : "-"
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
                          "Fouls Drawn : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.drawn!="null" ?
                          widget.drawn : "-"
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width*0.9,
                  child: Divider(
                    height: 10,color: Colors.grey,
                  ),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: FittedBox(
                    child: Row(
                      children: [
                        Text(
                          "Dribbled Past : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.dribbledPast!="null" ?
                          widget.dribbledPast : "-"
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
                          "Dribbled Success : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.success!="null" ?
                          widget.success : "-"
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
                          "Dribbled Attempts : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.attempts!="null" ?
                          widget.attempts : "-"
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width*0.9,
                  child: Divider(
                    height: 10,color: Colors.grey,
                  ),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: FittedBox(
                    child: Row(
                      children: [
                        Text(
                          "Duels Won : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.won!="null" ?
                          widget.won : "-"
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
                          "Total Passes : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.totalpasses!="null" ?
                          widget.totalpasses : "-"
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
                          "Passes Accuracy : "
                          ,style: TextStyle(fontSize: 18,color: Colors.grey),
                        ),
                        Text(
                          widget.accuracy!="null" ?
                          widget.accuracy : "-"
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
    );
  }
}
