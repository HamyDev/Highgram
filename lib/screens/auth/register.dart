import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:highgram/models/constants.dart';
import 'package:highgram/screens/auth/login.dart';
import 'package:highgram/screens/main/home.dart';
import 'package:highgram/services/auth.service.dart';
import 'package:highgram/services/database.service.dart';

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
  String _password = "";
  String _email;
  String _affilateCode = "";
  String _username = "";
  String _id;

  Future isUsernameAvailable(String username) async {
    return await _databaseMethods.CheckIfUsernameIsAvailable(username);
  }

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
              //App
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Column(
                    children: [
                      // Image
                      Container(
                        width: 76,
                        height: 76,
                        child: Image.asset("assets/images/HighGramRound.png"),
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
              //username Input
              Container(
                padding:
                    EdgeInsets.only(top: 20, bottom: 0, left: 30, right: 30),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.yellow,
                  decoration: InputDecoration(
                    labelText: 'Enter a username',
                    labelStyle:
                        TextStyle(color: Colors.grey.shade600, fontSize: 14),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    contentPadding: EdgeInsets.all(0),
                  ),
                  onChanged: (val) {
                    setState(() => {
                          _username = val,
                          _id = val.contains(" ")
                              ? val.replaceAll(" ", "_").toLowerCase()
                              : val.toLowerCase()
                        });
                  },
                ),
              ),

              //Email Input
              Container(
                padding:
                    EdgeInsets.only(top: 20, bottom: 0, left: 30, right: 30),
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
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      labelText: 'Create a password',
                      labelStyle:
                          TextStyle(color: Colors.grey.shade600, fontSize: 14),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      contentPadding: EdgeInsets.all(0)),
                ),
              ),

              //validator
              Container(
                padding: EdgeInsets.only(right: 90, top: 20),
                child: RichText(
                    text: TextSpan(children: [
                  WidgetSpan(
                    child: Icon(
                        RegExp("^.{8,16}").hasMatch(_password)
                            ? Icons.check
                            : FontAwesome.times,
                        size: 14,
                        color: Colors.white),
                  ),
                  TextSpan(
                      text: " Password must be 8 to 16 characters \n",
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 10,
                          fontFamily: "Raleway")),
                  WidgetSpan(
                    child: Icon(
                        RegExp("(?:[^a-z]*[A-Z])").hasMatch(_password)
                            ? Icons.check
                            : FontAwesome.times,
                        size: 14,
                        color: Colors.white),
                  ),
                  TextSpan(
                      text: " Includes upper and lower case characters \n",
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 10,
                          fontFamily: "Raleway")),
                  WidgetSpan(
                    child: Icon(
                        //isNumeric(_password.toString())
                        RegExp(".*[0-9].*").hasMatch(_password)
                            ? Icons.check
                            : FontAwesome.times,
                        size: 14,
                        color: Colors.white),
                  ),
                  TextSpan(
                      text: " Includes one number",
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 10,
                          fontFamily: "Raleway")),
                ])),
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
                      labelStyle:
                          TextStyle(color: Colors.grey.shade600, fontSize: 14),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
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
                      if (!await _databaseMethods.CheckIfUsernameIsAvailable(
                          _username)) {
                        return ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                      "The username given is unavailable."),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                      if (!await _databaseMethods
                          .checkifAffiliateIsValid(_affilateCode)) {
                        return ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                      "The given affiliate code is invalid."),
                                )
                              ],
                            ),
                          ),
                        );
                      }

                      dynamic result = await _auth.registerWithEmailAndPassword(
                          _email, _password, _affilateCode, _username, _id);
                      print("$result - RESULT");
                      if (result == "ERROR_EMAIL_ALREADY_IN_USE") {
                        return ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Expanded(
                                  child: Text("The email is already in use."),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                      if (result == "ERROR_INVALID_EMAIL") {
                        return ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Expanded(
                                  child: Text("Invalid email format."),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                      if (result == "ERROR_WEAK_PASSWORD") {
                        return ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Expanded(
                                  child: Text("The password is too weak."),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                      if (result != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ));
                      } else {
                        return ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                      "Please verify that all fields have been filled out correctly or try again later."),
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

              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(children: <Widget>[
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 130.0, right: 10.0),
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
                        margin: const EdgeInsets.only(left: 10.0, right: 130.0),
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
                              child: Image.asset("assets/images/google.png"),
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
                      text: "Already have an Account? ",
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
            ],
          ),
        ),
      ),
    );
  }
}
