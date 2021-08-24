import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highgram/models/constants.dart';
import 'package:highgram/services/auth.service.dart';
import 'package:highgram/services/database.service.dart';
import 'package:highgram/services/helper/helper.functions.dart';
import 'package:highgram/screens/main/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final DatabaseMethods _databaseMethods = new DatabaseMethods();
  bool _obscureText = true;
  bool loading;
  QuerySnapshot snapshotUserInfo;

  String error;
  String _password;
  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  //Email Input
                  Container(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 30, right: 30),
                    child: TextFormField(
                      cursorColor: Colors.red.shade900,
                      decoration: emailInputDecoration,
                      onChanged: (val) {
                        setState(() => _email = val);
                      },
                    ),
                  ),

                  //Password Input
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                    child: TextFormField(
                      cursorColor: Colors.red.shade900,
                      obscureText: _obscureText,
                      onChanged: (val) {
                        setState(() => _password = val);
                      },
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Icon(
                                FontAwesome.eye,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.grey.shade600),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          contentPadding: EdgeInsets.all(0)),
                    ),
                  ),

                  //Forgot Password
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Forgot Password?",
                          style: TextStyle(
                              color: Colors.blue.shade800,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("Forgot Password pressed");
                            })
                    ])),
                  ),

                  //facebook sign up button
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.5 - 177,
                        bottom: 10,
                        top: 40),
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
                                child:
                                    Image.asset("assets/images/facebook.png")),
                            Container(
                                margin: EdgeInsets.only(
                                    top: 7, left: 20, right: 105),
                                child: Text("Sign in with Facebook",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                child: Image.asset("assets/images/google.png")),
                            Container(
                                margin: EdgeInsets.only(
                                    top: 9, left: 20, right: 115),
                                child: Text("Sign in with Google",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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

                  //TOS agreement
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "By logging in, I agree with McDonald's \n",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 13)),
                      TextSpan(
                        text: "Terms & Conditions",
                        style: TextStyle(
                            color: Colors.blue.shade800,
                            decoration: TextDecoration.underline,
                            fontSize: 13),
                      ),
                      TextSpan(
                        text: " ",
                      ),
                      TextSpan(
                        text: "Privacy Statement.",
                        style: TextStyle(
                            color: Colors.blue.shade800,
                            decoration: TextDecoration.underline,
                            fontSize: 13),
                      ),
                    ])),
                  ),

                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1 - 29),
                    child: MaterialButton(
                      elevation: 0,
                      height: 65,
                      minWidth: 400,
                      color: Color(0xFFFFC917),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);

                          _databaseMethods
                              .getUserbyUserEmail(_email)
                              .then((val) => {
                                    snapshotUserInfo = val,
                                    HelperFunctions
                                        .saveUserNameSharedPreference(
                                            snapshotUserInfo
                                                .documents[0].data["firstName"],
                                            snapshotUserInfo
                                                .documents[0].data["lastName"]),
                                    //print("${snapshotUserInfo.documents[0].data["name"]} this doesnt seem good...")
                                  });
                          // HelperFunctions.saveUserNameSharedPreference(username);
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(_email, _password);
                          HelperFunctions.saveUserLoggedInSharedPreference(
                              true);
                          if (result == null) {
                            setState(() {
                              error = 'Invalid email or password';
                              loading = false;
                            });
                          } else {
                            setState(() => loading = false);
                            Navigator.pop(context);
                          }
                        }
                      },
                      textColor: Colors.black,
                      child: Text(
                        "Log In",
                        style: TextStyle(fontSize: 18, fontFamily: "Raleway"),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
