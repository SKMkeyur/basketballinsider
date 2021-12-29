import 'package:basketballinsider/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:basketballinsider/screens/getstarted02.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class GetStarted00 extends StatefulWidget {
  const GetStarted00({Key? key}) : super(key: key);

  @override
  _GetStarted00State createState() => _GetStarted00State();
}

class _GetStarted00State extends State<GetStarted00> {
  @override
  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: height*0.10,
                // child: Row(
                //   children: [
                //     Container(
                //       width: width*0.25,
                //       alignment: Alignment.centerRight,
                //       padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
                //
                //       child: Container(
                //         width: 40,
                //         height: 40,
                //         decoration: BoxDecoration(
                //           color: Color(0xff57bbb4),
                //           borderRadius: BorderRadius.all(Radius.circular(10)),
                //         ),
                //         alignment: Alignment.center,
                //
                //       ),
                //     ),
                //
                //
                //     Container(
                //         alignment: Alignment.center,
                //         width: width*0.50,
                //         child: Text("Get Started",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),
                //         )
                //     ),
                //     Container(
                //       width: width*0.25,
                //
                //     ),
                //
                //   ],
                // ),

              ),

              // Container(
              //   height: height*0.1,
              //   child: Row(
              //     children: [
              //       Container(
              //         width: width*0.25,
              //         alignment: Alignment.centerRight,
              //         padding: EdgeInsets.fromLTRB(0, 0, 20, 50),
              //
              //         child: Container(
              //           width: 40,
              //           height: 40,
              //           decoration: BoxDecoration(
              //             color: Color(0xff57bbb4),
              //             borderRadius: BorderRadius.all(Radius.circular(10)),
              //           ),
              //           alignment: Alignment.center,
              //           child: IconButton(
              //             icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,),
              //             onPressed: (){
              //               // Navigator.push(context, MaterialPageRoute(
              //               //     builder: (context) => GetStarted01())
              //               // );
              //               Navigator.pop(context);
              //
              //             },
              //           ),
              //         ),
              //       ),
              //       // Container(
              //       //   width: width*0.15,
              //       //   height: height*0.1,
              //       //   color: Colors.white,
              //       //   child: Padding(
              //       //     padding: const EdgeInsets.fromLTRB(15, 20, 0, 5),
              //       //     child: Container(
              //       //       color:  Color(0xff57bbb4),
              //       //       alignment: Alignment.centerLeft,
              //       //       child: IconButton(onPressed: (){
              //       //         // Navigator.push(context, MaterialPageRoute(
              //       //         //     builder: (context) => MenuOptionsScreen()));
              //       //         Navigator.pop(context);
              //       //
              //       //       },
              //       //         icon: Icon(Icons.arrow_back),
              //       //         color: Colors.white,
              //       //         //splashColor: Colors.purple,
              //       //
              //       //
              //       //
              //       //       ),
              //       //     ),
              //       //   ),
              //       // ),
              //       Container(
              //           width: width*0.50,
              //           height: height*0.1,
              //           //    margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
              //           alignment: Alignment.center,
              //           color: Colors.white,
              //           child: Text(
              //             "Get Started",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),
              //           )
              //       ),
              //       Container(
              //         width: width*0.25,
              //         //  margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
              //         alignment: Alignment.center,
              //         color: Colors.white,
              //
              //       ),
              //     ],
              //   ),
              // ),
              //

              Container(
                height: height*0.5,
                width: width,
                color: Colors.white,
                child: Stack(

                  children: [
                    Positioned(
                      top: 275,
                      left: 30,
                      right: 210,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:  Color(0xff57bbb4),
                         //   borderRadius: BorderRadius.all(Radius.circular(14))
                        ),
                        width: width*0.3,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 20,
                      right: 0,
                      bottom: 10,
                      child: Align(
                        alignment: Alignment.centerRight,

                        child: Transform.scale(scale: 1.7,
                          child:
                        Container(
                          //  margin: const EdgeInsets.only(left: 40.0, right: 0.0),
                          //alignment: Alignment.,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffd3f3f3),
                            // borderRadius: BorderRadius.all(Radius.circular(14))
                          ),
                          height: height*0.4,
                          width: width*0.6,
                          child: Image.asset('graphic_res/design_3_assets/1/LargeLogo_WithWhite200-1.png',scale: 2,),


                          // color: Color(0xffd2f3f3),
                        ),

                          )
                      ),
                    ),
                    // Positioned(
                    //   top: 0,
                    //   left: 20,
                    //   right: 0,
                    //   bottom: 0,
                    //   child: Container(
                    //     //  margin: const EdgeInsets.only(left: 40.0, right: 0.0),
                    //     alignment: Alignment.centerRight,
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: Color(0xffd2f3f3),
                    //       // borderRadius: BorderRadius.all(Radius.circular(14))
                    //     ),
                    //     height: height*0.4,
                    //     width: width*0.6,
                    //     child: Image.asset('graphic_res/gs1.png'),
                    //
                    //
                    //     // color: Color(0xffd2f3f3),
                    //   ),
                    // ),

                  ],
                ),
              ),
              Container(
                height: height*0.14,
                width: width,
                color: Colors.white,
                child: Container(
                 //   padding: EdgeInsets.fromLTRB(50, 5, 0, 0),

                      padding: EdgeInsets.symmetric(horizontal: 70,vertical: 0),
                    alignment: Alignment.topCenter,
                    child: const Text("Let's Find Your Best Betting Apps",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),)),
                // child: (
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 8),
                //       child: Container(
                //
                //         color: Colors.white,
                //         padding: EdgeInsets.all(22),
                //         child:  Flexible(
                //           child: Text("How to Get Started with the Best "
                //               "Sports Betting Apps Us",
                //             style: TextStyle(
                //               fontWeight: FontWeight.w600,
                //               color: Colors.black,
                //               fontSize: 22,
                //             ),
                //           ),
                //         ),
                //         // Column(
                //         //   children: const [
                //         //     Flexible(
                //         //       child: Text("How to Get Started with the Best Sports Betting Apps Us",
                //         //         style: TextStyle(
                //         //           fontWeight: FontWeight.w600,
                //         //           color: Colors.black,
                //         //           fontSize: 22,
                //         //         ),
                //         //       ),
                //         //     ),
                //         //   ],
                //         // ),
                //
                //
                //       ),
                //     ),
                //   ],
                // ),
              ),
              Container(
                height: height*0.08,
                width: width,
                color: Colors.white,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    alignment: Alignment.topCenter,
                    child: const Text('Lorem ipsum dolor sit amet, consec adipiscing elit, sed do eiusmod',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff989898),
                      )
                      ,)
                ),
                // child: (
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 8),
                //       child: Container(
                //
                //         color: Colors.white,
                //         padding: EdgeInsets.all(22),
                //         child:  Flexible(
                //           child: Text("How to Get Started with the Best "
                //               "Sports Betting Apps Us",
                //             style: TextStyle(
                //               fontWeight: FontWeight.w600,
                //               color: Colors.black,
                //               fontSize: 22,
                //             ),
                //           ),
                //         ),
                //         // Column(
                //         //   children: const [
                //         //     Flexible(
                //         //       child: Text("How to Get Started with the Best Sports Betting Apps Us",
                //         //         style: TextStyle(
                //         //           fontWeight: FontWeight.w600,
                //         //           color: Colors.black,
                //         //           fontSize: 22,
                //         //         ),
                //         //       ),
                //         //     ),
                //         //   ],
                //         // ),
                //
                //
                //       ),
                //     ),
                //   ],
                // ),
              ),
              Container(
                height: height*0.13,
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      width: width*0.2,
                      child: Text('',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                        )
                        ,),
                    ),

                    Container(
                      width: width*0.8,
                      height: height*0.07,

                      child:
                      Padding(
                        padding: const EdgeInsets.fromLTRB(70, 0, 30, 0),
                        child: TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => MenuOptionsScreen())
                          );



                        },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Color(0xff57bbb4)),
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 14)),
                                textStyle: MaterialStateProperty.all(TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                )
                                )
                            ),
                            child: const Text("Get Started")
                        ),
                      ),
                    )

                  ],
                ),
              )



            ],
          ),

        ),
      ),
    );
  }
}
