import 'package:basketballinsider/models/sites.dart';
import 'package:basketballinsider/models/users.dart';
import 'package:basketballinsider/widgets/searchwidget.dart';
import 'package:flutter/material.dart';
import 'package:basketballinsider/models/services.dart';


class JsonParseDemo01 extends StatefulWidget {
  const JsonParseDemo01({Key? key}) : super(key: key);

  @override
  _JsonParseDemo01State createState() => _JsonParseDemo01State();
}

class _JsonParseDemo01State extends State<JsonParseDemo01> {

  late List<Site> _sites;
  late bool _loading;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading =true;
    _sites = <Site>[];
    String query = '';

    SiteServices.getUsers().then((sites) {
      setState(() {
        _sites = sites;
        _loading = false;
      });

    });
  }
  // void searchBook(String query){
  //   final Books = _users.where((user) {
  //     final searchlower = user.name.toLowerCase();
  //     final searchuser = query.toLowerCase();
  //     return searchlower.contains(searchuser);
  //   }
  //   ).toList();
  //   setState(() {
  //     = query;
  //   });
  // }

  // Widget buildSearch()=> SearchWidget(
  //   text: query,
  //   hintText: "name",
  //   onChanged: searchBook,
  // );

  @override
  Widget build(BuildContext context) {
    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double height = height1-safe;


    return Scaffold(
      appBar: AppBar(title: _loading ? Text("Loading....") : Text('Json Parser'),
      ),
      body: Container(
     //     color: Colors.pinkAccent,
          child: Column(
            children: [
              // Container(
              //   height: height*0.1,
              //     child: buildSearch()
              // ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                   // shrinkWrap: true,
                    itemCount: _sites.length,
                    itemBuilder: (context,index){
                  Site site  = _sites[index];
                  return
                 // _sites.length != 0 ? Container(child: Center(child: Text("Not 0")),):
                    Column(
                      children: [
                        Container(
                       //   color: Colors.red,
                          width: width,
                         // color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            //borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(site.title,style: TextStyle(color: Colors.white),),
                                Text(site.bonus)
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  //   ListTile(
                  //   title: Text(user.name),
                  //   subtitle: Text(user.email),
                  // );
                }
                ),
              ),
            ],
          ),
      ),

    );




  }
}
