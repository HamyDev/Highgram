import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:highgram/screens/main/globalNavBar.dart';
import 'package:highgram/screens/main/home.dart';
import 'package:highgram/screens/main/more.dart';
import 'package:highgram/screens/main/order.dart';
import 'package:simple_icons/simple_icons.dart';

class MainWrapper extends StatefulWidget {
  @override
  _MainWrapperState createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;
  static List<Widget> _options = <Widget>[MainPage(), Order(), More()];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55), child: globalNavBar()),
      body: Container(
        child: _options.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(SimpleIcons.mcdonalds),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FlutterIcons.tag_evi,
                size: 35,
              ),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.ellipsis_h),
              label: 'More',
            ),
          ],
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey,
          iconSize: 30,
          onTap: _onItemTap,
          elevation: 5),
    );
  }
}
