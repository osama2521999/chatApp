import 'dart:developer';

import 'package:chat_app/moduls/login/data/model/user_model.com.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  List<UserModel> usersList = [];
  User? user;
  UserCredential? result;

  Future<Either<String, User?>> signInEmail(
      String email, String password) async {
    // User? user;
    try {
      result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = result?.user;
      if (user != null) {
        DatabaseReference ref =
            FirebaseDatabase.instance.ref("Users/${user!.uid}");
        await ref.update({
          "isActive": true,
        }).then((v) {
          print('ISAvtive=${true}');
        });
      }
      if (user != null && !user!.emailVerified) {
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
        DatabaseReference ref =
            FirebaseDatabase.instance.ref("Users/${user.uid}");
        await ref.set({
          "email": user.email,
          "name": displayName,
          "isActive": false,
        }).then((_) {
          print('user created');
        });
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

  List getUsersList(Iterable<DataSnapshot>? data) {
    usersList = [];
    if(data != null){
      for (var e in data) {
        if(e.key != user?.uid){
          usersList.add(UserModel.fromJson(e.value));
        }
      }
    }

    return usersList;
  }

  closingApp() async {
    user = result?.user;
    print('user is ${user}');
    print('result is ${result}');
    if (user != null) {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Users/${user!.uid}");
      await ref.update({
        "isActive": false,
      });
      print('updated');
    }
  }

  resumeApp() async {
    if (user != null) {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Users/${user!.uid}");
      await ref.update({
        "isActive": true,
      });
    }
  }
}
