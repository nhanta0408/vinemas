import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class AccountFirebaseStorageDataSource {
  Future<String?> changeAvatar({
    required Uint8List avatarData,
    required String email,
  }) async {
    final storageRef = FirebaseStorage.instance.ref();
    final avatarImagesRef = storageRef.child('avatars/$email.jpg');
    await avatarImagesRef.putData(avatarData);
    return avatarImagesRef.getDownloadURL();
  }
}
