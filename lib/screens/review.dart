import 'package:basketballinsider/widgets/starrating.dart';
import 'package:basketballinsider/widgets/starratting02.dart';
import 'package:flutter/material.dart';
import 'package:basketballinsider/models/options.dart';
import 'package:basketballinsider/screens/getstarted02.dart';
import 'package:basketballinsider/screens/getstarted01.dart';
import 'package:basketballinsider/screens/getstarted03.dart';
import 'package:basketballinsider/screens/getstarted04.dart';
import 'betdescription.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  double rating1 = 3.5;
  double rating2 = 3.5;

  bool favorite = false;
  @override
  Widget build(BuildContext context) {

    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.white,
              height: height*0.1,
              child: Row(
                children: [
                  Container(
                    width: width*0.20,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
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
                      child: Text("Review",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),
                      )
                  ),
                  Container(
                    width: width*0.20,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),   //Review and back button
            // Container(
            //   color: Colors.white,
            //   height: height*0.1,
            // //  alignment: Alignment.center,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //
            //       SizedBox(width: 30,),
            //       Container(
            //         width: width*0.22,
            //         alignment: Alignment.centerRight,
            //         padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
            //
            //         child: Container(
            //             width: 120,
            //             height: 40,
            //             decoration: BoxDecoration(
            //               color: Color(0xff57bbb4),
            //               borderRadius: BorderRadius.all(Radius.circular(10)),
            //             ),
            //             alignment: Alignment.center,
            //             child:  TextButton(
            //               onPressed: (){},
            //               child: FittedBox(
            //                   fit: BoxFit.fitWidth,
            //                   child: Text("Date",style: TextStyle(color: Colors.white),)),
            //             )
            //         ),
            //       ),
            //       Container(
            //         width: width*0.22,
            //         alignment: Alignment.centerRight,
            //         padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
            //
            //         child: Container(
            //             width: 120,
            //             height: 40,
            //             decoration: BoxDecoration(
            //               color: Colors.white,
            //               border: Border.all(
            //                 color: Colors.grey,
            //               ),
            //               borderRadius: BorderRadius.all(Radius.circular(10)),
            //             ),
            //             alignment: Alignment.center,
            //             child:
            //             TextButton(
            //               onPressed: (){},
            //               child: FittedBox(
            //                   fit: BoxFit.fitWidth,
            //                   child: Text("Follow",style: TextStyle(color: Colors.black),)),
            //             )
            //         ),
            //       ),
            //       Container(
            //         width: width*0.22,
            //         alignment: Alignment.centerRight,
            //         padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
            //
            //         child: Container(
            //             width: 120,
            //             height: 40,
            //             decoration: BoxDecoration(
            //               color:  Colors.white,
            //               border: Border.all(
            //                 color: Colors.grey,
            //               ),
            //               borderRadius: BorderRadius.all(Radius.circular(10)),
            //             ),
            //             alignment: Alignment.center,
            //             child:
            //             TextButton(
            //               onPressed: (){},
            //               child: FittedBox(
            //                   fit: BoxFit.fitWidth,
            //                   child: Text("Rating",style: TextStyle(color: Colors.black),)),
            //             )
            //         ),
            //       ),
            //       Container(
            //         width: width*0.22,
            //         alignment: Alignment.centerRight,
            //         padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
            //
            //         child: Container(
            //             width: 120,
            //             height: 40,
            //             decoration: BoxDecoration(
            //               border: Border.all(
            //                 color: Colors.grey,
            //               ),
            //               color: Colors.white,
            //               borderRadius: BorderRadius.all(Radius.circular(10)),
            //             ),
            //             alignment: Alignment.center,
            //             child:
            //             TextButton(
            //               onPressed: (){},
            //               child: FittedBox(
            //                   fit: BoxFit.fitWidth,
            //                   child: Text("Price",style: TextStyle(color: Colors.black),)),
            //             )
            //         ),
            //       ),
            //
            //     ],
            //   ),
            // ),   // Date Follow 4s

            Container(
                height: height*0.8,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: width,
                      height: height*0.4,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            width: width,
                            height: height*0.28,
                            color: Colors.white,
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  alignment: Alignment.center,
                                  child: Image.asset("graphic_res/review01.png",scale: 1,fit: BoxFit.cover,width: width*0.8,),
                                ),

                                // Container(
                                // padding: EdgeInsets.fromLTRB(width*0.1, 0, 0, height*0.28*0.6),
                                //  // alignment: Alignment.topLeft,
                                //   child: Container(
                                //     padding: EdgeInsets.symmetric(horizontal: 15),
                                //     width: width*0.2,
                                //     alignment: Alignment.centerRight,
                                //     child: Container(
                                //         width: 100,
                                //         height: 40,
                                //         decoration: BoxDecoration(
                                //           color: Color(0xff57bbb4),
                                //           borderRadius: BorderRadius.all(Radius.circular(10)),
                                //         ),
                                //         alignment: Alignment.center,
                                //         child:  TextButton(
                                //           onPressed: (){},
                                //           child: Text("1",style: TextStyle(color: Colors.white),),
                                //         )
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),





                          ),
                          Container(
                            height: height*0.12,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  height: height*0.12*0.3,
                                  width: width,
                                  color: Colors.white,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text("XBet",style: TextStyle(fontSize: 20),),
                                ),
                                Container(
                                  height: height*0.12*0.7,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: width*.6,
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 20),
                                              height: height*0.12*0.7*0.5,
                                              color: Colors.white,
                                                child: Row(
                                                  children: [
                                                    StarRating02(
                                                      rating: rating1,
                                                      onRatingChanged: (rating) => setState(() => this.rating1 = rating),
                                                      color: Colors.transparent,
                                                      size: 18,
                                                    ),
                                                    SizedBox(width: 5,),
                                                    Text("$rating1", style: TextStyle(fontSize: 16 , color: Colors.grey),)

                                                  ],
                                                ),

                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.symmetric(horizontal: 20),
                                              height: height*0.12*0.7*0.5,
                                            color: Colors.white,

                                              child: Text("From \$250 / Person",
                                                style: TextStyle(fontWeight: FontWeight.bold),),
                                            ),
                                          ],
                                        ),

                                      ),
                                      Container(
                                        width: width*.4,
                                        color: Colors.white,
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                          alignment: Alignment.centerRight,

                                          child: Container(
                                              width: 150,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Color(0xff57bbb4),
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                              ),
                                              alignment: Alignment.center,
                                              child:  TextButton(
                                                onPressed: (){
                                                  // Navigator.push(context, MaterialPageRoute(
                                                  //     builder: (context) => BetDescriptionScreen())
                                                  // );

                                                },
                                                child: FittedBox(
                                                    fit: BoxFit.fitWidth,
                                                    child: Text("JOIN XBET NOW",style: TextStyle(color: Colors.white),)),
                                              )
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: width,
                      height: height*0.4,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            width: width,
                            height: height*0.28,
                            color: Colors.white,
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  alignment: Alignment.center,
                                  child: Image.asset("graphic_res/review02.png",scale: 1,fit: BoxFit.cover,width: width*0.8,),
                                ),

                                // Container(
                                //   padding: EdgeInsets.fromLTRB(width*0.1, 0, 0, height*0.28*0.6),
                                //   // alignment: Alignment.topLeft,
                                //   child: Container(
                                //     padding: EdgeInsets.symmetric(horizontal: 15),
                                //     width: width*0.2,
                                //     alignment: Alignment.centerRight,
                                //     child: Container(
                                //         width: 100,
                                //         height: 40,
                                //         decoration: BoxDecoration(
                                //           color: Color(0xff57bbb4),
                                //           borderRadius: BorderRadius.all(Radius.circular(10)),
                                //         ),
                                //         alignment: Alignment.center,
                                //         child:  TextButton(
                                //           onPressed: (){},
                                //           child: Text("2",style: TextStyle(color: Colors.white),),
                                //         )
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),





                          ),
                          Container(
                            height: height*0.12,
                            color: Colors.purple,
                            child: Column(
                              children: [
                                Container(
                                  height: height*0.12*0.3,
                                  width: width,
                                  color: Colors.white,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text("BetUS",style: TextStyle(fontSize: 20),),
                                ),
                                Container(
                                  height: height*0.12*0.7,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: width*.6,
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 20),
                                              height: height*0.12*0.7*0.5,
                                              color: Colors.white,
                                              child: Row(
                                                children: [
                                                  StarRating02(
                                                    rating: rating2,
                                                    onRatingChanged: (rating) => setState(() => this.rating2 = rating),
                                                    color: Colors.transparent,
                                                    size: 18,
                                                  ),
                                                  SizedBox(width: 5,),
                                                  Text("$rating2", style: TextStyle(fontSize: 16 , color: Colors.grey),)

                                                ],
                                              ),

                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.symmetric(horizontal: 20),
                                              height: height*0.12*0.7*0.5,
                                              color: Colors.white,

                                              child: Text("From \$220 / Person"
                                              ,style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),

                                      ),
                                      Container(
                                        width: width*.4,
                                        color: Colors.white,
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                          alignment: Alignment.centerRight,

                                          child: Container(
                                              width: 150,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Color(0xff57bbb4),
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                              ),
                                              alignment: Alignment.center,
                                              child:  TextButton(
                                                onPressed: (){
                                                  // Navigator.push(context, MaterialPageRoute(
                                                  //     builder: (context) => BetDescriptionScreen())
                                                  // );

                                                },
                                                child: FittedBox(
                                                    fit: BoxFit.fitWidth,
                                                    child: Text("JOIN BETUS NOW",style: TextStyle(color: Colors.white),)),
                                              )
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )

                                // Container(
                                //   height: height*0.12*0.7,
                                //   color: Colors.blueAccent,
                                //   child: Row(
                                //     children: [
                                //       Container(
                                //         width: width*.5,
                                //         color: Colors.white,
                                //         child: Column(
                                //           children: [
                                //             Container(
                                //               padding: EdgeInsets.symmetric(horizontal: 20),
                                //               height: height*0.12*0.7*0.5,
                                //               color: Colors.white,
                                //               child: Row(
                                //                 children: [
                                //                   StarRating(
                                //                     rating: rating2,
                                //                     onRatingChanged: (rating) => setState(() => this.rating2 = rating),
                                //                     color: Colors.transparent,
                                //                   ),
                                //                   SizedBox(width: 5,),
                                //                   Text("$rating2", style: TextStyle(fontSize: 16 , color: Colors.grey),)
                                //
                                //                 ],
                                //               ),
                                //
                                //             ),
                                //             Container(
                                //               alignment: Alignment.centerLeft,
                                //               padding: EdgeInsets.symmetric(horizontal: 20),
                                //               height: height*0.12*0.7*0.5,
                                //               color: Colors.white,
                                //
                                //               child: Text("From \$220 / Person"),
                                //             ),
                                //           ],
                                //         ),
                                //
                                //       ),
                                //       Container(
                                //         width: width*.5,
                                //         color: Colors.white,
                                //         child: Container(
                                //           width: width*0.20,
                                //           alignment: Alignment.centerRight,
                                //           padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
                                //
                                //           child: Container(
                                //               width: 150,
                                //               height: 50,
                                //               decoration: BoxDecoration(
                                //                 color: Color(0xff57bbb4),
                                //                 borderRadius: BorderRadius.all(Radius.circular(10)),
                                //               ),
                                //               alignment: Alignment.center,
                                //               child:  TextButton(
                                //                 onPressed: (){},
                                //                 child: Text("JOIN BETUS NOW",style: TextStyle(color: Colors.white),),
                                //               )
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ),

          ],

        ),
      ),
    );
  }
}
