import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Collect extends StatefulWidget {
  @override
  _CollectState createState() => _CollectState();
}

class _CollectState extends State<Collect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Wrap(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
          child: Text("Choose how to collect",
              style: GoogleFonts.lato(fontSize: 28)),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
              "Collect your order contact-free at a restaurant or head straight to Drive-thru with your code.",
              style: GoogleFonts.lato(fontSize: 17),
              textAlign: TextAlign.center),
        ),
      ])),
    );
  }
}
