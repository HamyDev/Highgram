import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Gerkins extends StatefulWidget {

  @override
  _GerkinsState createState() => _GerkinsState();
}

class _GerkinsState extends State<Gerkins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Wrap(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
              child: Text("Gerkin or gerkout", 
                style: GoogleFonts.lato(fontSize: 28)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 22),
              child: Text("More cheese? Less pickle? Just top the cutomise button to make your dream order.",
                style: GoogleFonts.lato(fontSize: 17),
                textAlign: TextAlign.center
              ),
            ),
          ]
        )
      ),
    );
  }
}