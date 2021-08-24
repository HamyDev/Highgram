import 'package:flutter/material.dart';

class globalNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      title: Container(
        child: Center(
            child: Image.asset(
          'assets/images/mcdonalds.png',
          width: 35,
          height: 35,
        )),
      ),
    );
  }
}
