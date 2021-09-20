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

  GetUserRank(String username) async {
    var data = await Firestore.instance
        .collection("users")
        .where("highscore")
        .orderBy("highscore", descending: true)
        .getDocuments();

    for (var i = 0; i < data.documents.length; i++) {
      if (data.documents[i].data["name"] == username) {
        return i + 1;
      }
    }
  }

  CheckIfUsernameIsAvailable(String username) async {
    var userData = await Firestore.instance
        .collection("users")
        .where("name")
        .getDocuments();
    if (userData.documents.toList().isEmpty) {
      return true;
    }
    for (var i = 0; i < userData.documents.length; i++) {
      bool result =
          userData.documents[i].data["name"] == username ? false : true;
      return result;
    }
  }

  GetUsersAffiliate(String username) async {
    var userData = await Firestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .getDocuments();
    return userData.documents[0].data["affiliate"];
  }

  checkifAffiliateIsValid(String affiliate) async {
    var userData = await Firestore.instance
        .collection("users")
        .where("affiliate", isEqualTo: affiliate)
        .getDocuments();
    if (userData.documents.toList().isEmpty) {
      return false;
    } else {
      //userData.documents[0].data["affiliateStatistics"]["registered"] + 1;
      //userData.documents[0].data["affiliateStatistics"]["used"] + 1;
      var affiliateStatistics =
          userData.documents[0].data["affiliateStatistics"];
      var analytics = affiliateStatistics["analytics"];
      Map<String, dynamic> affiliateAnalytics = {
        "mon": analytics["mon"],
        "tue": analytics["tue"],
        "wen": analytics["wen"],
        "thu": analytics["thu"],
        "fri": analytics["fri"],
        "sat": analytics["sat"],
        "sun": analytics["sun"],
      };

      Map<String, dynamic> updatedataanalytics = {
        "registered": affiliateStatistics["registered"] + 1,
        "used": affiliateStatistics["used"] + 1,
        "adsShow": affiliateStatistics["adsShow"],
        "analytics": affiliateAnalytics
      };
      Map<String, dynamic> updatedData = {
        "affiliateStatistics": updatedataanalytics
      };
      var docId = userData.documents[0].documentID;

      await Firestore.instance
          .collection("users")
          .document(docId)
          .updateData(updatedData);
      return true;
    }
  }

  GetNewRegistered(String username) async {
    var userData = await Firestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .getDocuments();
    return userData.documents[0].data["affiliateStatistics"]["registered"];
  }

  GetUsedCode(String username) async {
    var userData = await Firestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .getDocuments();
    return userData.documents[0].data["affiliateStatistics"]["used"];
  }

  GetAverageAds(String username) async {
    var userData = await Firestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .getDocuments();
    return userData.documents[0].data["affiliateStatistics"]["adsShow"];
  }

  GetBalance(String username) async {
    var userData = await Firestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .getDocuments();
    return userData.documents[0].data["balance"];
  }

  GetAnalytics(String username) async {
    //String day
    var userData = await Firestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .getDocuments();
    var locaton =
        userData.documents[0].data["affiliateStatistics"]["analytics"];
    return locaton;
  }
}
