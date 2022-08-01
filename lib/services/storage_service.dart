import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<void> uploadImage(XFile image) async {
    await firebaseStorage
        .ref('product_images/${image.name}')
        .putFile(File(image.path));
  }

  Future<String> getDownloadUrl(String imageUrl) async {
    String downloadUrl =
        await firebaseStorage.ref('product_images/$imageUrl').getDownloadURL();
    return downloadUrl;
  }
}
