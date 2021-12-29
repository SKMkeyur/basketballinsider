
import 'package:basketballinsider/screens/getstarted02.dart';
import 'package:flutter/material.dart';
import 'package:basketballinsider/screens/getstarted01.dart';

import 'package:basketballinsider/screens/getstarted04.dart';

class GetStarted03 extends StatefulWidget {
  const GetStarted03({Key? key}) : super(key: key);

  @override
  _GetStarted03State createState() => _GetStarted03State();
}

class _GetStarted03State extends State<GetStarted03> {
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
                child: Row(
                  children: [
                    Container(
                      width: width*0.25,
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
                        child: Text("Get Started",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),
                        )
                    ),
                    Container(
                      width: width*0.25,

                    ),

                  ],
                ),

              ),
              // Container(
              //   height: height*0.1,
              //   color: Colors.pink,
              //   child: Row(
              //     children: [
              //
              //       Container(
              //         width: width*0.15,
              //         height: height*0.1,
              //         color: Colors.white,
              //         child: Container(
              //           color:  Color(0xff57bbb4),
              //           child: IconButton(onPressed: (){
              //             Navigator.pop(context);
              //
              //             // Navigator.push(context, MaterialPageRoute(
              //             //     builder: (context) => GetStarted02()));
              //
              //           },
              //             icon: Icon(Icons.arrow_back),
              //             color: Colors.white,
              //             //splashColor: Colors.purple,
              //
              //
              //
              //           ),
              //         ),
              //       ),
              //       Container(
              //           width: width*0.70,
              //           height: height*0.1,
              //           //    margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
              //           alignment: Alignment.center,
              //           color: Colors.white,
              //           child: Text(
              //             "Get Started",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),
              //           )
              //       ),
              //       Container(
              //         width: width*0.15,
              //         //  margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
              //         alignment: Alignment.center,
              //         color: Colors.white,
              //
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                height: height*0.5,
                width: width,
                color: Colors.white,
                child: Stack(

                  children: [
                    Positioned(
                      top: 275,
                      left: 20,
                      right: 210,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color:  Color(0xff57bbb4),
                            borderRadius: BorderRadius.all(Radius.circular(14))
                        ),
                        width: width*0.3,

                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 45,
                      right: 0,
                      bottom: 25,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xfff0f0f1),
                            borderRadius: BorderRadius.all(Radius.circular(14))
                        ),
                        height: height*0.3,
                        width: width*0.5,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xfff5f5f5),
                              borderRadius: BorderRadius.all(Radius.circular(14))
                          ),
                          height: height*0.3,
                          width: width*0.5,
                          child: Image.asset("graphic_res/gs3.png",fit: BoxFit.contain,),


                          // color: Color(0xffd2f3f3),
                        ),
                        // color: Color(0xffd2f3f3),
                      ),
                    )

                  ],
                ),
              ),
              Container(
                height: height*0.08,
                width: width,
                color: Colors.white,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 70,vertical: 0),
                    alignment: Alignment.topCenter,
                    child: const Text('Deposite funds',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),)),
              ),
              Container(
                height: height*0.2,
                width: width,
                color: Colors.white,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        const Text("Next, deposite funds to your BetOnline accont. You can play with credit card, debit card,"
                            "eCheck, or cryptocurrency.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff989898),
                          ),
                        ),

                      ],
                    )
                ),
              ),

              // Container(
              //   height: height*0.6,
              //   width: width,
              //   color: Colors.white,
              //   child: Container(
              //       padding: EdgeInsets.symmetric(horizontal: 40),
              //       alignment: Alignment.topCenter,
              //       child: const Text("Enter your name, birthday, email, phone number, and a password to create a new account",
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           fontSize: 14,
              //           fontWeight: FontWeight.w400,
              //           color: Color(0xff989898),
              //         )
              //         ,)
              //   ),
              // ),

              Container(
                height: height*0.12,
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
                              builder: (context) => GetStarted04())
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
                            child: const Text("Next")
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
