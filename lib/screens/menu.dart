import 'package:basketballinsider/screens/comparison.dart';
import 'package:basketballinsider/screens/faqs.dart';
import 'package:basketballinsider/screens/home.dart';
import 'package:basketballinsider/screens/review.dart';
import 'package:flutter/material.dart';
import 'package:basketballinsider/models/options.dart';
import 'package:basketballinsider/screens/getstarted02.dart';
import 'package:basketballinsider/screens/getstarted01.dart';
import 'package:basketballinsider/screens/getstarted03.dart';
import 'package:basketballinsider/screens/getstarted04.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuOptionsScreen extends StatefulWidget {
  const MenuOptionsScreen({Key? key}) : super(key: key);

  @override
  _MenuOptionsScreenState createState() => _MenuOptionsScreenState();
}

class _MenuOptionsScreenState extends State<MenuOptionsScreen> {
  int _selectedOption = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ReviewScreen(),
    ComparisonScreen(),
    Faqs(),
   GetStarted01(),
  ];


  @override
  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;

    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;


    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.white,
              height: height*0.25,
              child: Row(
                children: [
                  Container(
                    width: width*0.25,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 50),

                    // child: Container(
                    //   width: 40,
                    //   height: 40,
                    //   decoration: BoxDecoration(
                    //     color: Color(0xff57bbb4),
                    //     borderRadius: BorderRadius.all(Radius.circular(10)),
                    //   ),
                    //   alignment: Alignment.center,
                    //   child: IconButton(
                    //     icon: Icon(FontAwesomeIcons.sun,color: Colors.white,size: 20,),
                    //     onPressed: (){
                    //       Navigator.push(context, MaterialPageRoute(
                    //           builder: (context) => GetStarted01())
                    //       );
                    //     },
                    //   ),
                    // ),
                  ),


                  Container(
                    alignment: Alignment.center,
                    width: width*0.50,
                  child: Image.asset('graphic_res/menu.png'),
                  ),
                  Container(
                    width: width*0.25,

                  ),

                ],
              ),

            ),
            Container(
              height: height * 0.75,
              child: ListView.builder(
                itemCount: options.length + 2,   //6
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return SizedBox(height: 0.0);
                  } else if (index == options.length + 1) {
                    return SizedBox(height: 50.0);
                  }
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(0.0),
                    width: double.infinity,
                    height: 80.0,
                    decoration: BoxDecoration(
                   //   color: Colors.white,
                      color: _selectedOption == index - 1
                      ? Color(0xffd2f3f3): Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      // border: _selectedOption == index - 1
                      //     ? Border.all(color: Colors.black26)
                      //     : null,
                    ),
                    child: ListTile(
                      // leading: ConstrainedBox(
                      //   constraints: BoxConstraints(
                      //     minWidth: 44,
                      //     minHeight: 44,
                      //     maxWidth: 64,
                      //     maxHeight: 64,
                      //   ),
                      //   child: Image.asset("graphic_res/design_3_assets/2/bookmark_Icon.png", fit: BoxFit.cover),
                      // ),
                      leading:
                      // (index-1) == 2 ? Container(
                      //     padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                      //     child: options[index - 1].image_) : options[index - 1].icon,
                      //
                      // iconColor: _selectedOption == index - 1
                      // ? Colors.pink : Colors.blue,
                      options[index-1].icon,
                      selectedColor:  _selectedOption == index - 1
                          ? Color(0xff57bbb4) : Colors.blue,
                      title: Text(
                        options[index - 1].title,
                        style: TextStyle(
                          color: _selectedOption == index - 1
                              ? Colors.black
                              : Colors.black,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      subtitle: Text(
                        options[index - 1].subtitle,
                        style: TextStyle(
                          color:
                          _selectedOption == index - 1 ? Colors.grey : Colors.grey,
                        ),
                      ),
                      selected: _selectedOption == index - 1,
                      onTap: () {
                        setState(() {
                          _selectedOption = index - 1;
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => _widgetOptions[index-1])
                          );
                        }
                        );
                      },
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
