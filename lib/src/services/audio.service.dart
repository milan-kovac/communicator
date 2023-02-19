import 'dart:io';

class AudioService {

  static Future<File> get(String path) async {
    return File(path).create();
  }
}
