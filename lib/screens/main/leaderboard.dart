import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:highgram/models/constants.dart';
import 'package:highgram/services/auth.service.dart';
import 'package:highgram/services/database.service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:highgram/services/helper/helper.functions.dart';

class Leaderboard extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<Leaderboard> {
  // ignore: unused_field
  final AuthService _auth = AuthService();
  final DatabaseMethods _databaseMethods = DatabaseMethods();
  var currentRank;
  var userOnLeaderBoard = {
    {"id": "", "rank": 0, "name": ""},
  };
  void initState() {
    getUserInfo();
    super.initState();
  }

  Future getUserInfo() async {
    Constants.email = await HelperFunctions.getUserEmailSharedPreference();
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: const FractionalOffset(0.5, 0.14),
              colors: [
                Color(0xFF1222ac),
                Color(0xFF090e45),
              ],
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
                          right: MediaQuery.of(context).size.width / 2 - 96,
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
                          "Leaderboard",
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
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: 18,
                          bottom: MediaQuery.of(context).size.height / 6 + 7),
                      width: 343,
                      height: 553,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF111455),
                      ),
                    ),
                    //!Info
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(top: 18),
                        width: 343,
                        height: 51.63,
                        decoration: BoxDecoration(
                          color: Color(0xFF181B62),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Positioned(
                              left: 15,
                              child: Container(
                                child: Text(
                                  "Highscore",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 86,
                              child: Container(
                                child: Text(
                                  "ID",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 180,
                              child: Container(
                                child: Text(
                                  "Player Name",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 70),
                      child: User(),
                    ),
                    Positioned(
                      //left: MediaQuery.of(context).size.width / 6, //15
                      top: 530,
                      child: Container(
                        width: 274,
                        height: 71,
                        decoration: BoxDecoration(
                          color: Color(0xFF12185f).withOpacity(0.12),
                          border: Border.all(
                            width: 2,
                            color: Colors.white.withOpacity(0.06),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                            child: Container(
                              color: Color(0xFF12185f).withOpacity(0.12),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 15, bottom: 9),
                                    child: Text(
                                      "Your rank is",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 12),
                                    ),
                                  ),
                                  FutureBuilder(
                                      future: _databaseMethods.GetUserRank(
                                          Constants.myName),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          return Text(
                                            "#${snapshot.data}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          );
                                        } else {
                                          return SpinKitDualRing(
                                            color: Colors.white,
                                            size: 10.0,
                                          );
                                        }
                                      })
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget User() {
    return FutureBuilder(
      future: _databaseMethods.GetLeaderboardData().then(
        (val) => {
          for (var i = 0; i < val.documents.length; i++)
            {
              userOnLeaderBoard.add(val.documents[i].data),
            },
        },
      ),
      // ignore: missing_return
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ConstrainedBox(
            constraints: new BoxConstraints(
              minHeight: 460.0,
              maxHeight: 460.0,
              maxWidth: 301,
              minWidth: 301,
            ),
            child: ListView(children: [
              for (var i = 1;
                  i < userOnLeaderBoard.toList().length && i < 101;
                  i++)
                Container(
                  margin: EdgeInsets.only(top: 0.5),
                  width: 301,
                  height: 46,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 3, left: 16),
                        child: Text(
                          "${userOnLeaderBoard.toList()[i]["highscore"]}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(minWidth: 130, maxWidth: 130),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 3, left: 23),
                          child: Text(
                            "${userOnLeaderBoard.toList()[i]["id"]}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      //!ProfilePicture
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage("assets/images/ProfilePicture.png"),
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 100),
                        child: Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            "${userOnLeaderBoard.toList()[i]["name"]}",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ]),
          );
        } else {
          return ConstrainedBox(
            constraints: new BoxConstraints(
              minHeight: 460.0,
              maxHeight: 460.0,
              maxWidth: 301,
              minWidth: 301,
            ),
            child: SpinKitDualRing(
              color: Colors.white,
              size: 50.0,
            ),
          );
        }
      },
    );
  }
}
