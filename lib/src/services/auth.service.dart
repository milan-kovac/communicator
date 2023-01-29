import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  
  static void anonymousLogin(String email) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with temporary account.");
      print(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }
}
