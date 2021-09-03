import 'package:flutter/material.dart';
import 'wrapper.dart';
import 'package:provider/provider.dart';
import './services/auth.service.dart';
import 'models/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        home: Wrapper(),
      ),
    );
  }
}
