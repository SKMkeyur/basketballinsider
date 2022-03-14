import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

import 'package:image_picker/image_picker.dart';
class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {

  final ImagePicker imgpicker = ImagePicker();
  String imagepath = "";
  late String photoString;
  late String fileName = "";
  List<String> attachments = [];

  TextEditingController email1 = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController message = TextEditingController();



  openImage() async {
    try {
      var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
      //you can use ImageCourse.camera for Camera capture
      if(pickedFile != null){
        imagepath = pickedFile.path;
        attachments.add(pickedFile.path);

        print(imagepath);
        fileName=pickedFile.name;
        //output /data/user/0/com.example.testapp/cache/image_picker7973898508152261600.jpg

        File imagefile = File(imagepath); //convert Path to File
        Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
        String base64string = base64.encode(imagebytes); //convert bytes to base64 string
        print(base64string);
        /* Output:
              /9j/4Q0nRXhpZgAATU0AKgAAAAgAFAIgAAQAAAABAAAAAAEAAAQAAAABAAAJ3
              wIhAAQAAAABAAAAAAEBAAQAAAABAAAJ5gIiAAQAAAABAAAAAAIjAAQAAAABAAA
              AAAIkAAQAAAABAAAAAAIlAAIAAAAgAAAA/gEoAA ... long string output
              */

        Uint8List decodedbytes = base64.decode(base64string);
        //decode base64 stirng to bytes

        setState(() {
          photoString = base64string;
        });
      }else{
        print("No image is selected.");
      }
    }catch (e) {
      print("error while picking file."+e.toString());
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {



    double safe = MediaQuery.of(context).padding.top;
    double height1 = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double barheight =AppBar().preferredSize.height;
    double height = height1-safe-barheight;
    return WillPopScope(
      onWillPop: () async => true,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
               Container(
             //   color: Colors.white,
              height: barheight,
              child: Row(
                children: [
                  Container(
                  //  color: Colors.red,
                    width: width * 0.25,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.fromLTRB(5, 0, 20, 0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xff57bbb4),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      alignment: Alignment.center,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
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
                      width: width * 0.50,
                      child: Text(
                        "Feedback",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      )),
                  Container(
                    width: width * 0.25,
                    alignment: Alignment.center,
                  ),
                ],
              ),
                ),

                Stack(
                  children: [

                    Container(

                      margin: EdgeInsets.only(top: 20),
                      child: Transform.rotate(
                        angle: -math.pi / 12.0,
                        child: Container(

                          decoration: BoxDecoration(
                              color: const Color(0xff57bbb4),
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          height: height*0.25,
                          width: height*0.25,
                          alignment: Alignment.topCenter,
                          child: const Text('?',style: TextStyle(color: Colors.white,fontSize: 120,fontWeight: FontWeight.w600),),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    // color: Colors.white,
                    height: height1-barheight,
                    child:
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 1.0,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      width: width*0.8,
                      height: (height1-barheight)*0.8,
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email"),
                          TextFormField(
                            controller: email1,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Color(0xffd7d7d7)
                              ),
                              fillColor: Color(0xffFCFCFC),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Color(0xffd7d7d7),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Color(0xffd7d7d7),

                                  //  color: Color(0xffd2d2d2),
                                    width: 2.0,
                                  ),
                                ),
                                filled: true,
                                border: OutlineInputBorder(),
                              hintText: "Your Email Address"

                            ),
                          ),
                          Row(
                            children: [
                              Text("Subject"),
                              SizedBox(width: 3,),
                              Text("(Optional)",style: TextStyle(color: Colors.blue),),

                            ],
                          ),
                          TextFormField(
                            controller: subject,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: Color(0xffd7d7d7)
                                ),
                                fillColor: Color(0xffFCFCFC),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Color(0xffd7d7d7),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Color(0xffd7d7d7),
                                    //  color: Color(0xffd2d2d2),
                                    width: 2.0,
                                  ),
                                ),
                                filled: true,
                                border: OutlineInputBorder(),
                                hintText: "Summary of your observation..."
                            ),
                          ),
                          Text("Message"),
                          TextFormField(
                            controller: message,
                            maxLines: 7,
                              textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                // contentPadding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 10.0),

                                hintStyle: TextStyle(
                                    color: Color(0xffd7d7d7)
                                ),
                                fillColor: Color(0xffFCFCFC),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Color(0xffd7d7d7),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Color(0xffd7d7d7),

                                    //  color: Color(0xffd2d2d2),
                                    width: 2.0,
                                  ),
                                ),
                                filled: true,
                                border: OutlineInputBorder(),
                                hintMaxLines: 3,

                                hintText: "Give as many details as possible..."

                            ),
                          ),
                          Container(
                            height: 15,
                             child:
                            fileName=="" ?
                             Text("")
                                :
                                Text("File Selected")


                          ),
                          InkWell(
                            onTap: (){

                              openImage();

                            },
                            child: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                Icon(FontAwesomeIcons.paperclip,color: Colors.blue,),
                                SizedBox(width: 5,),
                                Text("Upload your attachments",style: TextStyle(color: Colors.blue),)
                              ],),
                            ),
                          ),
                          InkWell(
                            onTap: ()async{
                              print("ewewe");
                              if(message.text==""){
                                Fluttertoast.showToast(
                                    msg: "Message should not be empty",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Color(0xff57bbb4),
                                    textColor: Colors.white
                                );
                              }else if( email1.text==""){
                                Fluttertoast.showToast(
                                    msg: "Email should not be empty",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Color(0xff57bbb4),
                                    textColor: Colors.white
                                );
                              }else{

                                final Email email = Email(
                                  body: message.text,
                                  subject: subject.text,
                                  recipients: ['ultimatebettingsite@gmail.com'],
                                  // cc: ['cc@example.com'],
                                  // bcc: ['bcc@example.com'],
                                  attachmentPaths: attachments,
                                  isHTML: false,
                                );

                                await FlutterEmailSender.send(email);
                              }



                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff57bbb4),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              alignment: Alignment.center,
                              width: width,
                              height: height*0.07,
                              child: Text("SEND FEEDBACK",style: TextStyle(color: Colors.white),),
                            ),
                          )

                        ],
                      ),
                    )
              ),
                  ],
                )

              ],
            ),
          ),
        ),

      ),
    );
  }
}
