import 'package:basketballinsider/models/serviceforsitedata.dart';
import 'package:basketballinsider/models/sites.dart';
import 'package:basketballinsider/screens/review01.dart';
import 'package:basketballinsider/widgets/starratting02.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'aboutus.dart';
import 'betdescription.dart';
import 'comparison.dart';
import 'faqs.dart';

class Home02 extends StatefulWidget {
  const Home02({Key? key}) : super(key: key);

  @override
  _Home02State createState() => _Home02State();
}

class _Home02State extends State<Home02> {

  TextEditingController controller = TextEditingController();
  late bool isSearching = false;
  double rating = 3.5;

  List<Site> dogsBreedList = <Site>[];
  List<Site> tempList = <Site>[];
  bool isLoading = false;

  @override
  void initState() {
    isSearching = false;
    // TODO: implement initState
    super.initState();
    _fetchDogsBreed();
  }

  @override
  Widget build(BuildContext context) {

    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double barheight =AppBar().preferredSize.height;
    double height = height1-safe-barheight;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset:false,
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

            //onSearchTextChanged,
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
        body: Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                //  flex: 1,
                child:
                isLoading?
                CircularProgressIndicator():
                Container(
                    height: height*0.7,
                    child:
                    controller.text.isNotEmpty ?
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dogsBreedList.length,
                        itemBuilder: (context,index){
                          Site site = dogsBreedList[index];
                          // index == 0 ? rating = 0 :
                          rating = double.parse(site.ratings);
                          return  Container(
                            padding: EdgeInsets.all(10),
                            child:
                            //index == 0 ? Container() :
                            Container(
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
                        })
                        :
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dogsBreedList.length,
                        itemBuilder: (context,index){
                          Site site = dogsBreedList[index];
                          index == 0 ? rating = 0 : rating = double.parse(site.ratings);
                          return  Container(
                            padding: EdgeInsets.all(10),
                            child:
                            index == 0 ? Container() :
                            Container(
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
                        })
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Widget _searchBar(){
  //   return Container(
  //     padding: EdgeInsets.only(bottom: 16.0),
  //     child: TextField(
  //       decoration: InputDecoration(
  //         hintText: "Search Dog Breeds Here...",
  //         prefixIcon: Icon(Icons.search),
  //       ),
  //       onChanged: (text){
  //         _filterDogList(text);
  //       },
  //     ),
  //   );
  // }
  //
  // Widget _mainData(){
  //   return Center(
  //     child: isLoading?
  //     CircularProgressIndicator():
  //     ListView.builder(
  //         itemCount: dogsBreedList.length,
  //         itemBuilder: (context,index){
  //           return ListTile(
  //               title: Text(dogsBreedList[index].title,)
  //           );
  //         }),
  //   );
  // }

  //
  // Widget _mainData(){
  //   return Center(
  //     child: isLoading?
  //     CircularProgressIndicator():
  //     ListView.builder(
  //         scrollDirection: Axis.horizontal,
  //         itemCount: dogsBreedList.length,
  //         itemBuilder: (context,index){
  //           Site site = dogsBreedList[index];
  //           index == 0 ? rating = 0 : rating = double.parse(site.ratings);
  //           return  Container(
  //             padding: EdgeInsets.all(10),
  //             child: index == 0 ? Container() : Container(
  //               height: height*.5,
  //               width: width*.82,
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.all(Radius.circular(20)),
  //               ),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   // Image.network(site.bgImage,height: height*.48*.51,),
  //                   Container(
  //                     padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
  //                     child: Image.network(
  //                       site.bgImage,
  //                       fit: BoxFit.cover,
  //                       height: height*.48*.51,
  //                       loadingBuilder: (BuildContext context, Widget child,
  //                           ImageChunkEvent? loadingProgress) {
  //                         if (loadingProgress == null) return child;
  //                         return Center(
  //                           child: CircularProgressIndicator(
  //                             value: loadingProgress.expectedTotalBytes != null
  //                                 ? loadingProgress.cumulativeBytesLoaded /
  //                                 loadingProgress.expectedTotalBytes!
  //                                 : null,
  //                           ),
  //                         );
  //                       },
  //                     ),
  //                   ),
  //
  //
  //                   Container(
  //                     padding: EdgeInsets.symmetric(horizontal: 20),
  //                     height: height*.5*.15,
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Container(
  //                             width: width*0.5,
  //                             child: Text(site.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600
  //                               // ,color: Colors.bla
  //
  //                             ),)),
  //                         //  Image.asset("graphic_res/design_3_assets/3/xbet.png"),
  //                         // Image.network(site.logo,width: width*0.20,
  //                         //      fit: BoxFit.cover),
  //
  //                         Image.network(
  //                           site.logo,
  //                           fit: BoxFit.contain,
  //                           width: width*0.20,
  //                           height: height*.48*.10,
  //
  //                           loadingBuilder: (BuildContext context, Widget child,
  //                               ImageChunkEvent? loadingProgress) {
  //                             if (loadingProgress == null) return child;
  //                             return Center(
  //                               child: CircularProgressIndicator(
  //                                 value: loadingProgress.expectedTotalBytes != null
  //                                     ? loadingProgress.cumulativeBytesLoaded /
  //                                     loadingProgress.expectedTotalBytes!
  //                                     : null,
  //                               ),
  //                             );
  //                           },
  //                         ),
  //
  //                       ],
  //                     ),
  //                   ),
  //                   Container(
  //                     padding: EdgeInsets.symmetric(horizontal: 20),
  //                     height: height*.5*.27,
  //                     child:
  //                     Text(site.shortDescription)
  //                     // Text("At the game? Just got a gut feeling?"
  //                     //     "No problem! Now you can bet from anywhere,"
  //                     //     "anytime with the all-new Xbet mobile betting")
  //                     ,
  //                   ),
  //                   Container(
  //                     padding: EdgeInsets.symmetric(horizontal: 20),
  //                     height: height*.48*.097,
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                           children: [
  //                             Container(
  //                               alignment: Alignment.centerLeft,
  //                               color: Colors.white,
  //                               height: height*.05,
  //                               child: StarRating02(
  //                                 size: 18,
  //                                 rating: rating,
  //                                 onRatingChanged: (rating) => setState(() {}),
  //                                 color: Colors.transparent,
  //                               ),
  //                             ),
  //                             SizedBox(width: 5,),
  //                             Text(rating.toString(), style: TextStyle(fontSize: 16 , color: Colors.grey),),
  //                           ],
  //                         ),
  //                         Container(
  //                           alignment: Alignment.centerRight,
  //                           child: Container(
  //                               width: width*0.3,
  //                               decoration: BoxDecoration(
  //                                 color: Color(0xff57bbb4),
  //                                 borderRadius: BorderRadius.all(Radius.circular(10)),
  //                               ),
  //                               alignment: Alignment.center,
  //                               child:  TextButton(
  //                                 onPressed: (){
  //                                   Navigator.push(context, MaterialPageRoute(
  //                                       builder: (context) =>
  //                                           BetDescriptionScreen(
  //                                               site.id,
  //                                               site.title,
  //                                               site.url,
  //                                               site.promocode,
  //                                               site.ratings,
  //                                               site.feature1,
  //                                               site.feature2,
  //                                               site.feature3,
  //                                               site.feature4,
  //                                               site.logo,
  //                                               site.addedDate,
  //                                               site.feature5,
  //                                               site.feature6,
  //                                               site.cons1,
  //                                               site.cons2,
  //                                               site.cons3,
  //                                               site.cons4,
  //                                               site.cons5,
  //                                               site.cons6,
  //                                               site.shortDescription,
  //                                               site.longDescription,
  //                                               site.bonus,
  //                                               site.bgImage)
  //
  //                                   )
  //                                   );
  //
  //                                 },
  //                                 child: FittedBox(
  //                                     fit: BoxFit.fitWidth,
  //                                     child: Text("Claim Bonus",style: TextStyle(color: Colors.white),)),
  //                               )
  //                           ),
  //                         ),
  //
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           );
  //         }),
  //   );
  // }











  _filterDogList(String text) {
    if(text.isEmpty){
      setState(() {
        dogsBreedList = tempList;
      });
    }
    else{
      final List<Site> filteredBreeds = <Site>[];
      tempList.map((breed){
        if(breed.title.toLowerCase().contains(text.toString().toLowerCase())){
          filteredBreeds.add(breed);
        }
      }).toList();
      setState(() {
        dogsBreedList = filteredBreeds;
      });
    }
  }

  _fetchDogsBreed() async{
    setState(() {
      isLoading = true;
    });
    tempList = <Site>[];
    SiteServices.getUsers().then((sites){
      tempList = sites;
      setState(() {
        dogsBreedList = tempList;
        isLoading = false;
      });
    });

  }
}