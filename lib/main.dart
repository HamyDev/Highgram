import 'package:flutter/material.dart';
import 'wrapper.dart';
import 'package:provider/provider.dart';
import './services/auth.service.dart';
import 'models/models/user.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        home: AnimatedSplashScreen(
          splash: Container(
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    width: 128,
                    height: 128,
                    child: Image.asset('assets/images/HighGramRound.png'),
                  ),
                ),
                Text(
                  "Highgram",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 250,
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    "Prove yourself worth of first place on the leaderboards.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          backgroundColor: Color(0xFF090e45),
          duration: 1000,
          curve: Curves.fastLinearToSlowEaseIn,
          pageTransitionType: PageTransitionType.rightToLeft,
          splashTransition: SplashTransition.slideTransition,
          nextScreen: Wrapper(),
        ),
      ),
    );
  }
}
