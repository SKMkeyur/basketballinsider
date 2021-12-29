import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Option{
  late Icon icon;
  late String title;
  late String subtitle;
  late Image image_;
  Option(this.icon, this.title, this.subtitle,this.image_);
}


final options = [
  Option(Icon(Icons.home, size: 35.0), "Home", "Your betting home",Image.asset("graphic_res/design_3_assets/2/bookmark_Icon.png")),
  Option(Icon(FontAwesomeIcons.compass, size: 35.0),"Review","Explore your betting",Image.asset("graphic_res/design_3_assets/2/bookmark_Icon.png",width: 35,height: 35,)),
  Option(Icon(Icons.compare, size: 35.0), "Comparison", "Compare betting",Image.asset("graphic_res/design_3_assets/2/bookmark_Icon.png",width: 35,height: 35,fit: BoxFit.cover,scale: 0.5,)),
  //Option(Icon(FontAwesomeIcons.bookmark, size: 35.0), color: Colors.red, size: 24,), "Comparison", "Compare betting",ImageIcon(AssetImage("images/icon_more.png"), color: Color(0xFF3A5A98),),),),
  Option(Icon(FontAwesomeIcons.moneyCheck, size: 35.0), "Faqs", "Frequently asked questions",Image.asset("graphic_res/design_3_assets/2/bookmark_Icon.png")),
  Option(Icon(FontAwesomeIcons.sun, size: 35.0), "Get Started", "How to Get Started",Image.asset("graphic_res/design_3_assets/2/bookmark_Icon.png")),
];