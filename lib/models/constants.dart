import 'package:flutter/material.dart';

var emailInputDecoration = InputDecoration(
  labelText: 'Enter your email or phone number here',
  labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
  enabledBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
  focusedBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
  contentPadding: EdgeInsets.all(0),
);

var PaypalInputDecoration = InputDecoration(
  labelText: 'Enter your Paypal username here',
  labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
  enabledBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
  focusedBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
  contentPadding: EdgeInsets.all(0),
);

class Constants {
  static String myName = "";
  static String email = "";
}
