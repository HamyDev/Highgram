import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:highgram/models/constants.dart';
import 'package:highgram/services/auth.service.dart';

class AffiliateWithdraw extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<AffiliateWithdraw> {
  // ignore: unused_field
  final AuthService _auth = AuthService();

  String _email = "";
  String _PaypalUsername = "";
  String _amount = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
            //gradient: LinearGradient(
            //  begin: Alignment.topCenter,
            //  end: const FractionalOffset(0.5, 0.14),
            //  colors: [Color(0xFF1222ac), Color(0xFF090e45)],
            //),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 24.5,
                          right: MediaQuery.of(context).size.width / 2 - 85.5,
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
                          "Withdraw",
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
                Container(
                  margin: EdgeInsets.only(left: 16, top: 52),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Withdraw to Paypal",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 8, left: 16),
                  child: Text(
                    "We need your Paypal username, Email or Phone number",
                    style: TextStyle(
                      color: Color(0xFFCCCCCC),
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, top: 29),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Send Us your data",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 15, left: 16, bottom: 15),
                  child: Text(
                    "Paypal Username",
                    style: TextStyle(
                      color: Color(0xFFCCCCCC),
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 34, vertical: 13),
                  width: 343,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: Color(0xFF181d53),
                    ),
                    color: Color(0xFF12185f).withOpacity(0.12),
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.yellow,
                    decoration: PaypalInputDecoration,
                    onChanged: (val) {
                      setState(() => _PaypalUsername = val);
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 15, left: 16),
                  child: Text(
                    "Email or Phone Number",
                    style: TextStyle(
                      color: Color(0xFFCCCCCC),
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 41, top: 15),
                  padding: EdgeInsets.symmetric(horizontal: 34, vertical: 13),
                  width: 343,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: Color(0xFF181d53),
                    ),
                    color: Color(0xFF12185f).withOpacity(0.12),
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.yellow,
                    decoration: emailInputDecoration,
                    onChanged: (val) {
                      setState(() => _email = val);
                    },
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 41, bottom: 15),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Amount",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 21, left: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 34, vertical: 13),
                      width: 330,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: Color(0xFF181d53),
                        ),
                        color: Color(0xFF12185f).withOpacity(0.12),
                      ),
                      child: TextFormField(
                        enabled: true,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.yellow,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Enter amount what you want to withdraw',
                          labelStyle: TextStyle(
                              color: Colors.grey.shade600, fontSize: 12),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          contentPadding: EdgeInsets.all(0),
                        ),
                        onChanged: (val) {
                          setState(() => _amount = val);
                        },
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 18),
                        width: 163,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF5FD0FF),
                              Color(0xFF2880FF),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "Withdraw",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      onTap: () {
                        if (_email.toString().isEmpty ||
                            _amount.toString().isEmpty ||
                            _PaypalUsername.toString().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  Expanded(
                                    child: Text("Missing fields."),
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  Expanded(
                                    child: Text("Withdrawing \$$_amount"),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "If you have any additional questions write an E-mail to \n",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontFamily: "TTCommon",
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          TextSpan(
                            text: "contact.teimceperstudio@gmail.com",
                            style: TextStyle(
                              color: Colors.blue.shade400,
                              fontFamily: "TTCommon",
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 2 - 133,
                          top: 15,
                          bottom: MediaQuery.of(context).size.height / 9 + 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info,
                            size: 18,
                            color: Colors.white.withOpacity(0.12),
                          ),
                          Text(
                            " Note : This proccess can take up to one week",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontFamily: "TTCommon",
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
