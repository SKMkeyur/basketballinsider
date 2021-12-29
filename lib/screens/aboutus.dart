import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {

    double safe = MediaQuery.of(context).padding.top;

    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,

        body: SingleChildScrollView(
          child: Container(
            width: width,
            child: Column(
              children: [
                Container(
                  //color: Colors.white,
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
                          child: Text("About US",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),
                          )
                      ),
                      Container(
                        width: width*0.25,
                        alignment: Alignment.center,
                        //child: Icon(Icons.search),

                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),

                  child: Container(
                    padding: EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" Are you fed up with looking for reputable and entertaining online betting sites? ",
                        style: TextStyle(color: Color(0xff57bbb4),fontSize: 20,fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10,),
                        Text("\u2022    "+"Then we'd like to welcome you to our App! Here you can find the "
                            "most recent information as well as comprehensive reviews of the finest sites "
                            "to play and win. We've gathered a wealth of betting knowledge and are ready to "
                            "present you with an unforgettable gaming experience. Sites in our Top-10 list are "
                            "guaranteed to be the best. All of our writing is done in-house, so you'll always know "
                            "who's presenting you with the information on our site.",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        ),
                        Text("\u2022    "+"It's always worthwhile to do your analysis before choosing a betting site. You might begin by reading some of our comprehensive evaluations.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text("\u2022    "+"We can't guarantee that every site we review will be perfect "
                            "for you, but we can guarantee that after reading one, you'll be in a lot better position to make a decision.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text("\u2022    "+"The App's main aim and goal is to provide bettors of all skill levels with "
                            "high-quality sports betting content and resources. We believe that too many internet sports betting resources "
                            "provide readers with ambiguous and outdated information. Whether you're a novice just getting started or a "
                            "seasoned pro with decades of experience, our goal is to provide clear and practical resources backed by data "
                            "that genuinely improve your odds of earning real money betting on sports. ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text("\u2022    "+"We make every effort to include as many popular sports as possible.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text("\u2022    "+"For us, there are two major advantages to betting online rather than at a "
                            "traditional brick-and-mortar sportsbook. The bonuses given, as well as the convenience of "
                            "betting online, are two of the reasons.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),



                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),

                  child: Container(
                    padding: EdgeInsets.all(20),

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" Why Should You Trust this App for Your Sports Betting Needs?",
                          style: TextStyle(color: Color(0xff57bbb4),fontSize: 20,fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10,),
                        Text("\u2022    "+"Then we'd like to welcome you to our App! Here you can find the "
                            "most recent information as well as comprehensive reviews of the finest sites "
                            "to play and win. We've gathered a wealth of betting knowledge and are ready to "
                            "present you with an unforgettable gaming experience. Sites in our Top-10 list are "
                            "guaranteed to be the best. All of our writing is done in-house, so you'll always know "
                            "who's presenting you with the information on our site.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text("\u2022    "+"While making money betting on sports may be a pastime for some, it is a source of income for our team. There are many components to becoming a great bettor, and we're convinced that our years of industry knowledge, free picks, betting strategy ideas, tools, and other resources will help you get closer to that objective than any other site online.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text("\u2022    "+"This app is not a betting site or an online betting operator of any kind. We're merely here to entertain you by providing you with information regarding sports betting..",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text("\u2022    "+"We are here to supply you with all of the information you require about betting online anywhere in the world. The world of online betting is continuously changing, and we are committed to remaining on top of any and all industry changes. It's critical to keep users up to date on the latest changes to betting regulations and other news.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text("\u2022    "+"We also don't operate in a self-serving manner. "
                            "We're here to help! Our promise to you is to keep you safe and have a good "
                            "time while betting on the internet. As a result, our mission is to keep you informed. "
                            "We take pride in providing you with an honest, complete look at everything related to online gambling, "
                            "as well as providing you with the best available advice along the road.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),


                      ],
                    ),
                  ),
                )
              ],
            ),

          ),
        ),

      ),
    );
  }
}
