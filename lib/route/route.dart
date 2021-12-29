import 'package:flutter/material.dart';
import 'package:basketballinsider/screens/betdescription.dart';
import 'package:basketballinsider/screens/comparison.dart';
import 'package:basketballinsider/screens/faqs.dart';
import 'package:basketballinsider/screens/getstarted00.dart';
import 'package:basketballinsider/screens/getstarted01.dart';
import 'package:basketballinsider/screens/getstarted02.dart';
import 'package:basketballinsider/screens/getstarted03.dart';
import 'package:basketballinsider/screens/getstarted04.dart';
import 'package:basketballinsider/screens/home.dart';
import 'package:basketballinsider/screens/home01.dart';
import 'package:basketballinsider/screens/menu.dart';
import 'package:basketballinsider/screens/review.dart';
import 'package:basketballinsider/screens/test.dart';

const String getstarted00Screen = "getstarted00";
const String getstarted01Screen = "getstarted01";
const String getstarted02Screen = "getstarted02";
const String getstarted03Screen = "getstarted03";
const String getstarted04Screen = "getstarted04";
const String homeScreen = "home";
const String reviewScreen = "review";
const String menuScreen = "menu";
const String betdescriptionScreen = "betdescription";
const String comparisonScreen = "comparison";
const String faqsScreen = "faqs";

Route<dynamic> controller(RouteSettings settings){

  switch(settings.name){
    case homeScreen:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case homeScreen:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case homeScreen:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case homeScreen:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case homeScreen:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    default:
      throw("this route does not exist");
  }


}



