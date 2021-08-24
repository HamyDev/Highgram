import 'package:flutter/material.dart';
import 'package:highgram/models/logInRegisterButtons.dart';
import 'package:highgram/models/mainScreenNavBar.dart';
import 'package:highgram/screens/home/collect.dart';
import 'package:highgram/screens/home/favourite.dart';
import 'package:highgram/screens/home/gerkins.dart';
import 'package:highgram/screens/home/overview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55), child: MainScreenNavBar()),
      body: Wrap(children: [
        SizedBox(
          height: 615,
          child: PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            children: [Overview(), Collect(), Gerkins(), Favourite()],
          ),
        ),
        LogInRegisterButtons()
      ]),
    );
  }
}
