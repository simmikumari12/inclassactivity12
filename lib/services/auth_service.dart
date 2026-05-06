import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // REGISTER
  Future<String?> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // LOGIN
  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
  }

  // CURRENT USER
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // CHANGE PASSWORD
  Future<String?> changePassword(String newPassword) async {
    try {
      await _auth.currentUser!.updatePassword(newPassword);
      return "success";
    } catch (e) {
      return e.toString();
    }
  }
}