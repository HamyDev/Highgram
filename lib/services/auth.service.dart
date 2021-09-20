import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:highgram/models/models/user.dart';
import 'package:highgram/services/database.service.dart';
import 'package:highgram/services/helper/helper.functions.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final DatabaseMethods _databaseMethods = DatabaseMethods();

  //create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  logout() => {
        HelperFunctions.saveUserNameSharedPreference(null),
        HelperFunctions.saveUserEmailSharedPreference(null),
        HelperFunctions.saveUserLoggedInSharedPreference(false),
        _auth.signOut(),
      };

  loginGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);

      //Firebase Sign in
      final result = await _auth.signInWithCredential(credential);
      var name = result.user.displayName.contains(" ")
          ? result.user.displayName.replaceAll(" ", "_").toLowerCase()
          : result.user.displayName.toString().toLowerCase();

      HelperFunctions.saveUserEmailSharedPreference(result.user.email);
      HelperFunctions.saveUserNameSharedPreference(name);

      Map<String, dynamic> affiliateAnalytics = {
        "mon": 0,
        "tue": 0,
        "wen": 0,
        "thu": 0,
        "fri": 0,
        "sat": 0,
        "sun": 0,
      };

      Map<String, dynamic> affiliateStatistics = {
        "registered": 0,
        "used": 0,
        "adsShow": 0,
        "analytics": affiliateAnalytics
      };

      Map<String, dynamic> userInfoMap = {
        "name": name,
        "id": name,
        "affiliate": name,
        "highscore": 0,
        "balance": 0,
        "email": result.user.email,
        "affiliateStatistics": affiliateStatistics
      };

      _databaseMethods.uploadUserInfo(userInfoMap);
      HelperFunctions.saveUserLoggedInSharedPreference(true);

      print('$name');
    } catch (error) {
      print(error);
    }
  }

  //Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email & password
  Future registerWithEmailAndPassword(String email, String password,
      String affiliate, String name, String id) async {
    try {
      if (!RegExp("^.{8,16}").hasMatch(password) ||
          !RegExp("(?:[^a-z]*[A-Z])").hasMatch(password) ||
          !RegExp(".*[0-9].*").hasMatch(password)) {
        return throw "ERROR_WEAK_PASSWORD";
      }

      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email)) {
        return throw "ERROR_INVALID_EMAIL";
      }

      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      var username = name;
      var userid = id;

      HelperFunctions.saveUserEmailSharedPreference(result.user.email);
      HelperFunctions.saveUserNameSharedPreference(username);

      Map<String, dynamic> affiliateAnalytics = {
        "mon": 0,
        "tue": 0,
        "wen": 0,
        "thu": 0,
        "fri": 0,
        "sat": 0,
        "sun": 0,
      };

      Map<String, dynamic> affiliateStatistics = {
        "registered": 0,
        "used": 0,
        "adsShow": 0,
        "analytics": affiliateAnalytics
      };

      Map<String, dynamic> userInfoMap = {
        "name": username,
        "id": userid,
        "affiliate": userid,
        "highscore": 0,
        "balance": 0,
        "email": result.user.email,
        "affiliateStatistics": affiliateStatistics
      };

      _databaseMethods.uploadUserInfo(userInfoMap);
      HelperFunctions.saveUserLoggedInSharedPreference(true);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print("${e.toString()} - ERROR");
      if (e.toString().contains("ERROR_EMAIL_ALREADY_IN_USE")) {
        return "ERROR_EMAIL_ALREADY_IN_USE";
      }
      if (e.toString().contains("ERROR_WEAK_PASSWORD")) {
        return "ERROR_WEAK_PASSWORD";
      }
      return null;
    }
  }
}
