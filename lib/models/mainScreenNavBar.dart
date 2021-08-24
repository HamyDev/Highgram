import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreenNavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: 
        Container(
          padding: EdgeInsets.only(right: 60),
          child: Center(
            child: Image.asset('assets/images/mcdonalds.png', width: 35, height: 35,)
          ),
        ),
        leading: Container(
          width: 30,
          height: 30,
          margin: EdgeInsets.only(right: 20),
          child: CloseButton(
            color: Colors.black,
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        )
    );
  }
}