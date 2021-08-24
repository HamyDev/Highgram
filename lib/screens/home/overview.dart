import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Overview extends StatefulWidget {

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Wrap(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
              child: Text("Ready when you are", 
                style: GoogleFonts.lato(fontSize: 28)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Text("Place your order and we'll start preparing your food as you arrive.",
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