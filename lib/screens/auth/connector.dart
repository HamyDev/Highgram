import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highgram/screens/auth/login.dart';
import 'package:highgram/screens/auth/register.dart';

class Connector extends StatelessWidget {
  final dynamic page;
  Connector(this.page);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Wrap(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: DefaultTabController(
            length: 2,
            initialIndex: page,
            child: new Scaffold(
              body: Stack(children: <Widget>[
                TabBarView(
                  children: [Login(), Register()],
                ),
              ]),
              appBar: AppBar(
                toolbarHeight: 60,
                leadingWidth: 1,
                elevation: 1,
                title: new TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        "Log In",
                        style:
                            GoogleFonts.openSans(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                        child: Text(
                      "Register",
                      style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
                    )),
                  ],
                  labelColor: Colors.black,
                  //indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.amber,
                  indicatorWeight: 4,
                ),
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ),

        //SizedBox(
        //  height: 615,
        //  child: PageView(
        //    controller: controller,
        //    scrollDirection: Axis.horizontal,
        //    children: [
        //      Register(),
        //      Login(),
        //    ],
        //  ),
        //),
      ]),
    );
  }
}

/*
ColoredBox(
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: Colors.grey.shade300,
                width: 2.0,
              )),
            ),
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                    child: Text("Log In")),
                Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                        color: Colors.amber,
                        width: 4.0,
                      )),
                    ),
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        "Register",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    )
                )
              ],
            ),
          ),
        ), */