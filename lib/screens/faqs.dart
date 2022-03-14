import 'package:flutter/material.dart';

class Faqs extends StatefulWidget {
  const Faqs({Key? key}) : super(key: key);

  @override
  _FaqsState createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {

  final List<MyItem> _items = <MyItem>[
    MyItem(header: "What exactly is live betting?",
        body: "It's a lot of fun, and it's one of the most significant developments "
            "in sports betting."
            "\n Live betting, also known as in-play betting, allows "
            "you to place bets on sporting events after they have begun. You can bet while "
            "watching the game, making sports betting more exciting than ever before. Live "
            "betting was introduced in the early twenty-first century. It's become one of the "
            "most popular ways to bet on sports, and it's opened up a plethora of new wagering options."),
    // TODO: Add $ sign in the body text before 750
    MyItem(header: "Can I really make money by betting on sports online?",
        body: "Yes. That is conditional. Now it's your turn to answer some questions. "
            "\n·         Do you have a thorough understanding of at least one sport?"
            "\n·         Do you have a lot of free time? "
            "\n·         Do you have a betting bankroll?"
            "\n·         Are you a disciplined person?"
            "\n·         Are you able to make decisions based on logic rather than emotion?"
            "\n·         Are you ready to learn everything there is to know about sports betting strategy? "
            "\n·         Are you willing to devote a significant amount of time to research and analysis?"
            "\n If you answered yes to all (or even most) of these questions, you are likely to be a "
            "successful sports bettor. You will, however, have to put in a lot of effort. Although the "
            "internet has made it much easier for us to bet on our favorite sports, making money remains difficult. "
            "Unfortunately, there are no shortcuts to success."),
    MyItem(header: "4. Does a Ke Token payment go directly to the bank account?",
        body: "Sure! Because mobile betting is so popular these days, most sites cater to those who want to bet "
            "using their smartphone or tablet. They devote a significant amount of time to ensuring that their "
            "websites are compatible with all mobile devices. Some websites have even created their own apps, "
            "which are frequently available for a wide range of devices."),

    MyItem(header: "Is it necessary for me to be a sports specialist in order to bet on sports?",
        body: "No. Anyone, regardless of their sports knowledge, can bet on sports. However, the more knowledge you "
            "have about the sports you're betting on, the easier it will be for you to determine what bets are ideal for "
            "you at any particular time. Don't let your lack of experience with sports betting prevent you from trying it out."),

    MyItem(header: "Is there a limit to the number of online betting sites I can bet at?",
        body: "Fortunately, there is no limit to how many sports betting websites you can use. "
            "You can use as many or as few as you want, depending on your tastes. If you like to "
            "use various online sportsbooks, there is no rule preventing you from doing so."),

    MyItem(header: "How much should I bet?",
        body: "While it comes to sports betting, one of the most frequently asked questions by newcomers "
            "is how much money they should risk when placing a wager. To summarise, there is no one-size-fits-all "
            "answer to this subject. Based on a variety of circumstances, the amount of money you should risk may "
            "differ from that of another individual placing the same bet."),

  ];

  @override
  Widget build(BuildContext context) {

    bool active = false;
    String exTitle = "Sport Categories";

    double safe = MediaQuery.of(context).padding.top;

    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset:true,
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                // Container(
                //   alignment: Alignment.center,
                //   height: height*0.1,
                //   child: Text(
                //     "Faqs",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),
                //   ),
                // ),
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
                          child: Text("Faqs",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),
                          )
                      ),
                      Container(
                        width: width*0.25,
                        alignment: Alignment.center,
                        // child: Icon(Icons.search),

                      ),
                    ],
                  ),
                ),




              Container(
                height: height*0.1,

              ),


                Container(
                  height: height*0.8,
                child: ListView(
                  children: [
                        ExpansionPanelList(
                          expansionCallback: (int index,bool isExpanded){
                             setState(() {
                               _items[index].isExpanded = !_items[index].isExpanded;
                             });
                          },
                          children: _items.map((MyItem item){
                            return ExpansionPanel(
                              canTapOnHeader: true,
                                headerBuilder: (BuildContext context,bool isExpanded){
                                  return Container(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Icon(Icons.adjust,color:  Color(0xff57bbb4),),
                                          SizedBox(width: 10,),
                                          Flexible(child:
                                          Text(item.header)),
                                        ],
                                      ));
                                },
                                isExpanded: item.isExpanded,
                                body: Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: width*0.2,
                                      child: Container(
                                   //     width: 4,
                                      //  height: height*0.01,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      width: width*0.7,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(20),
                                      decoration:
                                       BoxDecoration(
                                           color: Color(0xffddeceb),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                      child: Text(
                                        item.body,style: TextStyle(
                                        color:Color(0xff989898),
                                      ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: width*0.1,
                                      child: Container(
                                        //     width: 4,
                                        //  height: height*0.01,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                            );
                          }).toList(),

                        )
                  ],
                )
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyItem{
    late bool isExpanded;
    late final String header;
    late final String body;

    MyItem({this.isExpanded:false, required this.header, required this.body});
}