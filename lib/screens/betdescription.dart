import 'package:basketballinsider/widgets/starrating.dart';
import 'package:basketballinsider/widgets/starratting01.dart';
import 'package:basketballinsider/widgets/starratting02.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class BetDescriptionScreen extends StatefulWidget {
 // const BetDescriptionScreen({Key? key}) : super(key: key);

  late String id;
  late String title;
  late String url;
  late String promocode;
  late String ratings;
  late String feature1;
  late String feature2;
  late String feature3;
  late String feature4;
  late String logo;
  late DateTime addedDate;
  late String feature5;
  late String feature6;
  late String cons1;
  late String cons2;
  late String cons3;
  late String cons4;
  late String cons5;
  late String cons6;
  late String shortDescription;
  late String longDescription;
  late String bonus;
  late String bgImage;

  BetDescriptionScreen(
      this.id,
      this.title,
      this.url,
      this.promocode,
      this.ratings,
      this.feature1,
      this.feature2,
      this.feature3,
      this.feature4,
      this.logo,
      this.addedDate,
      this.feature5,
      this.feature6,
      this.cons1,
      this.cons2,
      this.cons3,
      this.cons4,
      this.cons5,
      this.cons6,
      this.shortDescription,
      this.longDescription,
      this.bonus,
      this.bgImage);

  @override
  _BetDescriptionScreenState createState() => _BetDescriptionScreenState();
}

class _BetDescriptionScreenState extends State<BetDescriptionScreen> {
  double rating0 = 3.5;
  double rating1 = 3.5;
  double rating2 = 3.5;
  bool favorite = false;
  bool _setstateforheart = false;
  int likes01 = 42;
  bool _setstateforheart01 = false;
  int likes02 = 42;
  bool _setstateforheart02 = false;

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    rating0 = double.parse(widget.ratings);
    rating1 = double.parse(widget.ratings);
    rating2 = double.parse(widget.ratings);

