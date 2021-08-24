import 'package:flutter/material.dart';
import 'package:highgram/models/constants.dart';
import 'package:highgram/screens/main/other/profile.dart';
import 'package:highgram/services/auth.service.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:highgram/services/helper/helper.functions.dart';

class More extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<More> {
  final AuthService _auth = AuthService();
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  Future getUserInfo() async {
    Constants.email = await HelperFunctions.getUserEmailSharedPreference();
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    Constants.postCode =
        await HelperFunctions.getUserPostCodeSharedPreference();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 25, bottom: 25),
              child: MaterialButton(
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
                        "Profile",
                        style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 240),
                      child: Transform.scale(
                        scale: 0.6,
                        child: Icon(Icons.arrow_forward_ios,
                            color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Profile()));
                },
              ),
            ),
            Container(
              child: Divider(
                height: 0,
                thickness: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
