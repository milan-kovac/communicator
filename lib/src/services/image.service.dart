import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageService {
  static Future<File?> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  static File loadImageFromAsset(String key) {
    final Directory systemTempDir = Directory.systemTemp;
    return File('${systemTempDir.path}/$key');
  }
}
