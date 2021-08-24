import 'package:flutter/material.dart';
import 'package:highgram/screens/main/order.dart';
import 'package:highgram/services/auth.service.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:simple_icons/simple_icons.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _Spacer = Container(
    width: 5,
  );
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Wrap(
          children: [
            Container(
              height: 185,
              //width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.amber,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(3),
                      ),
                      color: Colors.amber),
                  margin: EdgeInsets.only(bottom: 25, left: 30),
                  width: 160,
                  height: 40,
                  child: Center(
                    child: Text(
                      "Order now",
                      style: TextStyle(
                          color: Colors.black,
                          //fontFamily: "Raleway",
                          fontSize: 13),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Divider(
                height: 0,
                thickness: 1,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, bottom: 30, right: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Text(
                      "Menu",
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.564),
                          child: Text(
                            "Full menu",
                            style: TextStyle(
                                color: Colors.blue.shade600,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                        ),
                        Icon(Icons.arrow_forward,
                            color: Colors.blue.shade600, size: 17)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 160.0,
                    color: Colors.red,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("Burgers"),
                    ),
                  ),
                  _Spacer,
                  Container(
                    width: 160.0,
                    color: Colors.blue,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("Fries & Sides"),
                    ),
                  ),
                  _Spacer,
                  Container(
                    width: 160.0,
                    color: Colors.green,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("McCafe® Hot Drinks"),
                    ),
                  ),
                  _Spacer,
                  Container(
                    width: 160.0,
                    color: Colors.yellow,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("McFlurry® /Ice Cream"),
                    ),
                  ),
                  _Spacer,
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Order()));
                    },
                    child: Container(
                      width: 160.0,
                      color: Colors.green,
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(left: 50),
                          child: Wrap(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      "Full menu",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    child: Icon(Icons.arrow_forward),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  _Spacer,
                ],
              ),
            ),
            //Container(
            //  height: 100,
            //  child: MaterialButton(
            //    child: Row(
            //      children: [
            //        Container(
            //          child: Icon(
            //            FontAwesome.lock,
            //            color: Colors.grey[500],
            //          ),
            //        ),
            //        Container(
            //          padding: EdgeInsets.only(left: 20),
            //          child: Text(
            //            "Privacy Settings",
            //            style: TextStyle(
            //              fontFamily: "Raleway",
            //              fontSize: 17,
            //              color: Colors.black,
            //            ),
            //          ),
            //        ),
            //        Container(
            //          padding: EdgeInsets.only(left: 155),
            //          child: Transform.scale(
            //            scale: 0.6,
            //            child: Icon(Icons.arrow_forward_ios,
            //                color: Colors.grey[700]),
            //          ),
            //        ),
            //      ],
            //    ),
            //    onPressed: () {},
            //  ),
            //),
            //Container(
            //  child: Divider(
            //    height: 0,
            //    thickness: 1,
            //  ),
            //),
            //Container(
            //  height: 100,
            //  child: MaterialButton(
            //    child: Row(
            //      children: [
            //        Container(
            //          child: Icon(
            //            FontAwesome.credit_card,
            //            color: Colors.grey[500],
            //          ),
            //        ),
            //        Container(
            //          padding: EdgeInsets.only(left: 20),
            //          child: Text(
            //            "Payment Methods",
            //            style: TextStyle(
            //              fontFamily: "Raleway",
            //              fontSize: 17,
            //              color: Colors.black,
            //            ),
            //          ),
            //        ),
            //        Container(
            //          padding: EdgeInsets.only(left: 135),
            //          child: Transform.scale(
            //            scale: 0.6,
            //            child: Icon(Icons.arrow_forward_ios,
            //                color: Colors.grey[700]),
            //          ),
            //        ),
            //      ],
            //    ),
            //    onPressed: () {},
            //  ),
            //),
            ////Communications
            //Container(
            //  child: Divider(
            //    height: 0,
            //    thickness: 1,
            //  ),
            //),
            //Container(
            //  height: 100,
            //  child: MaterialButton(
            //    child: Row(
            //      children: [
            //        Container(
            //          child: Icon(
            //            FontAwesome.comment_o,
            //            color: Colors.grey[500],
            //          ),
            //        ),
            //        Container(
            //          padding: EdgeInsets.only(left: 20),
            //          child: Text(
            //            "Communications",
            //            style: TextStyle(
            //              fontFamily: "Raleway",
            //              fontSize: 17,
            //              color: Colors.black,
            //            ),
            //          ),
            //        ),
            //        Container(
            //          padding: EdgeInsets.only(left: 145),
            //          child: Transform.scale(
            //            scale: 0.6,
            //            child: Icon(Icons.arrow_forward_ios,
            //                color: Colors.grey[700]),
            //          ),
            //        ),
            //      ],
            //    ),
            //    onPressed: () {},
            //  ),
            //),
            ////Log out
            //Container(
            //  child: Divider(
            //    height: 0,
            //    thickness: 1,
            //  ),
            //),
            //Container(
            //  margin: EdgeInsets.only(top: 20),
            //  decoration: BoxDecoration(
            //    gradient: LinearGradient(
            //      colors: [Color(0xFFad0b00), Color(0xFFfc5347)],
            //      begin: Alignment.bottomCenter,
            //      end: Alignment.topCenter,
            //    ),
            //  ),
            //  child: MaterialButton(
            //    minWidth: MediaQuery.of(context).size.width * 0.85,
            //    child: Text(
            //      "Log Out",
            //      style: TextStyle(
            //        fontFamily: "Raleway",
            //        fontSize: 17,
            //        color: Colors.white,
            //      ),
            //    ),
            //    onPressed: () {},
            //  ),
            //),
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