import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ShopImagePicker {
  static Future<File?> pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
