import 'dart:developer';

import 'package:communicator/src/models/user.dart';
import 'package:communicator/src/services/user.service.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
}
