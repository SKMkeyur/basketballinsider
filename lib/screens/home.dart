import 'dart:async';

import 'package:basketballinsider/models/services.dart';
import 'package:basketballinsider/models/sites.dart';
import 'package:basketballinsider/screens/aboutus.dart';
import 'package:basketballinsider/screens/betdescription.dart';
import 'package:basketballinsider/screens/comparison.dart';
import 'package:basketballinsider/screens/faqs.dart';
import 'package:basketballinsider/screens/review.dart';
import 'package:basketballinsider/screens/review01.dart';
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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:weather/weather.dart';
import 'package:intl/intl.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  TextEditingController controller = TextEditingController();
//  late FocusNode focusNode;
  late bool isSearching = false;
  double rating = 3.5;
  bool favorite = false;
  String formattedDate = "";
  late String _now="";
  late Timer _everySecond;
  late List<Site> _sites;
  late bool _loading;

  late List<Site> _searchResult;
  late List<Site> _tempList;
  late List<Site> _searchList;

  late List<Site> dogsBreedList;
  late List<Site> tempList;
  //bool isLoading = false;

  onSearchTextChanged(String text) async{
   // _searchResult.clear();
    if (text.isEmpty) {
      setState(() {
        _sites=tempList;
      });
    }
    else {
      final List<Site> filteredBreeds = <Site>[];
      tempList.forEach((element) {
        if (element.title.toLowerCase().toString().contains(text.toLowerCase().toString())) {
          setState(() {
            filteredBreeds.add(element);
          });
        }
      });
      setState(() {
        _sites = filteredBreeds;
      });
    }
    // _sites.forEach((userDetail) {
    //   if (userDetail.title.contains(text))
    //     _searchResult.add(userDetail);
    // });
  }

  _filterDogList(String text) {
    if(text.isEmpty){
      setState(() {
        _sites = tempList;
      });
    }
    else{
      final List<Site> filteredBreeds = <Site>[];

      // tempList.where((element){
      //   if(element.title.toLowerCase().contains(text.toLowerCase())){
      //     filteredBreeds.add(element);
      //   }
      // }).toList();

      tempList.map((breed){
        if(breed.title.toLowerCase().contains(text.toString().toLowerCase())){
          filteredBreeds.add(breed);
        }
      }).toList();
      //
      setState(() {
        _sites = filteredBreeds;
      });
    }
  }





  @override
  void initState() {
    super.initState();
    isSearching = false;
    _now = _timeToString(DateTime.now());
    _everySecond = Timer.periodic(Duration(seconds: 5), (Timer t) {
      if (!mounted) return;
      setState(() {
        _now = _timeToString(DateTime.now());
      });
    });

   // focusNode = FocusNode();

    _searchResult = <Site>[];
    _loading =true;
    _sites = <Site>[];
    String query = '';

    SiteServices.getUsers().then((sites) {
      tempList = sites;
      setState(() {
        _sites = tempList;
        _loading = false;
      });

    });
  }
  String _timeToString(DateTime now) {
   // String timeString =
     //   "${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}";
    String timeString =
        "${now.hour.toString().padLeft(2, '0')}"+":"+"${now.minute.toString().padLeft(2, '0')}";
    return timeString;
  }

  @override
  Widget build(BuildContext context) {

   // double safe = MediaQuery.of(context).padding.top;
    DateTime now = DateTime.now();
    setState(() {
      //formattedDate = DateFormat('EEEE, d MMM  kk:mm  ').format(now);
      formattedDate = DateFormat('EEEE, d MMM  ').format(now);
    });
  //  double height1 = MediaQuery.of(context).size.height;
   // double width = MediaQuery.of(context).size.width;
    //double height = height1-safe;

    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double barheight =AppBar().preferredSize.height;
    double height = height1-safe-barheight;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: isSearching == false ? Text("Home",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,)
          : TextField(
            controller: controller,
            decoration: InputDecoration(
                hintText: "Enter Bet Name",
            icon: Icon(Icons.search),
            ),
            onChanged: (text){
              _filterDogList(text);
            }
          ),
          iconTheme: IconThemeData(color: Colors.black),
          toolbarHeight: barheight,
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[
            isSearching==true?
            IconButton(
              padding: EdgeInsets.fromLTRB(0, 0,40, 0),
              icon: Icon(
                Icons.cancel,
                color: Colors.black,
              ),
              onPressed: () {
              setState(() {
                isSearching==false?isSearching=true:isSearching=false;
              });
               // focusNode.requestFocus();
              },
            )
                :
            IconButton(
              padding: EdgeInsets.fromLTRB(0, 0,40, 0),
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  isSearching==false?isSearching=true:isSearching=false;
                });
                //  focusNode.requestFocus();
              },
            )
          ],
        ),
        drawer: ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(40.0),bottomRight: Radius.circular(40.0)),
          child: Drawer(
              child:
              Container(

                child: Column(
                  children: [
                    Container(
                      width: width,
                      height: height*.30,
                      child: Image.asset("graphic_res/Asset 1.png",scale: 2,),

                    ),
                    Container(
                      width: width,
                      height: height*0.60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                              // Navigator.push(context, MaterialPageRoute(
                              //     builder: (context) => HomeScreen())
                              // );
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: ListTile(
                                leading: Icon(Icons.home,color: Color(0xff57bbb4),size: 45.0),
                                title: Text("Home",style: TextStyle(fontSize: 18),),
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(height: 0,thickness: 2,)),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Review01Screen())
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                leading: Icon(FontAwesomeIcons.compass,color: Color(0xff57bbb4),size: 40.0),
                                title: Text("Review",style: TextStyle(fontSize: 18),),
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(height: 0,thickness: 2,)),

                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ComparisonScreen())
                              );

                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                leading: Icon(Icons.compare,color: Color(0xff57bbb4),size: 40.0),
                                title: Text("Comparison ",style: TextStyle(fontSize: 18),),
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(height: 0,thickness: 2,)),

                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Faqs())
                              );
                              //  Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                leading: Icon(FontAwesomeIcons.moneyCheck,color:Color(0xff57bbb4),size: 30.0),
                                title: Text("FAQ",style: TextStyle(fontSize: 18),),
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(height: 0,thickness: 2,)),

                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => AboutUsScreen())
                              );
                              //  Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                leading: Icon(FontAwesomeIcons.users,color:Color(0xff57bbb4),size: 30.0),
                                title: Text("About US",style: TextStyle(fontSize: 18),),
                              ),
                            ),
                          ),



                        ],
                      ),
                    ),
                    // Container(
                    //   // color: Colors.red,
                    //   height: height - height*0.42 - height*.2933,
                    //   alignment: Alignment.bottomCenter,
                    //   child: Container(
                    //     //height: height*.2,
                    //     child: ButtonContainer("LOGOUT",DarkBlue),
                    //   ),
                    // ),

                  ],
                ),
              )

            // ListView(
            //   // Important: Remove any padding from the ListView.
            //   padding: EdgeInsets.zero,
            //   children: [
            //     const DrawerHeader(
            //       decoration: BoxDecoration(
            //         color: Colors.blue,
            //       ),
            //       child: Text('Drawer Header'),
            //     ),
            //     ListTile(
            //       title: const Text('Item 1'),
            //       onTap: () {
            //         // Update the state of the app.
            //         // ...
            //       },
            //     ),
            //     ListTile(
            //       title: const Text('Item 2'),
            //       onTap: () {
            //         // Update the state of the app.
            //         // ...
            //       },
            //     ),
            //   ],
            // ),
          ),
        ),
          body: Column(
          children: [
            Container(
              height: height,
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
                  height: height*.22,
                      child: Column(
                        children:  [
                          SizedBox(height:10,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
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
                          // Padding(
                          //   //padding: EdgeInsets.symmetric(horizontal: 20),
                          //   padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          //   child: Align(
                          //       alignment: Alignment.centerLeft,
                          //       child: Row(
                          //         children: [
                          //           Container(  //Friday, 20 July 13:50
                          //             width: width*0.7,
                          //             child: Text("$formattedDate"+" "+_now+
                          //                 "",
                          //               style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400,height: 1.5),),
                          //           ),
                          //
                          //           Text(
                          //             "26°",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400,height: 1.5),
                          //           ),
                          //           SizedBox(width: 5,),
                          //           Icon(Icons.wb_sunny_rounded ,color: Colors.yellow,size: 18,),
                          //         ],
                          //       )
                          //   ),
                          // ),

                          //Divider(height: height*0.011,color: Colors.white,thickness: height*0.0029,),
                        ],
                      ),

                  ),
                  
                  Container(
                   // color: Colors.pink,
                    height: height*0.7,
                    child:
                    // _searchResult.length!=0 || controller.text.isNotEmpty
                    //   ?
                    // ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: _searchResult.length,
                    //     itemBuilder: (context,index){
                    //       Site site = _searchResult[index];
                    //       index == 0 ? rating = 0 : rating = double.parse(site.ratings);
                    //       //     rating = double.parse(site.ratings);
                    //       return Container(
                    //         padding: EdgeInsets.all(10),
                    //         child: index == 0 ? Container() : Container(
                    //           height: height*.5,
                    //           width: width*.82,
                    //           decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.all(Radius.circular(20)),
                    //           ),
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //             children: [
                    //               // Image.network(site.bgImage,height: height*.48*.51,),
                    //               Container(
                    //                 padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    //                 child: Image.network(
                    //                   site.bgImage,
                    //                   fit: BoxFit.cover,
                    //                   height: height*.48*.51,
                    //                   loadingBuilder: (BuildContext context, Widget child,
                    //                       ImageChunkEvent? loadingProgress) {
                    //                     if (loadingProgress == null) return child;
                    //                     return Center(
                    //                       child: CircularProgressIndicator(
                    //                         value: loadingProgress.expectedTotalBytes != null
                    //                             ? loadingProgress.cumulativeBytesLoaded /
                    //                             loadingProgress.expectedTotalBytes!
                    //                             : null,
                    //                       ),
                    //                     );
                    //                   },
                    //                 ),
                    //               ),
                    //
                    //
                    //               Container(
                    //                 padding: EdgeInsets.symmetric(horizontal: 20),
                    //                 height: height*.5*.15,
                    //                 child: Row(
                    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                   children: [
                    //                     Container(
                    //                         width: width*0.5,
                    //                         child: Text(site.title,
                    //                           style: TextStyle(
                    //                               fontSize: 18,
                    //                               fontWeight: FontWeight.w600
                    //                           ),)
                    //
                    //                     ),
                    //                     //  Image.asset("graphic_res/design_3_assets/3/xbet.png"),
                    //                     // Image.network(site.logo,width: width*0.20,
                    //                     //      fit: BoxFit.cover),
                    //
                    //                     Container(
                    //                      // color: Colors.blue,
                    //                      // padding: EdgeInsets.all(5),
                    //                       child: Image.network(
                    //                         site.logo,
                    //                         fit: BoxFit.contain,
                    //                         width: width*0.20,
                    //                         height: height*.5*.10,
                    //
                    //                         loadingBuilder: (BuildContext context, Widget child,
                    //                             ImageChunkEvent? loadingProgress) {
                    //                           if (loadingProgress == null) return child;
                    //                           return Center(
                    //                             child: CircularProgressIndicator(
                    //                               value: loadingProgress.expectedTotalBytes != null
                    //                                   ? loadingProgress.cumulativeBytesLoaded /
                    //                                   loadingProgress.expectedTotalBytes!
                    //                                   : null,
                    //                             ),
                    //                           );
                    //                         },
                    //                       ),
                    //                     ),
                    //
                    //                   ],
                    //                 ),
                    //               ),
                    //               Container(
                    //                 padding: EdgeInsets.symmetric(horizontal: 20),
                    //                 height: height*.5*.27,
                    //                 child:
                    //                 Text(site.shortDescription)
                    //                 // Text("At the game? Just got a gut feeling?"
                    //                 //     "No problem! Now you can bet from anywhere,"
                    //                 //     "anytime with the all-new Xbet mobile betting")
                    //                 ,
                    //               ),
                    //               Container(
                    //                 padding: EdgeInsets.symmetric(horizontal: 20),
                    //                 height: height*.48*.097,
                    //                 child: Row(
                    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                   children: [
                    //                     Row(
                    //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //                       children: [
                    //                         Container(
                    //                           alignment: Alignment.centerLeft,
                    //                           color: Colors.white,
                    //                           height: height*.05,
                    //                           child: StarRating02(
                    //                             size: 18,
                    //                             rating: rating,
                    //                             onRatingChanged: (rating) => setState(() {}),
                    //                             color: Colors.transparent,
                    //                           ),
                    //                         ),
                    //                         SizedBox(width: 5,),
                    //                         Text(rating.toString(), style: TextStyle(fontSize: 16 , color: Colors.grey),),
                    //                       ],
                    //                     ),
                    //                     Container(
                    //                       alignment: Alignment.centerRight,
                    //                       child: Container(
                    //                           width: width*0.3,
                    //                           decoration: BoxDecoration(
                    //                             color: Color(0xff57bbb4),
                    //                             borderRadius: BorderRadius.all(Radius.circular(10)),
                    //                           ),
                    //                           alignment: Alignment.center,
                    //                           child:  TextButton(
                    //                             onPressed: (){
                    //                               Navigator.push(context, MaterialPageRoute(
                    //                                   builder: (context) =>
                    //                                       BetDescriptionScreen(
                    //                                           site.id,
                    //                                           site.title,
                    //                                           site.url,
                    //                                           site.promocode,
                    //                                           site.ratings,
                    //                                           site.feature1,
                    //                                           site.feature2,
                    //                                           site.feature3,
                    //                                           site.feature4,
                    //                                           site.logo,
                    //                                           site.addedDate,
                    //                                           site.feature5,
                    //                                           site.feature6,
                    //                                           site.cons1,
                    //                                           site.cons2,
                    //                                           site.cons3,
                    //                                           site.cons4,
                    //                                           site.cons5,
                    //                                           site.cons6,
                    //                                           site.shortDescription,
                    //                                           site.longDescription,
                    //                                           site.bonus,
                    //                                           site.bgImage)
                    //
                    //                               )
                    //                               );
                    //
                    //                             },
                    //                             child: FittedBox(
                    //                                 fit: BoxFit.fitWidth,
                    //                                 child: Text("Claim Bonus",style: TextStyle(color: Colors.white),)),
                    //                           )
                    //                       ),
                    //                     ),
                    //
                    //                   ],
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //     })
                    //     :
                    ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _sites.length,
                    itemBuilder: (context,index){
                          Site site = _sites[index];
                          index == 0 ? rating = 0 : rating = double.parse(site.ratings);
                     //     rating = double.parse(site.ratings);
                          return Container(
                            padding: EdgeInsets.all(10),
                            child: index == 0 ? Container() : Container(
                              height: height*.5,
                              width: width*.82,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                 // Image.network(site.bgImage,height: height*.48*.51,),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                    child: Image.network(
                                      site.bgImage,
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
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    height: height*.5*.15,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: width*0.5,
                                            child: Text(site.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600
                                           // ,color: Colors.bla

                                            ),)),
                                      //  Image.asset("graphic_res/design_3_assets/3/xbet.png"),
                                      // Image.network(site.logo,width: width*0.20,
                                      //      fit: BoxFit.cover),

                                        Image.network(
                                          site.logo,
                                          fit: BoxFit.contain,
                                            width: width*0.20,
                                          height: height*.48*.10,

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

                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    height: height*.5*.27,
                                    child:
                                    Text(site.shortDescription)
                                    // Text("At the game? Just got a gut feeling?"
                                    //     "No problem! Now you can bet from anywhere,"
                                    //     "anytime with the all-new Xbet mobile betting")
                                    ,
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
                                                onRatingChanged: (rating) => setState(() {}),
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            Text(rating.toString(), style: TextStyle(fontSize: 16 , color: Colors.grey),),
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
                                                onPressed: (){
                                                  Navigator.push(context, MaterialPageRoute(
                                                      builder: (context) =>
                                                          BetDescriptionScreen(
                                                              site.id,
                                                              site.title,
                                                              site.url,
                                                              site.promocode,
                                                              site.ratings,
                                                              site.feature1,
                                                              site.feature2,
                                                              site.feature3,
                                                              site.feature4,
                                                              site.logo,
                                                              site.addedDate,
                                                              site.feature5,
                                                              site.feature6,
                                                              site.cons1,
                                                              site.cons2,
                                                              site.cons3,
                                                              site.cons4,
                                                              site.cons5,
                                                              site.cons6,
                                                              site.shortDescription,
                                                              site.longDescription,
                                                              site.bonus,
                                                              site.bgImage)

                                                  )
                                                  );

                                                },
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
                        }),
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
