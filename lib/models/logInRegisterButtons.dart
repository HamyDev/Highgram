import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highgram/screens/auth/connector.dart';

class LogInRegisterButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      //margin: EdgeInsets.only(top: 500),
      child: Wrap(
        children: [
          //Register button
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFEBB811), Color(0xFFFFC917)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: MaterialButton(
              elevation: 5,
              //color: new Color(0xFFFFC917),
              height: 65,
              minWidth: MediaQuery.of(context).size.width * 0.5, //196,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Connector(1)));
              },
              textColor: Colors.black,
              child:
                  Text("Register", style: GoogleFonts.openSans(fontSize: 18)),
            ),
          ),

          MaterialButton(
            elevation: 0,
            height: 65,
            minWidth: MediaQuery.of(context).size.width * 0.5,
            color: Colors.white,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Connector(0)));
            },
            textColor: Colors.black,
            child: Text(
              "Log In",
              style: GoogleFonts.openSans(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
