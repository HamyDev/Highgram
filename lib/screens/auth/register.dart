import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highgram/screens/Forms/registerForm.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Wrap(children: [
                    Container(
                      padding: EdgeInsets.only(left: 17, right: 17, top: 20),
                      child: Text(
                          "Register to place orders, save your favoutite restaurants or meals, have accoess to deals and so much more..",
                          style: GoogleFonts.openSans(fontSize: 13)),
                    ),

                    //Register Button
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.5 - 177),
                      padding: EdgeInsets.only(top: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.grey.shade600),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: MaterialButton(
                          minWidth: 353,
                          height: 60,
                          child: Wrap(
                            children: [
                              Icon(FontAwesome.envelope_o, color: Colors.black),
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 5, left: 20, right: 190),
                                  child: Text(
                                    "Register",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegisterForm()));
                          },
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(children: <Widget>[
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 130.0, right: 10.0),
                              child: Divider(
                                color: Colors.grey[400],
                                height: 36,
                              )),
                        ),
                        Text("or"),
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 130.0),
                              child: Divider(
                                color: Colors.grey[400],
                                height: 36,
                              )),
                        ),
                      ]),
                    ),

                    //facebook sign up button
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.5 - 177,
                          bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.grey.shade600),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: MaterialButton(
                          minWidth: 353,
                          height: 60,
                          child: Wrap(
                            children: [
                              Container(
                                  width: 25,
                                  margin: EdgeInsets.only(top: 3),
                                  child: Image.asset(
                                      "assets/images/facebook.png")),
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 7, left: 20, right: 105),
                                  child: Text("Sign up with Facebook",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center)),
                              Container(
                                  margin: EdgeInsets.only(top: 2),
                                  child: Icon(Icons.arrow_forward_ios))
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),

                    //google sign up button
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.5 - 177,
                          top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.grey.shade600),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: MaterialButton(
                          minWidth: 353,
                          height: 60,
                          child: Wrap(
                            children: [
                              Container(
                                  width: 25,
                                  margin: EdgeInsets.only(top: 5),
                                  child:
                                      Image.asset("assets/images/google.png")),
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 9, left: 20, right: 115),
                                  child: Text("Sign up with Google",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center)),
                              Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Icon(Icons.arrow_forward_ios))
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
