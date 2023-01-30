import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communicator/src/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {


  static Future addUser(UserModel user) async {
    try {
      DocumentReference<Map<String, dynamic>> users = FirebaseFirestore.instance.doc('users/$user.id');
      await users.set({'id': user.id, 'email': user.email});
    } catch (error) {
      rethrow;
    }
  }



  static Future<void> saveUserLocal(UserModel user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      dynamic data = jsonEncode(user.toJson());
      await prefs.setString('user', data);
    } catch (error) {
      rethrow;
    }
  }

  static Future<UserModel> getLocalUser(String email, String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = json.decode(prefs.getString('user') ?? "");
      return UserModel.fromJson(userData);
    } catch (error) {
      rethrow;
    }
  }
}
