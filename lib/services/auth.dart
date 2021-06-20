import 'package:firebase_auth/firebase_auth.dart';
import 'package:pla_tr/models/user.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // ignore: non_constant_identifier_names
  Future SigninEmailandPass(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = userCredential.user;
      print("${user.uid} in auth");
      UserId.userid = user.uid;
      UserId.email = email;
      return user.uid;
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
      UserId.userid = user.uid;
      return user.uid;
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
