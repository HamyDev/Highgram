import 'package:flutter/material.dart';
import 'package:highgram/screens/auth/login.dart';
import 'package:highgram/screens/main/Mainwrapper.dart';
import 'package:provider/provider.dart';
import 'package:highgram/models/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print("User $user");

    //return either Home or Auth widget
    // ignore: unnecessary_null_comparison
    if (user == null) {
      return Login();
    } else {
      return MainWrapper();
    }
  }
}
