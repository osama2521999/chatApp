import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<Either<String, User?>> signInEmail(
      String email, String password) async {
    User? user;
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = result.user;

      if (user != null && !user.emailVerified) {
        return const Left("Please Verify your email first");
      }
      return Right(user);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> signUp(
      email, password, String displayName) async {

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      final User? user = userCredential.user;
      if (user != null) {
        user.updateDisplayName(displayName);
        user.sendEmailVerification();

        ///add user to real time database
        DatabaseReference ref = FirebaseDatabase.instance.ref("Users/${user.uid}");
        await ref.set({
          "email": user.email,
          "name": displayName,
          "isActive": true,
          
        }).then((_){print('user created');});
      }
      return Right((user != null ? true : false));
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> forgotPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return const Right("Successfully");
    } on FirebaseAuthException catch (err) {
      return Left(err.message.toString());
    } catch (err) {
      return Left(err.toString());
    }
  }

}