    double h1 = 400;
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 260,
                color: Colors.blue,
                child: Stack(
                  children: [
                      Container(
                        width: width,
                        height: 260,
                        child:
                       // Image.asset('graphic_res/design_3_assets/4/Image.png',fit: BoxFit.cover,),
                        Image.network(
                          widget.bgImage,
                          fit: BoxFit.cover,
                         // width: width*0.20,
                         // height: height*.48*.10,
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
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back,color: Color(0xff57bbb4),size: 20,),
                          onPressed: (){
                            // Navigator.push(context, MaterialPageRoute(
                            //     builder: (context) => GetStarted01())
                            // );
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    // Container(
                    //   alignment: Alignment.topRight,
                    //   padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                    //   child:Container(
                    //       width: 60,
                    //       height: 40,
                    //       decoration: BoxDecoration(
                    //         color: Color(0xff57bbb4),
                    //         borderRadius: BorderRadius.all(Radius.circular(10)),
                    //       ),
                    //       alignment: Alignment.center,
                    //       child:
                    //       TextButton(
                    //         onPressed: (){},
                    //         child: Text(widget.id,style: TextStyle(color: Colors.white),),
                    //       )
                    //   ),
                    // ),
                    
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                height: 120,
                color: Colors.white,
                child: Row(
                  children: [
                   Container(
                     width: width*0.7,
                     color: Colors.white,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Container(
                           padding: EdgeInsets.symmetric(horizontal: 20),
                           width: width*0.7,
                           height: 50,
                           color: Colors.white,
                           child: Text(widget.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),


                         ),
                         Container(

                           alignment: Alignment.centerLeft,
                           width: width*0.5,
                           padding: EdgeInsets.symmetric(horizontal: 20),
                           height: 50,
                           color: Colors.white,
                           child:  Row(
                             children: [
                               StarRating02(
                                 rating: rating0,
                                 onRatingChanged: (rating) => setState(() => this.rating0 = rating),
                                 color: Colors.transparent, size: 18,
                               ),
                               SizedBox(width: 5,),
                               Text("$rating0", style: TextStyle(fontSize: 14 , color: Colors.grey),)

                             ],
                           ),

                         )
                       ],
                     ),
                   ),
                    // Container(
                    //   width: width*0.3,
                    //   color: Colors.white,
                    //   child: Container(
                    //     width: width*0.25,
                    //     alignment: Alignment.centerRight,
                    //     padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
                    //
                    //     child: Container(
                    //       width: 40,
                    //       height: 40,
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         color: Color(0xffececec),
                    //      //   borderRadius: BorderRadius.all(Radius.circular(30)),
                    //       ),
                    //
                    //       //_selectedOption == index - 1
                    //       //                           ? Color(0xff57bbb4) : Colors.blue
                    //       alignment: Alignment.center,
                    //       child: IconButton(
                    //         icon: Icon(
                    //           _setstateforheart == true ? FontAwesomeIcons.solidHeart: FontAwesomeIcons.heart
                    //         ,color: Colors.red,size: 20,),
                    //         onPressed: (){
                    //           setState(() {
                    //             if  (_setstateforheart == true){
                    //               _setstateforheart = false;
                    //             }else{
                    //               _setstateforheart = true;
                    //             }
                    //           });
                    //           // Navigator.push(context, MaterialPageRoute(
                    //           //     builder: (context) => GetStarted01())
                    //           // );
                    //         //  Navigator.pop(context);
                    //         },
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                width: width,
               // height: 700,
              //  color: Colors.blue,
                child: Column(
                  children: [
                    Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 600*0.30,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Description",style: TextStyle(fontSize: 24),),
                          // Text("XBet is the one of the best sport betting apps that we've reviewd"
                          //     ". Firstly, it's an incredibly secure platform, featurting 256-bit encryption and secure"
                          //     "socket layers certificates(SSL). Which in plain English just means",
                          //   style: TextStyle(color:Color(0xff989898)),),
                          Expanded(
                            child: Text(widget.longDescription,
                              style: TextStyle(color:Color(0xff989898)),),
                          ),
                          SizedBox(height: 10,),
                       //   Text("More Image Related X-BET",style: TextStyle(fontSize: 24)),
                        ],
                      ),
                    ),
                    // Container(
                    //
                    //   height: 600*0.18,
                    //   color: Colors.white,
                    //   child: SingleChildScrollView(
                    //     scrollDirection: Axis.horizontal,
                    //     child: Row(
                    //       children: [
                    //         SizedBox(width: width*0.03,),
                    //         Image.asset("graphic_res/des1.png",height: 600*0.18*0.8,),
                    //         SizedBox(width: width*0.03,),
                    //         Image.asset("graphic_res/des2.png",height: 600*0.18*0.8,),
                    //         SizedBox(width: width*0.03,),
                    //         Image.asset("graphic_res/des3.png",height: 600*0.18*0.8,),
                    //         SizedBox(width: width*0.03,),
                    //         Image.asset("graphic_res/des4.png",height: 600*0.18*0.8,),
                    //         SizedBox(width: width*0.03,),
                    //
                    //
                    //       ],
                    //     ),
                    //   ),
                    // ),




                    Container(
                      height: 600*0.18,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                           // color: Colors.yellow,
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            width: width*0.7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               Text(widget.title+" Pros",style: TextStyle(fontSize: 22)),
                           //    Text((widget.addedDate).toString(),style: TextStyle(color: Color(0xff989898)),),
                              ],
                            ),
                          ),
                          Container(
                            width: width*0.3,
                            child: Container(
                              child: Container(
                                width: width*0.20,
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.fromLTRB(0, 0, 20, 10),

                                child: Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xffefefe4),
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                    ),
                                    alignment: Alignment.center,
                                    child:  TextButton(
                                      onPressed: (){},
                                      child: Text("Pros",style: TextStyle(color: Color(
                                          0xffaca334)),),
                                    )
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ),
                    Container(
                      width: width,
                      //padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                     // height: 600*0.27,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.feature1==""?Container():
                          Column(
                            children: [
                              Text("1. "+widget.feature1),
                              SizedBox(height: height*0.00613,),
                            ],
                          ),
                          widget.feature2==""?Container():
                          Column(
                            children: [
                              Text("2. "+widget.feature2),
                              SizedBox(height: height*0.00613,),
                            ],
                          ),
                          widget.feature3==""?Container():
                          Column(
                            children: [
                              Text("3. "+widget.feature3),
                              SizedBox(height: height*0.00613,),
                            ],
                          ),
                          widget.feature4==""?Container():
                          Column(
                            children: [
                              Text("4. "+widget.feature4),
                              SizedBox(height: height*0.00613,),
                            ],
                          ),
                          widget.feature5==""?Container():
                          Column(
                            children: [
                              Text("5. "+widget.feature5),
                              SizedBox(height: height*0.00613,),
                            ],
                          ),
                          widget.feature6==""?Container():
                          Column(
                            children: [
                              Text("6. "+widget.feature6),
                              SizedBox(height: height*0.00613,),
                            ],
                          ),

                          // Text("2. One of the best sports betting app for Odds Boots"),
                          // SizedBox(height: height*0.00613,),
                          // Text("3. Live sports betting app"),
                          // SizedBox(height: height*0.00613,),
                          // Text("4. Live sports betting app"),
                          // SizedBox(height: height*0.00613,),
                          // Text("5. Live sports betting app"),
                          // SizedBox(height: height*0.00613,),
                          // Text("6. Live sports betting app"),

                        ],
                      ),
                    ),
                    // Container(
                    //   width: width,
                    //   height: 600*0.08,
                    //   color: Colors.white,
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         padding: EdgeInsets.symmetric(horizontal: 10),
                    //         width: width*0.5,
                    //         child: Row(
                    //           children: [
                    //             StarRating02(
                    //               rating: rating1,
                    //               onRatingChanged: (rating) => setState(() => this.rating1 = rating),
                    //               color: Colors.transparent, size: 18,
                    //             ),
                    //             SizedBox(width: 5,),
                    //             Text("$rating1", style: TextStyle(fontSize: 16 , color: Colors.grey),)
                    //
                    //           ],
                    //         ),
                    //       ),
                    //       // Container(
                    //       //   padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    //       //   width: width*0.5,
                    //       //   child: Row(
                    //       //     mainAxisAlignment: MainAxisAlignment.end,
                    //       //     children: [
                    //       //       IconButton(
                    //       //         icon: _setstateforheart01 == true ?
                    //       //         Icon(FontAwesomeIcons.solidHeart) : Icon(FontAwesomeIcons.heart),
                    //       //         onPressed: (){
                    //       //           setState(() {
                    //       //             if (_setstateforheart01 == false){
                    //       //               _setstateforheart01 = true;
                    //       //               likes01 = 43;
                    //       //             }else{
                    //       //               _setstateforheart01 = false;
                    //       //               likes01 = 42;
                    //       //             }
                    //       //           });
                    //       //         },
                    //       //         ),
                    //       //       SizedBox(width: width*0.00001,),
                    //       //       Text("$likes01"),
                    //       //       SizedBox(width: width*0.1,),
                    //       //       Icon(Icons.message),
                    //       //       SizedBox(width: width*0.01,),
                    //       //       Text("6"),
                    //       //     ],
                    //       //   ),
                    //       // ),
                    //     ],
                    //   ),
                    // ),

                  ],
                ),
              ),





              Container(
                width: width,
                height: 240,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                     // height: 600*0.18,
                        color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            width: width*0.7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text(widget.title+" Cons",style: TextStyle(fontSize: 22)),
                              //  Text("03 Sept. At 04:21",style: TextStyle(color: Color(0xff989898)),),
                              ],
                            ),
                          ),
                          Container(
                            width: width*0.3,
                            child: Container(
                              child: Container(
                                width: width*0.20,
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.fromLTRB(0, 0, 20, 10),

                                child: Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xfff0e5e4),
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                    ),
                                    alignment: Alignment.center,
                                    child:  TextButton(
                                      onPressed: (){},
                                      child: Text("Cons",style: TextStyle(color: Color(
                                          0xffcd302c)),),
                                    )
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        color: Colors.white,
                        //height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.cons1==""?Container():
                          Column(
                            children: [
                              Text("1. "+widget.cons1),
                              SizedBox(height: height*0.00613,),
                            ],
                          ),
                          widget.cons2==""?Container():
                          Column(
                            children: [
                              Text("2. "+widget.cons2),
                              SizedBox(height: height*0.00613,),
                            ],
                          ),
                          widget.cons3==""?Container():
                          Column(
                            children: [
                              Text("3. "+widget.cons3),
                              SizedBox(height: height*0.00613,),
                            ],
                          ),
                          widget.cons4==""?Container():
                          Column(
                            children: [
                              Text("4. "+widget.cons4),
                              SizedBox(height: height*0.00613,),
                            ],
                          ),
                          widget.cons5==""?Container():
                          Column(
                            children: [
                              Text("5. "+widget.cons5),
                              SizedBox(height: height*0.00613,),
                            ],
                          ),
                          widget.cons6==""?Container():
                          Column(
                            children: [
                              Text("6. "+widget.cons6),
                              SizedBox(height: height*0.00613,),
                            ],
                          ),
                          //
                          // Text("1. Live sports betting app"),
                          // SizedBox(height: height*0.00613,),
                          // Text("2. One of the best sports betting app for Odds Boots"),
                          // SizedBox(height: height*0.00613,),

                        ],
                      ),
                    ),
                    // Container(
                    //   width: width,
                    //   height: 600*0.08,
                    //   color: Colors.white,
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         padding: EdgeInsets.symmetric(horizontal: 10),
                    //         width: width*0.5,
                    //         child: Row(
                    //           children: [
                    //             StarRating02(
                    //               rating: rating2,
                    //               onRatingChanged: (rating) => setState(() => this.rating2 = rating),
                    //               color: Colors.transparent, size: 18,
                    //             ),
                    //             SizedBox(width: 5,),
                    //             Text("$rating2", style: TextStyle(fontSize: 16 , color: Colors.grey),)
                    //
                    //           ],
                    //         ),
                    //       ),
                    //       // Container(
                    //       //   padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    //       //   width: width*0.5,
                    //       //   child: Row(
                    //       //     mainAxisAlignment: MainAxisAlignment.end,
                    //       //     children: [
                    //       //       IconButton(
                    //       //         icon: _setstateforheart02 == true ?
                    //       //         Icon(FontAwesomeIcons.solidHeart) : Icon(FontAwesomeIcons.heart),
                    //       //         onPressed: (){
                    //       //           setState(() {
                    //       //             if (_setstateforheart02 == false){
                    //       //               _setstateforheart02 = true;
                    //       //               likes02 = 43;
                    //       //             }else{
                    //       //               _setstateforheart02 = false;
                    //       //               likes02 = 42;
                    //       //             }
                    //       //           });
                    //       //         },
                    //       //       ),
                    //       //       SizedBox(width: width*0.00001,),
                    //       //       Text("$likes02"),
                    //       //       SizedBox(width: width*0.1,),
                    //       //       Icon(Icons.message),
                    //       //       SizedBox(width: width*0.01,),
                    //       //       Text("6"),
                    //       //     ],
                    //       //   ),
                    //       // ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   height: 48,
                    //   width: width,
                    //   color: Colors.white,
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         width: width*0.5,
                    //         child: StarRating(
                    //           rating: rating2,
                    //           onRatingChanged: (rating) => setState(() => this.rating2 = rating),
                    //           color: Colors.transparent,
                    //         ),
                    //       ),
                    //       Container(
                    //         padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    //         width: width*0.5,
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.end,
                    //           children: [
                    //             Icon(Icons.favorite),
                    //             SizedBox(width: width*0.01,),
                    //             Text("42"),
                    //             SizedBox(width: width*0.1,),
                    //             Icon(Icons.message),
                    //             SizedBox(width: width*0.01,),
                    //             Text("6"),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                  ],
                ),
              ),
              Container(
                width: width,
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 100,vertical: 30),
                color: Colors.white,
                child: Container(

                  width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xff57bbb4),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    alignment: Alignment.center,
                    child:  TextButton(
                      onPressed: (){
                        _launchURL(widget.url);

                      },
                      child: Text("Join XBET Now",style: TextStyle(color: Colors.white),),
                    )
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
