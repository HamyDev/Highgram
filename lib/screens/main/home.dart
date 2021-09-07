import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:highgram/screens/main/affiliate.dart';
import 'package:highgram/screens/main/categories.dart';
import 'package:highgram/screens/main/leaderboard.dart';
import 'package:highgram/services/auth.service.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:simple_icons/simple_icons.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
          //gradient: LinearGradient(
          //  begin: Alignment.topCenter,
          //  end: const FractionalOffset(0.5, 1),
          //  colors: [
          //    Color(0xFF090E45),
          //    Color(0xFFFFFFFF),
          //  ],
          //),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 56),
              width: 76,
              height: 76,
              child: Image.asset("assets/images/HighGramRound.png"),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: 28),
                width: 336,
                height: 95,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/PlayBtn.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Play",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: "TTCommon",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Categories(),
                  ),
                );
              },
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: 24),
                width: 336,
                height: 95,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/AffiliateBtn.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Affiliate",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: "TTCommon",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Affiliate(),
                  ),
                );
              },
            ),
            Center(
              child: GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: 45, bottom: 61),
                  width: 270,
                  height: 51,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(69),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF5157F4),
                        Color(0xFF2A30CE),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Leaderboards",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: "TTCommon",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Leaderboard(),
                    ),
                  );
                },
              ),
            ),
            //Background of buttons
            Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 534,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                  topRight: Radius.circular(200),
                ),
                color: Color(0xFF353B7E).withOpacity(0.14),
              ),
              child: Column(
                children: [
                  //Buttons
                  Center(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40, right: 83, top: 34),
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            color: Color(0xFF10175E),
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: Icon(Icons.volume_up_sharp,
                              color: Colors.white, size: 25),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 65, bottom: 30),
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            color: Color(0xFF10175E),
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: Image.asset("assets/images/USA.png"),
                        ),
                        GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(top: 34),
                            width: 54,
                            height: 54,
                            decoration: BoxDecoration(
                              color: Color(0xFF10175E),
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: Icon(FontAwesome.video_camera,
                                color: Colors.white, size: 25),
                          ),
                          onTap: () {
                            _auth.logout();
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    alignment: Alignment.bottomCenter,
                    width: 343,
                    height: 86,
                    child: Image.asset("assets/images/Space.png"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
                //child: MaterialButton(
                //  shape: new RoundedRectangleBorder(
                //    borderRadius: new BorderRadius.circular(30.0),
                //  ),
                //  child: Text(
                //    "Order now",
                //    style:
                //        TextStyle(color: Colors.black, fontFamily: "Raleway"),
                //  ),
                //  onPressed: () {},
                //), */
