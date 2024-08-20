import 'package:firebase_auth/firebase_auth.dart';

class LoginController{

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User> signInEmail(String email, String password) async {
    UserCredential result =
    await auth.signInWithEmailAndPassword(email: email, password: password);
    final User user = result.user!;

    return user;
  }
  Future<User> signUp(email, password) async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final User user = result.user!;

    return user;
  }
}