import 'package:firebase_auth/firebase_auth.dart';
import 'package:pla_tr/models/user.dart';
import 'package:pla_tr/services/database.dart';

class AuthService {
  var uid = UserId();
  FirebaseAuth _auth = FirebaseAuth.instance;

  UserId userFromFireBaseUSer(User user) {
    return user != null ? UserId(userID: user.uid) : null;
  }

  // ignore: non_constant_identifier_names
  Future SigninEmailandPass(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = userCredential.user;
      return userFromFireBaseUSer(user);
    } catch (e) {
      print(e);
    }
  }

  // ignore: non_constant_identifier_names
  Future SignUpwitEmailandPass(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      await DatabaseService(uid).setUserData(email);
      return userFromFireBaseUSer(user);
    } catch (e) {
      print(e);
    }
  }

  // ignore: non_constant_identifier_names
  Future SignOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
