import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:highgram/services/auth.service.dart';

class Categories extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<Categories> {
  // ignore: unused_field
  final AuthService _auth = AuthService();
  @override
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
                        right: MediaQuery.of(context).size.width / 2 - 95.5,
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
                        "Categories",
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
                    margin: EdgeInsets.only(top: 18),
                    width: 343,
                    height: 79,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF111455),
                    ),
                    child: Image.asset("assets/images/Brands.png"),
                  ),
                  Positioned(
                    top: 8,
                    child: Container(
                      margin: EdgeInsets.only(top: 18),
                      padding: EdgeInsets.only(top: 22, left: 10),
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(69),
                        color: Color(0xFF090E45),
                      ),
                      child: Text(
                        "Brands",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 10 - 15),
                child: Row(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 18),
                          width: 161,
                          height: 122,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF111455),
                          ),
                          child: Image.asset("assets/images/Memes.png"),
                        ),
                        Positioned(
                          top: 43,
                          child: Image.asset("assets/images/Laugh.png"),
                        ),
                        Positioned(
                          top: 104,
                          child: Text(
                            "Memes",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: "TTCommon",
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
                          margin: EdgeInsets.only(top: 18, left: 22),
                          width: 161,
                          height: 122,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF111455),
                          ),
                          child: Image.asset("assets/images/Fashion.png"),
                        ),
                        Positioned(
                          top: 43,
                          left: 135 / 2 + 10,
                          child: Image.asset("assets/images/Sunglasses.png"),
                        ),
                        Positioned(
                          top: 104,
                          left: 95 / 2 + 10,
                          child: Text(
                            "Fashion & Style",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: "TTCommon",
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 10 - 15),
                child: Row(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 18),
                          width: 161,
                          height: 122,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF111455),
                          ),
                          child: Image.asset("assets/images/Model.png"),
                        ),
                        Positioned(
                          top: 43,
                          child: Image.asset("assets/images/PamelaHat.png"),
                        ),
                        Positioned(
                          top: 104,
                          child: Text(
                            "Model",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: "TTCommon",
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
                          margin: EdgeInsets.only(top: 23, left: 22),
                          width: 161,
                          height: 122,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF111455),
                          ),
                          child: Image.asset("assets/images/QuotesandText.png"),
                        ),
                        Positioned(
                          top: 43,
                          left: 135 / 2 + 10,
                          child: Image.asset("assets/images/Quotation.png"),
                        ),
                        Positioned(
                          top: 104,
                          left: 95 / 2 + 10,
                          child: Text(
                            "Quotes & Texts",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: "TTCommon",
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 46),
                    width: 343,
                    height: 79,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF111455),
                    ),
                    child: Image.asset("assets/images/Animals.png"),
                  ),
                  Positioned(
                    top: 8,
                    child: Container(
                      margin: EdgeInsets.only(top: 46),
                      padding: EdgeInsets.only(top: 22, left: 6),
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(69),
                        color: Color(0xFF090E45),
                      ),
                      child: Text(
                        "Animals",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 10 - 15),
                child: Row(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 29),
                          width: 161,
                          height: 122,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF111455),
                          ),
                          child: Image.asset("assets/images/Influencers.png"),
                        ),
                        Positioned(
                          top: 43,
                          child: Image.asset("assets/images/Trending.png"),
                        ),
                        Positioned(
                          top: 104,
                          child: Text(
                            "Influencers",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: "TTCommon",
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
                          margin: EdgeInsets.only(top: 23, left: 22),
                          width: 161,
                          height: 122,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF111455),
                          ),
                          child: Image.asset("assets/images/Gaming.png"),
                        ),
                        Positioned(
                          top: 43,
                          left: 135 / 2 + 10,
                          child: Image.asset("assets/images/Gamepad.png"),
                        ),
                        Positioned(
                          top: 104,
                          left: 140 / 2 + 10,
                          child: Text(
                            "Gaming",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: "TTCommon",
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
