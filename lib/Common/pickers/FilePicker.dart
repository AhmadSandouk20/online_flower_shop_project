import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';

class ShopFilepicker {
  static Future<Map<String, dynamic>?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      log(result.files[0].name);
      return {
        "name": result.files[0].name,
        "file": File(result.files[0].path!),
      };
    }
    return {};
  }
}
