import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:highgram/models/constants.dart';
import 'package:highgram/screens/auth/login.dart';
import 'package:highgram/screens/main/Mainwrapper.dart';
import 'package:highgram/services/auth.service.dart';
import 'package:highgram/services/database.service.dart';
import 'package:highgram/services/helper/helper.functions.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final DatabaseMethods _databaseMethods = DatabaseMethods();
  final AuthService _auth = AuthService();
  bool _obscureText = true;
  bool loading;

  String error;
  String _password;
  String _email;
  String _affilateCode;

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Wrap(children: [
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
                              "Sign Up to Highgram",
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
                          labelText: 'Create a password',
                          labelStyle: TextStyle(color: Colors.grey.shade600),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          contentPadding: EdgeInsets.all(0)),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.yellow,
                      onChanged: (val) {
                        setState(() => _affilateCode = val);
                      },
                      decoration: InputDecoration(
                          labelText: 'Affilate Code (Optional)',
                          labelStyle: TextStyle(color: Colors.grey.shade600),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
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
                          Map<String, String> userInfoMap;
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(_email, _password)
                              .then((val) => {
                                    Map,
                                    userInfoMap = {
                                      "email": _email,
                                      "password": _password
                                    },
                                    HelperFunctions
                                        .saveUserEmailSharedPreference(_email),
                                    _databaseMethods
                                        .uploadUserInfo(userInfoMap),
                                    HelperFunctions
                                        .saveUserLoggedInSharedPreference(true)
                                  });
                          if (result.toString().contains(
                              "{email: $_email, password: $_password}")) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MainWrapper()));
                          }
                        },
                      ),
                    ),
                  ),

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
                        top: 0,
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
                          left: 20, top: 50, right: 20, bottom: 92.5),
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
                                        builder: (context) => Login(),
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
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
