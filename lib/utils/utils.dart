// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class Utils {
  static Future<XFile?> pickedImage(BuildContext context) async {
    ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      VxToast.show(context, msg: "No Image Selected");
    }
    if (pickedFile != null) {
      VxToast.show(context, msg: "Image Selected");
    }
    return pickedFile;
  }
}
