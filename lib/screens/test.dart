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


class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
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
        body: Column(
          children: [
            Container(
              height: height*0.08,
              color: Colors.white,
              child:
              Row(
                children: [
                  Container(
                    width: width*0.25,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.fromLTRB(0, 5, 20, 10),

                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xff57bbb4),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      alignment: Alignment.center,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,),
                        onPressed: (){
                          // Navigator.push(context, MaterialPageRoute(
                          //     builder: (context) => GetStarted01())
                          // );
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      width: width*0.50,
                      child: Text("Home",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),
                      )
                  ),
                  Container(
                    width: width*0.25,
                    alignment: Alignment.center,
                    child: Icon(Icons.search),

                  ),
                ],
              ),
            ),
            Container(
              height: height*0.9,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF03185A),
                      Color(0xFF003900),
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(0.0, 1.0),
                  )
              ),

              child: Column(
                children: [
                  Container(

                    height: height*.30,
                    child: Column(
                      children:  [
                        SizedBox(height:10,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Best Mobile Sports Betting Apps",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),)),
                        ),
                        Padding(
                          //padding: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Looking for the best sports betting app US to wager on tonight's game? Thanks to the recent explosion"
                                  "in sports betting, there are now dozens of sports betting apps to choose from"
                                  "",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w100,height: 1.5),)
                          ),
                        ),

                        Divider(height: height*0.011,color: Colors.white,thickness: height*0.0029,),
                        Padding(
                          //padding: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Container(  //Friday, 20 July 13:50
                                    width: width*0.7,
                                    child: Text("$formattedDate"
                                        "",
                                      style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400,height: 1.5),),
                                  ),

                                  Text(
                                    "26°",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400,height: 1.5),
                                  ),
                                  SizedBox(width: 5,),
                                  Icon(Icons.wb_sunny_rounded ,color: Colors.yellow,size: 18,),
                                ],
                              )
                          ),
                        ),

                        Divider(height: height*0.011,color: Colors.white,thickness: height*0.0029,),
                      ],
                    ),

                  ),
                  Container(
                    //  color: Colors.pink,
                    height: height*.6,
                    child:
                    Container(
                      height: height*.55,
                      child: ListView(
                        children: [
                          CarouselSlider(
                            items: [
                              //1st Image of Slider
                              Container(
                                height: height*0.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.white
                                  // image: DecorationImage(
                                  //  // image: NetworkImage("https://picsum.photos/250?image=9"),
                                  //   image: new AssetImage("graphic_res/gs1.png"),
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),

                                child: Column(
                                  children: [
                                    Container(
                                      height: height*.2,

                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: Image.asset('graphic_res/design_3_assets/3/Image.png',fit: BoxFit.cover,),
                                    ),
                                    Container(
                                      height: height*.1,
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          SizedBox(width: width*0.1,),
                                          Text("X-BET"),
                                          SizedBox(width: width*0.2,),
                                          Image.asset('graphic_res/design_3_assets/3/xbet.png',fit: BoxFit.cover,width:100,height: 50,),
                                          // SizedBox(width: width*0.1,),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      alignment: Alignment.centerLeft,
                                      height: height*.1,
                                      child: Text("At the game? Just got a gut feeling?"
                                          "No problem! Now you can bet from anywhere,"
                                          "anytime with the all-new Xbet mobile betting"),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                                        Container(
                                          padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                          width: width*0.40,
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                              width: width*0.3,

                                              height: 50,
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
                                    )



                                  ],
                                ),

                              ),
                              Container(
                                height: height*0.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.white
                                  // image: DecorationImage(
                                  //  // image: NetworkImage("https://picsum.photos/250?image=9"),
                                  //   image: new AssetImage("graphic_res/gs1.png"),
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),

                                child: Column(
                                  children: [
                                    Container(
                                      height: height*.2,

                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: Image.asset('graphic_res/design_3_assets/3/Image-1.png',fit: BoxFit.cover,),
                                    ),
                                    Container(
                                      height: height*.1,
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          SizedBox(width: width*0.1,),
                                          Text("X-BET"),
                                          SizedBox(width: width*0.2,),
                                          Image.asset('graphic_res/design_3_assets/3/xbet.png',fit: BoxFit.cover,height: 50,),
                                          // SizedBox(width: width*0.1,),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      alignment: Alignment.centerLeft,
                                      height: height*.1,
                                      child: Text("At the game? Just got a gut feeling?"
                                          "No problem! Now you can bet from anywhere,"
                                          "anytime with the all-new Xbet mobile betting"),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                                        Container(
                                          padding: EdgeInsets.fromLTRB(0, 0, 5, 0),

                                          width: width*0.40,
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                              width: width*0.3,

                                              height: 50,
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
                                    )
                                    // Container(
                                    //   padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    //   alignment: Alignment.centerLeft,
                                    //   color: Colors.white,
                                    //   height: height*.05,
                                    //   child: StarRating(
                                    //     rating: rating,
                                    //     onRatingChanged: (rating) => setState(() => this.rating = rating),
                                    //     color: Colors.transparent,
                                    //   ),
                                    // )



                                  ],
                                ),

                              ),
                              // Container(
                              //   height: height*0.5,
                              //   margin: EdgeInsets.all(4.0),
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(8.0),
                              //       color: Colors.white
                              //     // image: DecorationImage(
                              //     //  // image: NetworkImage("https://picsum.photos/250?image=9"),
                              //     //   image: new AssetImage("graphic_res/gs1.png"),
                              //     //   fit: BoxFit.cover,
                              //     // ),
                              //   ),
                              //
                              //   child: Column(
                              //     children: [
                              //       Container(
                              //         height: height*.20,
                              //         color: Colors.white,
                              //         alignment: Alignment.center,
                              //         child: Image.asset('graphic_res/gs1.png',fit: BoxFit.cover,),
                              //       ),
                              //       Container(
                              //         height: height*.1,
                              //         color: Colors.white,
                              //         child: Row(
                              //           children: [
                              //             SizedBox(width: width*0.1,),
                              //             Text("X-BET"),
                              //             SizedBox(width: width*0.3,),
                              //             Image.asset('graphic_res/gs1.png',fit: BoxFit.cover,width: 50,height: 50,),
                              //             SizedBox(width: width*0.1,),
                              //           ],
                              //         ),
                              //       ),
                              //       Container(
                              //         padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              //         alignment: Alignment.centerLeft,
                              //         height: height*.1,
                              //         child: Text("At the game? Just got a gut feeling?"
                              //             "No problem! Now you can bet from anywhere,"
                              //             "anytime with the all-new Xbet mobile betting"),
                              //       ),
                              //       Container(
                              //         padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              //         alignment: Alignment.centerLeft,
                              //         height: height*.1,
                              //         child: StarRating(
                              //           rating: rating,
                              //           onRatingChanged: (rating) => setState(() => this.rating = rating),
                              //           color: Colors.transparent,
                              //         ),
                              //       )
                              //
                              //
                              //
                              //     ],
                              //   ),
                              //
                              // ),

                              //2nd Image of Slider
                              // Container(
                              //   margin: EdgeInsets.all(6.0),
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(8.0),
                              //     image: DecorationImage(
                              //       image: NetworkImage("https://picsum.photos/250?image=9"),
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ),
                              // ),

                              //3rd Image of Slider
                              // Container(
                              //   margin: EdgeInsets.all(6.0),
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(8.0),
                              //     image: DecorationImage(
                              //       image: NetworkImage("https://picsum.photos/250?image=9"),
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ),
                              // ),
                              //
                              // //4th Image of Slider
                              // Container(
                              //   margin: EdgeInsets.all(6.0),
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(8.0),
                              //     image: DecorationImage(
                              //       image: NetworkImage("https://picsum.photos/250?image=9"),
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ),
                              // ),
                              //
                              // //5th Image of Slider
                              // Container(
                              //   margin: EdgeInsets.all(6.0),
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(8.0),
                              //     image: DecorationImage(
                              //       image: NetworkImage("https://picsum.photos/250?image=9"),
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ),
                              // ),

                            ],

                            //Slider Container properties
                            options: CarouselOptions(
                              height: height*0.55,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              viewportFraction: 0.8,
                            ),
                          ),
                        ],
                      ),
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
