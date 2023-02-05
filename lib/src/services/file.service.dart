import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FileService {
  static Future<String> uploadFile(File file) async {
    final fileType = getFileExtension(file.path) == '.mp3' ? 'audio' : 'images';
    final destination = 'files/$fileType';
    try {
      final ref = FirebaseStorage.instance
          .ref(destination)
          .child(getFileName(file.path));
      final uplodaTask = await ref.putFile(file);
      return await uplodaTask.ref.getDownloadURL();
    } catch (error) {
      log('uploadFile: $error');
      rethrow;
    }
  }

  static String getFileExtension(String path) {
    try {
      return ".${path.split('.').last}";
    } catch (error) {
      log('getFileExtension: $error');
      return '';
    }
  }

  static String getFileName(String path) {
    try {
      return path.split('/').last;
    } catch (error) {
      log('getFileName: $error');
      return 'file';
    }
  }

  Future<File?> getFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
  }
}
