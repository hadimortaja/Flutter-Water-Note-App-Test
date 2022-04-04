import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get.dart';
import 'package:water_note_app/value/constant.dart';
import 'package:water_note_app/view/Auth%20/sign_in_screen.dart';
import 'package:water_note_app/view/Other%20Screens/home_screen.dart';

class FirebaseBackend {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  registerUserToFirebase(String email, String password, String name) async {
    SVProgressHUD.show();

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log(userCredential.user.toString());
      if (userCredential.user != null) {
        users
            .add({'name': name, 'email': email, 'password': password})
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
        SVProgressHUD.dismiss();
        getSheetSucsses("Registered Successfully");
        Get.offAll(() => HomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        SVProgressHUD.dismiss();

        getSheetError(e.toString());

        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        SVProgressHUD.dismiss();

        getSheetError(e.toString());

        print('The account already exists for that email.');
      }
    } catch (e) {
      SVProgressHUD.dismiss();

      print(e);
    }
  }

  loginUser(String email, String password) async {
    try {
      SVProgressHUD.show();

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      log(userCredential.user.toString());
      if (userCredential.user != null) {
        SVProgressHUD.dismiss();

        Get.offAll(() => HomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        SVProgressHUD.dismiss();

        getSheetError(e.toString());
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        SVProgressHUD.dismiss();

        getSheetError(e.toString());

        print('Wrong password provided for that user.');
      }
    }
  }

  logOut() async {
    await FirebaseAuth.instance.signOut();

    Get.offAll(() => SignInScreen());
  }

  User getuser() {
    User user = FirebaseAuth.instance.currentUser;

    return user;
  }
}
