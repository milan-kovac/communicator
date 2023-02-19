import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FileService {
  static Future<String> uploadFile(File file) async {
    final fileType = getFileExtension(file.path) == '.mp3' ? 'audio' : 'images';
    log(fileType);
    final destination = 'files/$fileType';
    try {
      final ref = FirebaseStorage.instance.ref(destination).child(getFileName(file.path));
      final uplodaTask = await ref.putFile(file);
      return await uplodaTask.ref.getDownloadURL();
    } catch (error) {
      log('uploadFile: $error');
      rethrow;
    }
  }

  static String getFileExtension(String path) {
    try {
      log( ".${path.split('.').last}");
      return ".${path.split('.').last}";
    } catch (error) {
      log('getFileExtension: $error');
      return '';
    }
  }

  static String getFileName(String path) {
    try {
      return '${DateTime.now().millisecondsSinceEpoch}_${path.split('/').last}';
    } catch (error) {
      log('getFileName: $error');
      return 'file';
    }
  }
}
