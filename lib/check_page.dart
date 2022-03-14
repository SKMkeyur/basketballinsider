import 'package:basketballinsider/screens/home.dart';
import 'package:flutter/material.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  _CheckPageState createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    Navigator.push(context,
         MaterialPageRoute(builder: (context) => new HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

