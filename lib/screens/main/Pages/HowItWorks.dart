import 'package:flutter/material.dart';
import 'package:highgram/models/constants.dart';
import 'package:highgram/services/helper/helper.functions.dart';
import 'package:flutter/services.dart';

class HowItWorks extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<HowItWorks> {
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  ClipboardData data;

  Future getUserInfo() async {
    Constants.email = await HelperFunctions.getUserEmailSharedPreference();
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: const FractionalOffset(0.5, 0.14),
            colors: [Color(0xFF1222ac), Color(0xFF090e45)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 24.5,
                        right: MediaQuery.of(context).size.width / 2 - 98.5,
                        top: 30),
                    child: GestureDetector(
                        child: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        }),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 34,
                      ),
                      child: Text(
                        "How it works",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontFamily: "TTCommon"),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  //!1
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(left: 28, right: 28, top: 32),
                          height: 84,
                          width: 343,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(width: 2, color: Color(0xFF181d53)),
                            color: Color(0xFF12185F),
                          ),
                          child: Text(
                              "You provide your followers or friends with the code, you can do that in your story or feed.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "TTCommon")),
                        ),
                        Positioned(
                          bottom: 56,
                          child: Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xFFCF71FE),
                                  Color(0xFF6225FF),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(69),
                            ),
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 8),
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 38,
                                      fontFamily: "TTCommon"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //!2
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 32),
                          height: 76,
                          width: 343,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(width: 2, color: Color(0xFF181d53)),
                            color: Color(0xFF12185F),
                          ),
                          child: Text(
                              "Then if they sign up in the app they are asked to input a code",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "TTCommon")),
                        ),
                        Positioned(
                          bottom: 46,
                          child: Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFF96029),
                                  Color(0xFFFC7F52),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(69),
                            ),
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 8),
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 38,
                                      fontFamily: "TTCommon"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //!3
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(left: 24, right: 24, top: 34),
                          height: 101,
                          width: 343,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(width: 2, color: Color(0xFF181d53)),
                            color: Color(0xFF12185F),
                          ),
                          child: Text(
                            "If they sign up with your code, you earn money for every ad that is shown to them and get the ad balance credited to your account.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "TTCommon"),
                          ),
                        ),
                        Positioned(
                          bottom: 70,
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xFFFF69DD),
                                  Color(0xFFFF2577),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(69),
                            ),
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 8),
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 38,
                                      fontFamily: "TTCommon"),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 45),
                    width: 343,
                    height: 127,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/Treasure.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
