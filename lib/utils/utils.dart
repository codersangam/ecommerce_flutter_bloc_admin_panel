// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce_flutter_bloc_admin_panel/controllers/controllers.dart';
import 'package:ecommerce_flutter_bloc_admin_panel/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class Utils {
  static Future<void> pickedImage(
      BuildContext context, ProductController productController) async {
    ImagePicker picker = ImagePicker();
    StorageService storageService = StorageService();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      VxToast.show(context, msg: "No Image Selected");
    }
    if (pickedFile != null) {
      await storageService.uploadImage(pickedFile);
      var imageUrl = await storageService.getDownloadUrl(pickedFile.name);
      productController.newProduct
          .update('imageUrl', (_) => imageUrl, ifAbsent: () => imageUrl);
      // ignore: avoid_print
      print(productController.newProduct['imageUrl']);
    }
  }
}
