import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highgram/models/constants.dart';
import 'package:highgram/screens/auth/register.dart';
import 'package:highgram/services/auth.service.dart';
import 'package:highgram/services/database.service.dart';
import 'package:highgram/services/helper/helper.functions.dart';

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
        decoration: BoxDecoration(
          color: Color(0xFF090E45),
          //image: DecorationImage(
          //  image: AssetImage("assets/images/background.png"),
          //  fit: BoxFit.cover,
          //),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: const FractionalOffset(0.5, 1),
            colors: [
              Color(0xFF090E45),
              Color(0xFF090A11),
            ],
          ),
        ),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  //App
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 100),
                      child: Column(
                        children: [
                          // Image
                          Container(
                            width: 76,
                            height: 76,
                            child:
                                Image.asset("assets/images/HighGramRound.png"),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 24),
                            child: Text(
                              "Sign In to Highgram",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "TTCommon"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Email Input
                  Container(
                    margin: EdgeInsets.only(top: 55),
                    padding: EdgeInsets.only(
                        top: 20, bottom: 0, left: 30, right: 30),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.yellow,
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
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.yellow,
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

                  //Login Button
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 28,
                        //bottom: MediaQuery.of(context).size.height - 562,
                      ),
                      width: 270,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFF5FD0FF), Color(0xFF2880FF)]),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: MaterialButton(
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "TTCommon",
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);

                            _databaseMethods
                                .getUserbyUserEmail(_email)
                                .then((val) => {
                                      snapshotUserInfo = val,
                                    });
                            // HelperFunctions.saveUserNameSharedPreference(username);
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(_email, _password);
                            HelperFunctions.saveUserLoggedInSharedPreference(
                                true);
                            if (result == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                            "Please double check the input fields."),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              setState(() => loading = false);
                              Navigator.pop(context);
                            }
                          }
                        },
                      ),
                    ),
                  ),

                  //Or
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(children: <Widget>[
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 130.0, right: 10.0),
                            child: Divider(
                              color: Colors.grey[500],
                              height: 36,
                            )),
                      ),
                      Text(
                        "or",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontFamily: "TTCommon",
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 130.0),
                            child: Divider(
                              color: Colors.grey[500],
                              height: 36,
                            )),
                      ),
                    ]),
                  ),

                  //google sign up button
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      width: 270,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF141A57),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: MaterialButton(
                        elevation: 1,
                        child: Row(
                          children: [
                            Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                color: Color(0xFF222761),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Center(
                                child: Container(
                                  width: 20,
                                  child:
                                      Image.asset("assets/images/google.png"),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 29),
                              child: Text(
                                "Continue with Google",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          dynamic result = _auth.loginGoogle();
                          print("$result result");
                          if (result == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  children: [
                                    Expanded(
                                      child: Text("Please try again later."),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),

                  //Dont have an account, sign up.
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 20, top: 60, right: 20, bottom: 85.5),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "Don't have an Account? ",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontFamily: "TTCommon",
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Register(),
                                      ),
                                    )
                                  },
                            text: "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "TTCommon",
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            )),
                      ])),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

/*
Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03),
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
                  ) */
