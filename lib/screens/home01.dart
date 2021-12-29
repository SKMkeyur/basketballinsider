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
//import 'package:weather/weather.dart';
import 'package:intl/intl.dart';


class HomeScreen01 extends StatefulWidget {
  const HomeScreen01({Key? key}) : super(key: key);

  @override
  _HomeScreen01State createState() => _HomeScreen01State();
}

class _HomeScreen01State extends State<HomeScreen01> {
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
    return SafeArea(
      child: Scaffold(
       body:
        Container(
          height: height,
          width: width,
          color: Colors.red,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardWidget("graphic_res/design_3_assets/3/Image.png"),
                CardWidget("graphic_res/design_3_assets/3/Image-1.png")
                // Container(
                //   height: height*.48,
                //   width: width*.82,
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.all(Radius.circular(20)),
                //   ),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       Image.asset("graphic_res/design_3_assets/3/Image.png",height: height*.48*.51,),
                //       Container(
                //         padding: EdgeInsets.symmetric(horizontal: 20),
                //         height: height*.48*.10,
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text("XBET"),
                //             Image.asset("graphic_res/design_3_assets/3/xbet.png"),
                //           ],
                //         ),
                //       ),
                //       Container(
                //         padding: EdgeInsets.symmetric(horizontal: 20),
                //         height: height*.48*.17,
                //         child: Text("At the game? Just got a gut feeling?"
                //             "No problem! Now you can bet from anywhere,"
                //             "anytime with the all-new Xbet mobile betting"),
                //       ),
                //       Container(
                //         padding: EdgeInsets.symmetric(horizontal: 20),
                //         height: height*.48*.097,
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //               children: [
                //                 Container(
                //                   alignment: Alignment.centerLeft,
                //                   color: Colors.white,
                //                   height: height*.05,
                //                   child: StarRating02(
                //                     size: 18,
                //                     rating: rating,
                //                     onRatingChanged: (rating) => setState(() => this.rating = rating),
                //                     color: Colors.transparent,
                //                   ),
                //                 ),
                //                 SizedBox(width: 5,),
                //                 Text("4.5", style: TextStyle(fontSize: 16 , color: Colors.grey),),
                //               ],
                //             ),
                //             Container(
                //               alignment: Alignment.centerRight,
                //               child: Container(
                //                   width: width*0.3,
                //                   decoration: BoxDecoration(
                //                     color: Color(0xff57bbb4),
                //                     borderRadius: BorderRadius.all(Radius.circular(10)),
                //                   ),
                //                   alignment: Alignment.center,
                //                   child:  TextButton(
                //                     onPressed: (){},
                //                     child: FittedBox(
                //                         fit: BoxFit.fitWidth,
                //                         child: Text("Claim Bonus",style: TextStyle(color: Colors.white),)),
                //                   )
                //               ),
                //             ),
                //
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
