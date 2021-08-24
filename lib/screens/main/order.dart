import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  bool delivery = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 180,
        leadingWidth: 1,
        elevation: 5,
        title: Container(
          child: Column(
            children: [
              Row(children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 10, bottom: 50),
                  child: Text(
                    "Order",
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        textStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10, top: 10),
                  padding: EdgeInsets.only(left: 230, bottom: 50),
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ]),
              //Delivery button

              //Location
              Container(
                padding: EdgeInsets.only(right: 0),
                child: Wrap(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      child: Image.asset('assets/images/waypoint.png'),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, bottom: 15),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Your Location \n",
                              style: TextStyle(
                                  //fontFamily: "Raleway",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            TextSpan(
                              text: "Now serving Lunch & Dinner",
                              style: TextStyle(
                                  fontFamily: "Raleway",
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500]),
                            ),
                            TextSpan(text: "              "),
                            TextSpan(
                              text: "Change Location",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue.shade700,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
