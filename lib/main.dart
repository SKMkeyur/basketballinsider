import 'dart:math';
import 'package:basketballinsider/screens/aboutus.dart';
import 'package:basketballinsider/screens/betdescription.dart';
import 'package:basketballinsider/screens/comparison.dart';
import 'package:basketballinsider/screens/faqs.dart';
import 'package:basketballinsider/screens/feedback.dart';
import 'package:basketballinsider/screens/getstarted00.dart';
import 'package:basketballinsider/screens/getstarted02.dart';
import 'package:basketballinsider/screens/home.dart';
import 'package:basketballinsider/screens/home01.dart';
import 'package:basketballinsider/screens/home02.dart';
import 'package:basketballinsider/screens/jsontolistview.dart';
import 'package:basketballinsider/screens/jsontolistviewsite.dart';
import 'package:basketballinsider/screens/livestreaminginformation.dart';
import 'package:basketballinsider/screens/menu.dart';
import 'package:basketballinsider/screens/review.dart';
import 'package:basketballinsider/screens/splashscreen.dart';
import 'package:basketballinsider/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:basketballinsider/screens/getstarted01.dart';
import 'package:basketballinsider/screens/getstarted03.dart';
import 'package:basketballinsider/screens/getstarted04.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     // home: SplashScreen(),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


//
// class GetStarted01 extends StatefulWidget {
//   const GetStarted01({Key? key}) : super(key: key);
//
//   @override
//   _GetStarted01State createState() => _GetStarted01State();
// }
//
// class _GetStarted01State extends State<GetStarted01> {
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//
//             Container(
//               height: height*0.1,
//               color: Colors.pink,
//               child: Row(
//                 children: [
//
//                     Container(
//                       width: width*0.15,
//                       height: height*0.1,
//                       color: Colors.white,
//                       child: Container(
//                         color:  Color(0xff57bbb4),
//                         child: IconButton(onPressed: (){},
//                             icon: Icon(Icons.arrow_back),
//                           color: Colors.white,
//                           //splashColor: Colors.purple,
//
//
//
//                         ),
//                       ),
//                     ),
//                   Container(
//                     width: width*0.70,
//                       height: height*0.1,
//                   //    margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
//                       alignment: Alignment.center,
//                       color: Colors.white,
//                     child: Text(
//                       "Get Started",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),
//                     )
//                   ),
//                   Container(
//                       width: width*0.15,
//                     //  margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
//                       alignment: Alignment.center,
//                       color: Colors.white,
//
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: height*0.5,
//               width: width,
//               color: Colors.white,
//               child: Stack(
//
//                 children: [
//                  Positioned(
//                    top: 275,
//                     left: 20,
//                    right: 210,
//                    bottom: 0,
//                    child: Container(
//                      decoration: BoxDecoration(
//                          color:  Color(0xff57bbb4),
//                          borderRadius: BorderRadius.all(Radius.circular(14))
//                      ),
//                      width: width*0.3,
//
//                    ),
//                  ),
//                   Positioned(
//                     top: 0,
//                     left: 45,
//                     right: 0,
//                     bottom: 25,
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: Color(0xffd2f3f3),
//                           borderRadius: BorderRadius.all(Radius.circular(14))
//                       ),
//                       height: height*0.3,
//                       width: width*0.5,
//                      // color: Color(0xffd2f3f3),
//                     ),
//                   )
//
//                 ],
//               ),
//             ),
//             Container(
//               height: height*0.10,
//               width: width,
//               color: Colors.white,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 70,vertical: 0),
//                   alignment: Alignment.topCenter,
//                   child: const Text('How to Get Started with the Best Sports Betting Apps Us',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                   ),)),
//               // child: (
//               //   children: [
//               //     Padding(
//               //       padding: EdgeInsets.symmetric(horizontal: 8),
//               //       child: Container(
//               //
//               //         color: Colors.white,
//               //         padding: EdgeInsets.all(22),
//               //         child:  Flexible(
//               //           child: Text("How to Get Started with the Best "
//               //               "Sports Betting Apps Us",
//               //             style: TextStyle(
//               //               fontWeight: FontWeight.w600,
//               //               color: Colors.black,
//               //               fontSize: 22,
//               //             ),
//               //           ),
//               //         ),
//               //         // Column(
//               //         //   children: const [
//               //         //     Flexible(
//               //         //       child: Text("How to Get Started with the Best Sports Betting Apps Us",
//               //         //         style: TextStyle(
//               //         //           fontWeight: FontWeight.w600,
//               //         //           color: Colors.black,
//               //         //           fontSize: 22,
//               //         //         ),
//               //         //       ),
//               //         //     ),
//               //         //   ],
//               //         // ),
//               //
//               //
//               //       ),
//               //     ),
//               //   ],
//               // ),
//             ),
//             Container(
//               height: height*0.12,
//               width: width,
//               color: Colors.white,
//               child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 40),
//                   alignment: Alignment.topCenter,
//                   child: const Text('Ready to start wagering with the best sports betting app for 2021? We''ll show you how to sign up for an account with BetOnline and place your first bet.',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xff989898),
//                     )
//                     ,)
//               ),
//               // child: (
//               //   children: [
//               //     Padding(
//               //       padding: EdgeInsets.symmetric(horizontal: 8),
//               //       child: Container(
//               //
//               //         color: Colors.white,
//               //         padding: EdgeInsets.all(22),
//               //         child:  Flexible(
//               //           child: Text("How to Get Started with the Best "
//               //               "Sports Betting Apps Us",
//               //             style: TextStyle(
//               //               fontWeight: FontWeight.w600,
//               //               color: Colors.black,
//               //               fontSize: 22,
//               //             ),
//               //           ),
//               //         ),
//               //         // Column(
//               //         //   children: const [
//               //         //     Flexible(
//               //         //       child: Text("How to Get Started with the Best Sports Betting Apps Us",
//               //         //         style: TextStyle(
//               //         //           fontWeight: FontWeight.w600,
//               //         //           color: Colors.black,
//               //         //           fontSize: 22,
//               //         //         ),
//               //         //       ),
//               //         //     ),
//               //         //   ],
//               //         // ),
//               //
//               //
//               //       ),
//               //     ),
//               //   ],
//               // ),
//             ),
//             Container(
//               height: height*0.18,
//               color: Colors.white,
//               child: Row(
//                 children: [
//                     Container(
//                       width: width*0.2,
//                       child: Text('01',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xff000000),
//                         )
//                         ,),
//                     ),
//
//                   Container(
//                     width: width*0.8,
//                     height: height*0.07,
//
//                     child:
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(70, 0, 30, 0),
//                       child: TextButton(onPressed: (){
//                         Navigator.push(context, MaterialPageRoute(
//                             builder: (context) => GetStarted02())
//                         );
//
//
//
//                       },
//                           style: ButtonStyle(
//                               backgroundColor: MaterialStateProperty.all(Color(0xff57bbb4)),
//                               foregroundColor: MaterialStateProperty.all(Colors.white),
//                               padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 14)),
//                               textStyle: MaterialStateProperty.all(TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 14,
//                               )
//                               )
//                           ),
//                           child: const Text("Next")
//                       ),
//                     ),
//                   )
//
//                 ],
//               ),
//             )
//
//
//
//           ],
//         ),
//
//       ),
//     );
//   }
// }
