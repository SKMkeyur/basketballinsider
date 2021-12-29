import 'package:basketballinsider/models/comparison.dart';
import 'package:basketballinsider/models/serviceforsitedata.dart';
import 'package:basketballinsider/models/sites.dart';
import 'package:basketballinsider/widgets/starrating.dart';
import 'package:basketballinsider/widgets/starratting01.dart';
import 'package:basketballinsider/widgets/starratting02.dart';
import 'package:flutter/material.dart';
import 'package:basketballinsider/models/options.dart';
import 'package:basketballinsider/screens/getstarted02.dart';
import 'package:basketballinsider/screens/getstarted01.dart';
import 'package:basketballinsider/screens/getstarted03.dart';
import 'package:basketballinsider/screens/getstarted04.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class ComparisonScreen extends StatefulWidget {
  const ComparisonScreen({Key? key}) : super(key: key);
  // late final String id;

  // ComparisonScreen(this.id);

  @override
  _ComparisonScreenState createState() => _ComparisonScreenState();
}

class _ComparisonScreenState extends State<ComparisonScreen> {
  double rating1 = 3.5;
  double rating2 = 3.5;
  int _filter = 1;

  late List<Site> _sites;
  late List<Comparison> _comparisons;
  late bool _loading;
  // for each scrollables
  // LinkedScrollControllerGroup _controllers;
  late LinkedScrollControllerGroup _controllers;

  late ScrollController _letters;
  late ScrollController _numbers;
  late ScrollController _zero;

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _letters = _controllers.addAndGet();
    _numbers = _controllers.addAndGet();
    _zero = _controllers.addAndGet();
    _loading = true;

    _comparisons = <Comparison>[];
    _sites = <Site>[];
    String query = '';

    ComparisonServices.getUsers().then((comparisons) {
      setState(() {
        _comparisons = comparisons;
        _loading = false;
      });
    });

