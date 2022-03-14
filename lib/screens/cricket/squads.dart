import 'package:basketballinsider/models/squad_by_team_id_season_id_cricket.dart';
import 'package:basketballinsider/models/team_with_squad_by_id_football.dart';
import 'package:basketballinsider/services/get_team_squad_by_id_football.dart';
import 'package:basketballinsider/services/squad_cricket_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../player_details_cricket.dart';

class SuadPlayers extends StatefulWidget {
//  const SuadPlayers({Key? key}) : super(key: key);

  late String id;
  late String name;
  late String seasonId;

  SuadPlayers(this.id, this.name,this.seasonId);

  @override
  _SuadPlayersState createState() => _SuadPlayersState();
}

class _SuadPlayersState extends State<SuadPlayers> {

  late bool isLoading = true;
  late SquadByTeamidSeasonIdCricket squadByTeamidSeasonIdCricket;

  getSquad() async{
    setState(() {
      isLoading=true;
    });
    GetSquadByTeamIdSeasonIdCricket.getUsers(widget.id,widget.seasonId).then((sites){
      print(sites);
      if(sites!=null){
        setState(() {
          squadByTeamidSeasonIdCricket=sites;
          print(squadByTeamidSeasonIdCricket);
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
        title: FittedBox(child: Text(widget.name+ " Squad",style: TextStyle(color: Colors.white),)),


      ),
      body:
      isLoading==false?
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
          child: ListView.builder(
              itemCount: squadByTeamidSeasonIdCricket.data!.squad!.length,
              itemBuilder: (context,index){
            return InkWell(
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
                      Image.asset('graphic_res/user_.jpeg'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(squadByTeamidSeasonIdCricket.data!.squad![index].fullname.toString(),style: TextStyle(color: Colors.white),),
                        Text(squadByTeamidSeasonIdCricket.data!.squad![index].position!.name.toString().substring(5).toLowerCase(),style: TextStyle(color: Colors.white),)
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
          height: height*0.2,
          alignment: Alignment.center,
          child: Center(child: CircularProgressIndicator()))
    );
  }
}
