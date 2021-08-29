import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:highgram/models/constants.dart';
import 'package:highgram/screens/auth/login.dart';
import 'package:highgram/screens/main/other/sub/personalSettings.dart';
import 'package:highgram/services/auth.service.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AuthService _auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Container(
          padding: EdgeInsets.only(right: 60),
          child: Center(
              child: Image.asset(
            'assets/images/mcdonalds.png',
            width: 35,
            height: 35,
          )),
        ),
        leading: Container(
          width: 30,
          height: 30,
          margin: EdgeInsets.only(right: 20),
          child: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 35),
              child: Center(
                child: Text(
                  "${Constants.myName}",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ),
            Container(
              child: Divider(
                height: 0,
                thickness: 1,
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 25, bottom: 25),
              height: 100,
              child: MaterialButton(
                minWidth: 60,
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        FontAwesome.user_o,
                        color: Colors.grey[500],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Personal Settings",
                        style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 17,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 145),
                      child: Transform.scale(
                        scale: 0.6,
                        child: Icon(Icons.arrow_forward_ios,
                            color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PersonalSettings()));
                },
              ),
            ),
            Container(
              child: Divider(
                height: 0,
                thickness: 1,
              ),
            ),
            Container(
              height: 100,
              child: MaterialButton(
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        FontAwesome.lock,
                        color: Colors.grey[500],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Privacy Settings",
                        style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 155),
                      child: Transform.scale(
                        scale: 0.6,
                        child: Icon(Icons.arrow_forward_ios,
                            color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
            Container(
              child: Divider(
                height: 0,
                thickness: 1,
              ),
            ),
            Container(
              height: 100,
              child: MaterialButton(
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        FontAwesome.credit_card,
                        color: Colors.grey[500],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Payment Methods",
                        style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 135),
                      child: Transform.scale(
                        scale: 0.6,
                        child: Icon(Icons.arrow_forward_ios,
                            color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
            //Communications
            Container(
              child: Divider(
                height: 0,
                thickness: 1,
              ),
            ),
            Container(
              height: 100,
              child: MaterialButton(
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        FontAwesome.comment_o,
                        color: Colors.grey[500],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Communications",
                        style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 145),
                      child: Transform.scale(
                        scale: 0.6,
                        child: Icon(Icons.arrow_forward_ios,
                            color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
            //Log out
            Container(
              child: Divider(
                height: 0,
                thickness: 1,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFad0b00), Color(0xFFfc5347)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.85,
                child: Text(
                  "Log Out",
                  style: TextStyle(
                    fontFamily: "Raleway",
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _auth.logout();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