    SiteServices.getUsers().then((sites) {
      setState(() {
        _sites = sites;
        _loading = false;
      });
    });
  }

  @override
  void dispose() {
    _letters.dispose();
    _numbers.dispose();
    _zero.dispose();
    super.dispose();
  }

  bool favorite = false;
  final List<MyItems> _items = <MyItems>[
    MyItems(
        header: "How We Select the Best Betting Apps",
        body: "Wondering how we choose "
            "the best betting apps for sports? There's a lot to think about when it comes to deciding"
            " what app is right for you. So, let's take a closer look at some of the most important factors to consider."),
    MyItems(
        header: "Licensing & Security",
        body:
            "One of the first places to start when comparing sports betting apps for real money is to look at where they're licensed."
            " Many of the best betting apps are located outside the US, in part because of rules that until recently restricted "
            "sports gambling across the country. International sportsbooks are regulated according to the rules of their home"
            " countries and are typically available in all 50 states.   "
            "                                    "
            "In recent years, top sportsbooks have begun to open in "
            "the US. For example, DraftKings and Fanduel are both US-based platforms. These platforms are typically more secure "
            "and face stricter regulatory scrutiny than their international counterparts, but they may not be available in many "
            "states"),
    MyItems(
        header: "How do I claim my sign-up bonus?",
        body: "We think Bavada is the best betting app in "
            "2021. The platform offers competitive odds on a huge range of sports and makes it easy to set up parlays. "
            "Plus, Bavada offers a 750 welcome bonus when you make a deposite using Bitcoin"),
  ];

  @override
  Widget build(BuildContext context) {
    int value(String data) {
      int i1 = 1;
      for (int i = 0; i < _comparisons.length; i++) {
        if (data.compareTo(_comparisons[i].title) == true) {
          print(i);
          i1 = i;
        }
      }
      return i1;
    }

    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1 - safe;
    double barheight = AppBar().preferredSize.height;

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: barheight,
              child: Row(
                children: [
                  Container(
                    width: width * 0.20,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.fromLTRB(5, 0, 20, 0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xff57bbb4),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      alignment: Alignment.center,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
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
                      width: width * 0.50,
                      child: Text(
                        "Comparison",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      )),
                  Container(
                    width: width * 0.20,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ), // Comparison
            //
            Container(
                height: 900,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Color(0xFF03185A),
                    Color(0xFF003900),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0.0, 1.0),
                )),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 190,
                        //   color: Colors.pink,
                        child:
                        Stack(
                          children: [

                            Row(
                              children: [
                                Container(
                               //   height: 100,
                                //  color: Colors.pink,
                                  width: width*0.15,
                                child: RawScrollbar(
                                  thumbColor:Colors.white,
                                 // thumbColor: Colors.redAccent,
                                  interactive: true,
                                  radius: Radius.circular(5),
                                 // physics: ScrollPhysics(),
                                  thickness: 15,
                                  controller: _zero,
                                  isAlwaysShown: true,
                                child: ListView.builder(
                                  controller: _zero,
                                  itemCount: 45,
                                    itemBuilder: (context,index){
                                      return Container(
                                    //    color: Colors.pink,
                                        padding: EdgeInsets.all(10),
                                        child: Container(
                                         // color: Colors.blue,
                                          height: 10,
                                        ),
                                      );
                                    }


                                ),
                                ),


                                ),
                                Container(
                                  width: width*0.10,
                                ),

                                Container(
                                    width: width*0.75,
                                    //    color: Colors.red,
                                    child: _sites.length == 0
                                        ? Container()
                                        : _comparisons == 0
                                        ? Container()
                                        :
                                    ListView.builder(

                                        controller: _letters,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: _sites.length,
                                        itemBuilder: (context, index) {
                                          Site site = _sites[index];
                                          Comparison comparison =
                                          _comparisons[index];
                                          int i2 = 0;
                                          for (int i = 0;
                                          i < _comparisons.length;
                                          i++) {
                                            if (_sites[index].title.compareTo(
                                                _comparisons[i].title) ==
                                                true) {
                                              print(i);
                                              i2 = i;
                                            }
                                          }
                                          return index == 0
                                              ? Row(
                                            children: [
                                              // SizedBox(
                                              //   width: width * 0.25,
                                              // ),
                                              Container()
                                            ],
                                          )
                                              : Container(
                                            padding: EdgeInsets.all(0),
                                            // width: width*0.45,
                                            height: 300,
                                            //   color: Colors.blue,
                                            child: Container(
                                              //    color: Colors.red,
                                                padding:
                                                EdgeInsets.all(0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .center,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    index == 0
                                                        ? Container(
                                                      padding:
                                                      EdgeInsets
                                                          .all(
                                                          10),
                                                      child:
                                                      Container(
                                                        padding:
                                                        EdgeInsets
                                                            .all(0),
                                                        width:
                                                        width *
                                                            .45,
                                                        height: 140,
                                                        // color: Colors.white,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                            color: Colors
                                                                .white),
                                                        child:
                                                        Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets.symmetric(
                                                                  horizontal: 20,
                                                                  vertical: 10),
                                                              child:
                                                              Image.network(
                                                                site.bgImage,
                                                                fit:
                                                                BoxFit.cover,
                                                                height:
                                                                60,
                                                                width:
                                                                width * .45,
                                                                loadingBuilder: (BuildContext context,
                                                                    Widget child,
                                                                    ImageChunkEvent? loadingProgress) {
                                                                  if (loadingProgress == null)
                                                                    return child;
                                                                  return Center(
                                                                    child: CircularProgressIndicator(
                                                                      value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Container(
                                                                padding:
                                                                EdgeInsets.symmetric(horizontal: 10),
                                                                child: Text(
                                                                  site.title,
                                                                  style: TextStyle(fontSize: 10),
                                                                )),
                                                            Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                              children: [
                                                                Container(
                                                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                                                  color: Colors.white,
                                                                  // height: height*.05,
                                                                  child: StarRating02(
                                                                    size: 18,
                                                                    rating: double.parse(site.ratings),
                                                                    onRatingChanged: (rating) => setState(() {}),
                                                                    color: Colors.transparent,
                                                                  ),
                                                                ),
                                                                //  SizedBox(width: 5,),
                                                                Text(
                                                                  (site.ratings).toString(),
                                                                  style: TextStyle(fontSize: 16, color: Colors.grey),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                        : Container(
                                                      padding:
                                                      EdgeInsets
                                                          .all(
                                                          10),
                                                      child:
                                                      Container(
                                                        padding:
                                                        EdgeInsets
                                                            .all(0),
                                                        width:
                                                        width *
                                                            .45,
                                                        height: 140,
                                                        // color: Colors.white,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                            color: Colors
                                                                .white),
                                                        child:
                                                        Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets.symmetric(
                                                                  horizontal: 20,
                                                                  vertical: 10),
                                                              child:
                                                              Image.network(
                                                                site.bgImage,
                                                                fit:
                                                                BoxFit.cover,
                                                                height:
                                                                60,
                                                                width:
                                                                width * .45,
                                                                loadingBuilder: (BuildContext context,
                                                                    Widget child,
                                                                    ImageChunkEvent? loadingProgress) {
                                                                  if (loadingProgress == null)
                                                                    return child;
                                                                  return Center(
                                                                    child: CircularProgressIndicator(
                                                                      value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Container(
                                                                padding:
                                                                EdgeInsets.symmetric(horizontal: 10),
                                                                child: Text(
                                                                  site.title,
                                                                  style: TextStyle(fontSize: 10),
                                                                )),
                                                            Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                              children: [
                                                                Container(
                                                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                                                  color: Colors.white,
                                                                  // height: height*.05,
                                                                  child: StarRating02(
                                                                    size: 18,
                                                                    rating: double.parse(site.ratings),
                                                                    onRatingChanged: (rating) => setState(() {}),
                                                                    color: Colors.transparent,
                                                                  ),
                                                                ),
                                                                //  SizedBox(width: 5,),
                                                                Text(
                                                                  (site.ratings).toString(),
                                                                  style: TextStyle(fontSize: 16, color: Colors.grey),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                  ],
                                                )),
                                          );
                                        })),
                              ],
                            ),
                          ]
                        ),
                      ),
                      Container(
                        //   color: Colors.blue,
                        height: 700,
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.25,
                              //   color: Colors.red,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffeeefef),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(0),
                                            topLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(0),
                                            bottomLeft: Radius.circular(20)),
                                      ),
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      alignment: Alignment.center,
                                      height: 80,
                                      //  var i2 = 0;
                                      child: Text("Bonus"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffeeefef),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(0),
                                            topLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(0),
                                            bottomLeft: Radius.circular(20)),
                                      ),
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      alignment: Alignment.center,
                                      height: 80,
                                      //  var i2 = 0;
                                      child: Text("Bonus Code"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffeeefef),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(0),
                                            topLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(0),
                                            bottomLeft: Radius.circular(20)),
                                      ),
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      alignment: Alignment.center,
                                      height: 80,
                                      //  var i2 = 0;
                                      child: Text("Pros"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffeeefef),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(0),
                                            topLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(0),
                                            bottomLeft: Radius.circular(20)),
                                      ),
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      alignment: Alignment.center,
                                      height: 80,
                                      //  var i2 = 0;
                                      child: Text("Cons"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffeeefef),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(0),
                                            topLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(0),
                                            bottomLeft: Radius.circular(20)),
                                      ),
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      alignment: Alignment.center,
                                      height: 200,
                                      //  var i2 = 0;
                                      child: Text("Description"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: width * 0.75,
                              //    color: Colors.yellow,
                              child: Container(
                                  width: width * 0.75,
                                  //    color: Colors.red,
                                  child: _sites.length == 0
                                      ? Container()
                                      : _comparisons == 0
                                          ? Container()
                                          : ListView.builder(
                                              controller: _numbers,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: _sites.length,
                                              itemBuilder: (context, index) {
                                                Site site = _sites[index];
                                                Comparison comparison =
                                                    _comparisons[index];
                                                int i2 = 0;
                                                for (int i = 0;
                                                    i < _comparisons.length;
                                                    i++) {
                                                  if (_sites[index]
                                                          .title
                                                          .compareTo(
                                                              _comparisons[i]
                                                                  .title) ==
                                                      true) {
                                                    print(i);
                                                    i2 = i;
                                                  }
                                                }
                                                return index == 0
                                                    ? Container()
                                                    : Container(

                                                        padding:
                                                            EdgeInsets.all(0),
                                                        width: width * 0.50,
                                                        height: 300,
                                                        //   color: Colors.blue,
                                                        child: Container(
                                                            //   color: Colors.red,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: width*0.50,
                                                                 // padding: EdgeInsets.all(10),
                                                                  child: Container(
                                                                  //  width: width*0.45,
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    height: 80,
                                                                    color: Color(
                                                                        0xffeeefef),
                                                                    //  var i2 = 0;
                                                                    child: Text(
                                                                      _comparisons[_comparisons.indexWhere((element) =>
                                                                              element.title ==
                                                                              site.title)]
                                                                          .bonus,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      //   _comparisons[].bonus
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 30,
                                                                ),
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 80,
                                                                  color: Color(
                                                                      0xffeeefef),
                                                                  //  var i2 = 0;
                                                                  child: Text(
                                                                    _comparisons[_comparisons.indexWhere((element) =>
                                                                            element.title ==
                                                                            site.title)]
                                                                        .promocode,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    //   _comparisons[].bonus
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 30,
                                                                ),
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 80,
                                                                  color: Color(
                                                                      0xffeeefef),
                                                                  //  var i2 = 0;
                                                                  child: Text(
                                                                    site.feature1,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    //   _comparisons[].bonus
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 30,
                                                                ),
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 80,
                                                                  color: Color(
                                                                      0xffeeefef),
                                                                  //  var i2 = 0;
                                                                  child: Text(
                                                                    site.cons1,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    //   _comparisons[].bonus
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 30,
                                                                ),
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 200,
                                                                  color: Color(
                                                                      0xffeeefef),
                                                                  //  var i2 = 0;
                                                                  child: Text(
                                                                    site.shortDescription,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    //   _comparisons[].bonus
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      );
                                              })),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      )),
    );
  }
}

class MyItems {
  late bool isExpanded;
  late final String header;
  late final String body;

  MyItems({this.isExpanded: false, required this.header, required this.body});
}
