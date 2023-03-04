import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communicator/src/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static Future addUser(UserModel user) async {
    try {
      var id = user.id;
      DocumentReference<Map<String, dynamic>> users = FirebaseFirestore.instance.doc('users/$id');
      await users.set({'id': user.id, 'email': user.email});
    } catch (error) {
      log('addUser: $error');
      rethrow;
    }
  }

  static Future<void> saveUserLocal(UserModel user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      dynamic data = jsonEncode(user.toJson());
      await prefs.setString('user', data);
    } catch (error) {
      log('saveUserLocal: $error');
      rethrow;
    }
  }

  static Future<UserModel> getLocalUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = json.decode(prefs.getString('user') ?? "");
      return UserModel.fromJson(userData);
    } catch (error) {
      log('getLocalUser: $error');
      rethrow;
    }
  }

  static Future<void> deleteLocalUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('user');
    } catch (error) {
      log('deleteLocalUser: $error');
      rethrow;
    }
  }

  static Future<bool> adminControlActivated() async {
    try {
      UserModel user = await getLocalUser();
      return user.adminControl;
    } catch (error) {
      log('getLocalUser: $error');
      rethrow;
    }
  }

  static Future<void> setAdminControl() async {
    try {
      UserModel user = await getLocalUser();
      user.adminControl = !user.adminControl;
      await saveUserLocal(user);
    } catch (error) {
      log('getLocalUser: $error');
      rethrow;
    }
  }
}
