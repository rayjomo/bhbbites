import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map(
        (FirebaseUser user) => user?.uid,
  );

  // Email & Password Sign Up
  Future<String> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    final currentUser = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Update the username
    var userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = name;
    await currentUser.updateProfile(userUpdateInfo);
    await currentUser.reload();
    return currentUser.uid;
  }

  // Email & Password Sign In
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password))
        .uid;
  }

  // Sign Out
  signOut() {
    return _firebaseAuth.signOut();
  }

}

class EmailValidator{
  static String validate(String value) {
    if (value.isEmpty){
      return "Fill in your email";
    }
    return null;
  }
}

class NameValidator{
  static String validate(String value) {
    if (value.isEmpty){
      return "Fill in your name";
    }
    if(value.length < 2) {
      return "Please enter in your fullname";
    }
    if(value.length > 50) {
      return "Your name should be less than 50 characters";
    }
    return null;
  }
}

class PasswordValidator{
  static String validate(String value) {
    if (value.isEmpty){
      return "Fill in your password";
    }
    return null;
  }
}
