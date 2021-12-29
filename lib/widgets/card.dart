import 'package:basketballinsider/widgets/starratting02.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';




class CardWidget extends StatefulWidget {
  //const CardWidget({Key? key}) : super(key: key);

  late  String path;

  CardWidget(this.path);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  double rating = 3.5;
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, d MMM  kk:mm  ').format(now);
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;
    return  Container(
      padding: EdgeInsets.all(10),
      child: Container(
        height: height*.48,
        width: width*.82,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(widget.path,height: height*.48*.51,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: height*.48*.10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("XBET"),
                  Image.asset("graphic_res/design_3_assets/3/xbet.png"),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: height*.48*.17,
              child: Text("At the game? Just got a gut feeling?"
                  "No problem! Now you can bet from anywhere,"
                  "anytime with the all-new Xbet mobile betting"),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: height*.48*.097,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        color: Colors.white,
                        height: height*.05,
                        child: StarRating02(
                          size: 18,
                          rating: rating,
                          onRatingChanged: (rating) => setState(() => this.rating = rating),
                          color: Colors.transparent,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text("4.5", style: TextStyle(fontSize: 16 , color: Colors.grey),),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                        width: width*0.3,
                        decoration: BoxDecoration(
                          color: Color(0xff57bbb4),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        alignment: Alignment.center,
                        child:  TextButton(
                          onPressed: (){},
                          child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text("Claim Bonus",style: TextStyle(color: Colors.white),)),
                        )
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
