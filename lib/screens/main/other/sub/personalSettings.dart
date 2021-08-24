import 'package:flutter/material.dart';
import 'package:highgram/models/constants.dart';

class PersonalSettings extends StatefulWidget {
  @override
  _PersonalSettingsState createState() => _PersonalSettingsState();
}

class _PersonalSettingsState extends State<PersonalSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
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
            //Title
            Container(
              margin: EdgeInsets.only(left: 0, top: 20, right: 130),
              child: Text(
                "Personal Settings",
                style: TextStyle(
                    fontFamily: "Raleway",
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Divider(
                height: 0,
                thickness: 1,
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 130, top: 20, bottom: 20),
              child: Wrap(
                children: [
                  Container(
                    width: 200,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Name \n",
                            style: TextStyle(
                                //fontFamily: "Raleway",
                                fontSize: 13,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: "${Constants.myName}",
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Divider(
                height: 0,
                thickness: 1,
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 130, top: 20, bottom: 20),
              child: Wrap(
                children: [
                  Container(
                    width: 200,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Email \n",
                            style: TextStyle(
                                //fontFamily: "Raleway",
                                fontSize: 13,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: "${Constants.email}",
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
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
