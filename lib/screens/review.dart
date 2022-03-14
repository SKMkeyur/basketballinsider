import 'dart:convert';

import 'package:basketballinsider/database/database_helper.dart';
import 'package:basketballinsider/models/bookmark_data.dart';
import 'package:basketballinsider/screens/home.dart';
import 'package:basketballinsider/widgets/starrating.dart';
import 'package:basketballinsider/widgets/starratting02.dart';
import 'package:flutter/material.dart';
import 'package:basketballinsider/models/options.dart';
import 'package:basketballinsider/screens/getstarted02.dart';
import 'package:basketballinsider/screens/getstarted01.dart';
import 'package:basketballinsider/screens/getstarted03.dart';
import 'package:basketballinsider/screens/getstarted04.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
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
  bool isloading=true;
   late List<Value> dogbreedList;

  late List<Map<String,dynamic>> values;

  Future getData() async{
    setState(() {
      isloading=true;
    });

     List<Value> queryRows = await DatabaseHelper.instance.queryAll();
       dogbreedList = queryRows;
    if(dogbreedList.length>0) {
      setState(() {
        isloading = false;
      });
    }
    // print(queryRows);

  }
  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
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
    double height = height1-safe;
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
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
                            // Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => HomeScreen()
                            )
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width*0.50,
                        child: Text("BookMark",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),
                        )
                    ),
                    Container(
                      width: width*0.20,
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
              //Review and back button

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
                  height: height*0.9,
                  color: Colors.white,
                  child:
                  isloading==true?
                      Container(
                        height: height*0.9,
                      width: width,
                        child: Center(child: Text("No Bookmarks Added",style: TextStyle(color: Colors.black,fontSize: 30),)),
                      ):

                  ListView.builder(
                      itemCount: dogbreedList.length,
                      itemBuilder: (context,index){
                        return Container(
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
                                      child:
                                       Image.network(
                                         dogbreedList[index].siteBgImage.toString(),
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

                                      // Image.asset(dogbreedList[index].siteBgImage.toString(),scale: 1,fit: BoxFit.cover,width: width*0.8,),
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
                                      child: Text(dogbreedList[index].siteTitle.toString(),style: TextStyle(fontSize: 20),),
                                    ),
                                    Container(
                                      height: height*0.12*0.7,
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: width*.5,
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
                                                        rating: double.parse(dogbreedList[index].siteRatings.toString()),
                                                        onRatingChanged: (rating) => setState(() {}),
                                                        color: Colors.transparent,
                                                        size: 18,
                                                      ),
                                                      SizedBox(width: 5,),
                                                      Text(dogbreedList[index].siteRatings.toString(), style: TextStyle(fontSize: 16 , color: Colors.grey),)

                                                    ],
                                                  ),

                                                ),
                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                                  height: height*0.12*0.7*0.5,
                                                  color: Colors.white,

                                                  child: Text(dogbreedList[index].siteBonus.toString(),
                                                    style: TextStyle(fontWeight: FontWeight.bold),),
                                                ),
                                              ],
                                            ),

                                          ),
                                          Container(
                                            width: width*0.1,
                                            child: InkWell(
                                                onTap: () async {
                                                  int rowsEffected = await DatabaseHelper.instance.delete(int.parse(dogbreedList[index].siteId.toString()));
                                                  print(rowsEffected);
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext context) => super.widget));
                                                },
                                                child: Icon(FontAwesomeIcons.solidBookmark,color: Color(0xff57bbb4),)),
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
                                                    onPressed: () async {

                                                      Navigator.push(context, MaterialPageRoute(
                                                          builder: (context) =>
                                                              BetDescriptionScreen(
                                                                  dogbreedList[index].siteId.toString(),
                                                                  dogbreedList[index].siteTitle.toString(),
                                                                  dogbreedList[index].siteUrl.toString(),
                                                                  dogbreedList[index].sitePromocode.toString(),
                                                                  dogbreedList[index].siteRatings.toString(),
                                                                  dogbreedList[index].siteFeature1.toString(),
                                                                  dogbreedList[index].siteFeature2.toString(),
                                                                  dogbreedList[index].siteFeature3.toString(),
                                                                  dogbreedList[index].siteFeature4.toString(),
                                                                  dogbreedList[index].siteLogo.toString(),
                                                                  DateTime.parse(dogbreedList[index].siteAddedDate!),
                                                                  dogbreedList[index].siteFeature5.toString(),
                                                                  dogbreedList[index].siteFeature6.toString(),
                                                                  dogbreedList[index].siteCons1.toString(),
                                                                  dogbreedList[index].siteCons2.toString(),
                                                                  dogbreedList[index].siteCons3.toString(),
                                                                  dogbreedList[index].siteCons4.toString(),
                                                                  dogbreedList[index].siteCons5.toString(),
                                                                  dogbreedList[index].siteCons6.toString(),
                                                                  dogbreedList[index].siteShortDescription.toString(),
                                                                  dogbreedList[index].siteLongDescrtiption.toString(),
                                                                  dogbreedList[index].siteBonus.toString(),
                                                                  dogbreedList[index].siteBgImage.toString())

                                                      )
                                                      );
                                                      // _launchURL(dogbreedList[index].siteUrl);
                                                      // print(dogbreedList[index].siteUrl);

                                                    },
                                                    child: Text("Join "+dogbreedList[index].siteTitle.toString(),style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
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
                        );

                  })
              ),

            ],

          ),
        ),
      ),
    );
  }
}
