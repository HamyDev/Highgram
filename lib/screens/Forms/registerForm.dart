import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:highgram/screens/main/Mainwrapper.dart';
import 'package:highgram/services/auth.service.dart';
import 'package:highgram/services/database.service.dart';
import 'package:highgram/services/helper/helper.functions.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final DatabaseMethods _databaseMethods = DatabaseMethods();
  final AuthService _auth = AuthService();
  bool _obscureText = true;

  String _password = "";
  String _confirmingPassword;
  String _email;
  String _postcode;

  String _firstName;
  String _lastName;

  String usrerror = "";

  bool recieveEmails = false;
  bool agreementToDriving = false;
  bool agreementToTOS = false;

  String ukPostCodeValidaorRegEx =
      "^([A-Za-z][A-Ha-hJ-Yj-y]?[0-9][A-Za-z0-9]? ?[0-9][A-Za-z]{2}|[Gg][Ii][Rr] ?0[Aa]{2})";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
          child: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                Column(children: [
                  //Title
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 50),
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  //required fields
                  Container(
                    padding: EdgeInsets.only(left: 30, top: 5),
                    child: Text(
                      "*Indicates required field",
                      style: TextStyle(fontFamily: "Raleway", fontSize: 13),
                    ),
                  ),
                ]),

                //Firt name Input
                Container(
                  padding: EdgeInsets.only(top: 40, left: 30, right: 30),
                  child: TextFormField(
                    cursorColor: Colors.red.shade900,
                    validator: (val) {
                      if (val.isEmpty) {
                        setState(() => usrerror = "First name field empty");
                        return;
                      }
                      return;
                    },
                    decoration: InputDecoration(
                        labelText: '*First name',
                        labelStyle: TextStyle(color: Colors.grey.shade600),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400)),
                        contentPadding: EdgeInsets.all(0)),
                    onChanged: (val) {
                      setState(() => _firstName = val);
                    },
                  ),
                ),

                //Last name Input
                Container(
                  padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: TextFormField(
                    cursorColor: Colors.red.shade900,
                    validator: (val) {
                      if (val.isEmpty) {
                        setState(() => usrerror = "Last name field empty");
                        return;
                      }
                      return;
                    },
                    decoration: InputDecoration(
                        labelText: '*Last name',
                        labelStyle: TextStyle(color: Colors.grey.shade600),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400)),
                        contentPadding: EdgeInsets.all(0)),
                    onChanged: (val) {
                      setState(() => _lastName = val);
                    },
                  ),
                ),

                //Email Input
                Container(
                  padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: TextFormField(
                    cursorColor: Colors.red.shade900,
                    validator: (String val) {
                      if (val.isEmpty) {
                        setState(() => usrerror = "Email field empty");
                        return "Email field empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: '*Email',
                        labelStyle: TextStyle(color: Colors.grey.shade600),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400)),
                        contentPadding: EdgeInsets.all(0)),
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
                        labelText: '*Password',
                        labelStyle: TextStyle(color: Colors.grey.shade600),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400)),
                        contentPadding: EdgeInsets.all(0)),
                    onChanged: (val) {
                      setState(() => _password = val);
                    },
                  ),
                ),

                //password checker
                Column(children: [
                  //Title
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                    child: Text(
                      "Please ensure you use a unique password and change it frequently",
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  //validator
                  Container(
                    padding: EdgeInsets.only(right: 110),
                    child: RichText(
                        text: TextSpan(children: [
                      WidgetSpan(
                        child: Icon(
                            RegExp("^.{8,16}").hasMatch(_password)
                                ? Icons.check
                                : FontAwesome.times,
                            size: 14),
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
                                //isUppercase(_password.toString())
                                ? Icons.check
                                : FontAwesome.times,
                            size: 14),
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
                            size: 14),
                      ),
                      TextSpan(
                          text: " Includes one number",
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 10,
                              fontFamily: "Raleway")),
                    ])),
                  ),
                ]),

                //Confirm password
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: TextFormField(
                    cursorColor: Colors.red.shade900,
                    obscureText: _obscureText,
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
                        labelText: '*Confirm Password',
                        labelStyle: TextStyle(color: Colors.grey.shade600),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400)),
                        contentPadding: EdgeInsets.all(0)),
                    onChanged: (val) {
                      setState(() => _confirmingPassword = val);
                    },
                  ),
                ),

                //Postcode
                Container(
                  padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: TextFormField(
                    cursorColor: Colors.red.shade900,
                    decoration: InputDecoration(
                        labelText: 'Postcode (incl. space)',
                        labelStyle: TextStyle(color: Colors.grey.shade600),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400)),
                        contentPadding: EdgeInsets.all(0)),
                    onChanged: (val) {
                      setState(() => _postcode = val);
                    },
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 5, left: 30, right: 30),
                    child: Text(
                        "Providing your postcode helps us find the nearest McDonald's to you.",
                        style: TextStyle(fontSize: 10, fontFamily: "Raleway"))),

                //Preferences
                Container(
                  margin: EdgeInsets.only(left: 30, top: 50, bottom: 30),
                  child: Text(
                    "Preference",
                    style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                Container(
                  height: 300,
                  color: Colors.grey.shade100,
                  child: Column(
                    children: [
                      CheckboxListTile(
                        title: Text(
                          "I would like to receive news and offers from McDonald's by e-mail and I confirm I am 18 years or older.",
                          style: TextStyle(fontFamily: "Raleway", fontSize: 13),
                        ),
                        value: recieveEmails,
                        activeColor: Color(0xFFFFC917),
                        onChanged: (newValue) {
                          setState(() {
                            recieveEmails = newValue;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),

                      //TOS
                      Container(
                        padding:
                            EdgeInsets.only(right: 200, top: 20, bottom: 20),
                        child: Text(
                          "Terms & Conditions",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      CheckboxListTile(
                        title: Text(
                          "*I agree not to use the app whilst driving",
                          style: TextStyle(fontFamily: "Raleway", fontSize: 13),
                        ),
                        value: agreementToDriving,
                        activeColor: Color(0xFFFFC917),
                        onChanged: (newValue) {
                          setState(() {
                            agreementToDriving = newValue;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),

                      CheckboxListTile(
                        title: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "*I agree with McDonald's  ",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.grey.shade700)),
                          TextSpan(
                            text: "Terms & Conditions.",
                            style: TextStyle(
                                color: Colors.blue.shade800,
                                decoration: TextDecoration.underline,
                                fontSize: 13),
                          ),
                        ])),
                        value: agreementToTOS,
                        activeColor: Color(0xFFFFC917),
                        onChanged: (newValue) {
                          setState(() {
                            agreementToTOS = newValue;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),

                      Container(
                        padding: EdgeInsets.only(right: 30, top: 10, left: 30),
                        child: Column(children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text:
                                    "By siging up, I acknowledge I have read McDonald's ",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.grey.shade700)),
                            TextSpan(
                              text: "Privacy Statement.",
                              style: TextStyle(
                                  color: Colors.blue.shade800,
                                  decoration: TextDecoration.underline,
                                  fontSize: 13),
                            ),
                          ])),
                          //if theres an error then it will show here
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: 17,
                                  maxWidth: 300,
                                ),
                                child: Text(
                                  "${usrerror.toString()}",
                                  style: TextStyle(
                                      color: Colors.red.shade600,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 0),
                  child: MaterialButton(
                    elevation: 0,
                    height: 65,
                    minWidth: 400,
                    color: Color(0xFFFFC917),
                    onPressed: () async {
                      if (_firstName.toString().isEmpty ||
                          _lastName.toString().isEmpty) {
                        return setState(() => usrerror =
                            "${_firstName.toString().isEmpty ? "First name" : "Last name"} field is empty");
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(_email.toString())) {
                        return setState(
                            () => usrerror = "Email format is incorrect");
                      }
                      if (!RegExp(".*[0-9].*").hasMatch(_password) ||
                          !RegExp("(?:[^a-z]*[A-Z])").hasMatch(_password) ||
                          !RegExp("^.{8,16}").hasMatch(_password)) {
                        return setState(() => usrerror =
                            'Password does not pass our requirements');
                      }
                      if (_confirmingPassword != _password) {
                        return setState(
                            () => usrerror = "Passwords don't match");
                      }
                      if (_postcode.isNotEmpty) {
                        if (RegExp(ukPostCodeValidaorRegEx)
                            .hasMatch(_password)) {
                          return setState(
                              () => usrerror = "Postcode format is invalid");
                        }
                      }
                      if (!agreementToDriving || !agreementToTOS) {
                        return setState(
                            () => usrerror = "You must agree to the TOS");
                      }

                      Map<String, String> userInfoMap;
                      dynamic result = await _auth
                          .registerWithEmailAndPassword(_email, _password)
                          .then((val) => {
                                Map,
                                userInfoMap = {
                                  "name": "$_firstName $_lastName",
                                  "email": _email,
                                  "postcode": _postcode
                                },
                                HelperFunctions.saveUserEmailSharedPreference(
                                    _email),
                                if (_postcode.isNotEmpty)
                                  {
                                    HelperFunctions
                                        .saveUserPostCodeSharedPreference(
                                            _postcode.toUpperCase()),
                                  },
                                HelperFunctions.saveUserNameSharedPreference(
                                    _firstName, _lastName),
                                _databaseMethods.uploadUserInfo(userInfoMap),
                                HelperFunctions
                                    .saveUserLoggedInSharedPreference(true)
                              });
                      if (result.toString().contains(
                          "{name: $_firstName $_lastName, email: $_email, postcode: $_postcode}")) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MainWrapper()));
                      }
                    },
                    textColor: Colors.black,
                    child: Text(
                      "Create Account",
                      style: TextStyle(fontSize: 18, fontFamily: "Raleway"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
