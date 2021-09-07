import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUserbyUserEmail(String userEmail) async {
    return await Firestore.instance
        .collection("users")
        .where("email", isEqualTo: userEmail)
        .getDocuments();
  }

  uploadUserInfo(userMap) {
    Firestore.instance.collection("users").add(userMap);
  }

  GetLeaderboardData() async {
    return await Firestore.instance
        .collection("users")
        .where("highscore")
        .orderBy("highscore", descending: true)
        .getDocuments();
  }
}
