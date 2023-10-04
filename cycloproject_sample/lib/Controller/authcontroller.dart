import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cycloproject_sample/CYCLOMOBPRO/Screens/Homepage.dart';
import 'package:cycloproject_sample/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController loginemail = TextEditingController();
  TextEditingController loginpassword = TextEditingController();
  TextEditingController resetemail = TextEditingController();
  var loading = false.obs;
  signUp() async {
    try {
      loading.value = true;
      await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      await addUser();
      await verifyemail();
      Get.to(() => Homepagemain());
      loading.value = false;
    } catch (e) {
      Get.snackbar("error", "$e");
      loading.value = false;
    }
  }

  addUser() async {
    UserModel user =
        UserModel(Username: username.text, email: auth.currentUser?.email);
    await db
        .collection("users")
        .doc(auth.currentUser?.uid)
        .collection("Profile")
        .add(user.toMap());
  }

  signOut() async {
    await auth.signOut();
  }

  signIn() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: loginemail.text, password: loginpassword.text);
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

  verifyemail() async {
    await auth.currentUser?.sendEmailVerification();
    Get.snackbar("Email", "sended");
  }
}
