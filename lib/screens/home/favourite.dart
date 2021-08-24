import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favourite extends StatefulWidget {

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Wrap(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              child: Text("Save your faves", 
                style: GoogleFonts.lato(fontSize: 28)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 13),
              child: Text("Regular group order? Big Mac as your go-to? Make it quicker by adding any items to your faves.",
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