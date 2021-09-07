import 'package:flutter/material.dart';
import 'package:highgram/models/constants.dart';
import 'package:highgram/screens/main/Pages/HowItWorks.dart';
import 'package:highgram/screens/main/pages/Statistics.dart';
import 'package:highgram/services/auth.service.dart';
import 'package:highgram/services/helper/helper.functions.dart';
import 'package:flutter/services.dart';
import 'package:fl_chart/fl_chart.dart';

class Affiliate extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<Affiliate> {
  final AuthService _auth = AuthService();
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  String _AffiliateCode = "#AffiliateCode";

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
                        right: MediaQuery.of(context).size.width / 2 - 74.5,
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
                        "Affiliate",
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
              Container(
                margin: EdgeInsets.only(top: 25),
                width: 343,
                height: 117,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/AffiliateBackground.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 28, right: 65),
                      width: 164,
                      height: 60,
                      child: Text(
                        "You want to know how to make easy money with instagram?",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          fontFamily: "TTCommon",
                        ),
                      ),
                    ),
                    Container(
                      width: 62,
                      height: 62,
                      child: Image.asset("assets/images/HighGramRound.png"),
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  margin: EdgeInsets.only(top: 26),
                  padding: EdgeInsets.only(top: 22),
                  width: 248,
                  height: 89,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/TextBox.png"),
                    ),
                  ),
                  child: Text(
                    "Show your followers this code. Your Affiliate Code",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      fontFamily: "TTCommon",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 48,
                width: 248,
                decoration: BoxDecoration(
                  color: Color(0xFF111455),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 26),
                      child: Text(
                        "$_AffiliateCode",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(left: 26),
                        width: 88,
                        height: 36,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFF5FD0FF), Color(0xFF2880FF)],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "Copy",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: _AffiliateCode));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                      "Affiliate Code copied to clipboard"),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),

              //Buttons
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 48),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Statistics
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFFF96029),
                                  Color(0xFFFc7F52),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(69)),
                          width: 146,
                          height: 51,
                          child: Center(
                            child: Text(
                              "Statistics",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                fontFamily: "TTCommon",
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AffiliateStatistics(),
                            ),
                          );
                        },
                      ),
                      //How it works
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(left: 18),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF5157F4),
                                  Color(0xFF2A30CE),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(69)),
                          width: 146,
                          height: 51,
                          child: Center(
                            child: Text(
                              "How it works",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                fontFamily: "TTCommon",
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HowItWorks(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              //Space Widget
              Container(
                margin: EdgeInsets.only(top: 49),
                width: 343,
                height: 137,
                child: Image.asset("assets/images/Space2.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
