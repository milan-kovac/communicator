import 'dart:developer';

import 'package:communicator/src/models/user.dart';
import 'package:communicator/src/pages/intro.page.dart';
import 'package:communicator/src/services/user.service.dart';
import 'package:communicator/src/utils/router.helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  static Future<void> anonymousLogin(String email) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      final userId = userCredential.user!.uid;
      UserModel user = UserModel.fromJson({'id': userId, 'email': email});
      await UserService.addUser(user);
      await UserService.saveUserLocal(user);
    } on FirebaseAuthException catch (error) {
      log('anonymousLogin: ${error.message}');
    }
  }

  static Future<bool> isAuthenticated() async {
    try {
      await UserService.getLocalUser();
      return true;
    } catch (error) {
      log('isAuthenticated: $error');
      return false;
    }
  }

  static Future<void> logOut(BuildContext context) async{
     try {
      await UserService.deleteLocalUser();
      RouterHelper(context: context, where: const IntroPage()).goFadeAway();
    } catch (error) {
      log('logOut: $error');
    }
  }
}
