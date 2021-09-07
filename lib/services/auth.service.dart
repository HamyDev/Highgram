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

  Future<void> logout() => _auth.signOut();

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

      Map<dynamic, dynamic> userInfoMap = {
        "name": name,
        "id": name,
        "highscore": 0,
        "email": result.user.email
      };

      _databaseMethods.uploadUserInfo(userInfoMap);
      HelperFunctions.saveUserLoggedInSharedPreference(true);

      print('${name}');
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
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      var username = name;
      var userid = id;

      HelperFunctions.saveUserEmailSharedPreference(result.user.email);
      HelperFunctions.saveUserNameSharedPreference(username);

      Map<String, dynamic> userInfoMap = {
        "name": username,
        "id": userid,
        "highscore": 0,
        "email": result.user.email
      };

      _databaseMethods.uploadUserInfo(userInfoMap);
      HelperFunctions.saveUserLoggedInSharedPreference(true);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print("${e.toString()} - ERROR");
      return null;
    }
  }
}
