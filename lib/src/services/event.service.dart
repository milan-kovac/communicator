import 'package:communicator/src/models/user.dart';
import 'package:communicator/src/services/user.service.dart';

class EventService {
  static Future<void> addEvent() async {
    UserModel user = await UserService.getLocalUser();
  }
}
