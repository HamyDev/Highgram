import 'package:flutter/material.dart';

var emailInputDecoration = InputDecoration(
    labelText: 'Email',
    labelStyle: TextStyle(color: Colors.grey.shade600),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400)),
    contentPadding: EdgeInsets.all(0));

class Constants {
  static String myName = "";
  static String email = "";
  static String postCode = "";
}
