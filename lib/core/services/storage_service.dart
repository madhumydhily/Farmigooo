import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import '../errors/app_exception.dart';

/// Reusable Firebase Storage service for FARMIGO media assets.
class StorageService {
  final FirebaseStorage _storage;

  StorageService({FirebaseStorage? storage})
      : _storage = storage ?? FirebaseStorage.instance;

  /// Uploads raw image bytes to a specified storage path folder (e.g., 'users/{uid}', 'lands/{uid}').
  /// Returns the public download URL of the uploaded image.
  Future<String> uploadImage({
    required String pathFolder,
    required String fileName,
    required Uint8List bytes,
    String contentType = 'image/jpeg',
  }) async {
    try {
      final cleanFolder = pathFolder.endsWith('/') ? pathFolder : '$pathFolder/';
      final fullPath = '$cleanFolder$fileName';
      final ref = _storage.ref().child(fullPath);

      final metadata = SettableMetadata(
        contentType: contentType,
      );

      final uploadTask = await ref.putData(bytes, metadata);
      final downloadUrl = await uploadTask.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw AppException.fromFirebase(e);
    }
  }

  /// Gets the public download URL for a file given its full storage path.
  Future<String> getDownloadUrl({required String fullPath}) async {
    try {
      final ref = _storage.ref().child(fullPath);
      return await ref.getDownloadURL();
    } catch (e) {
      throw AppException.fromFirebase(e);
    }
  }

  /// Deletes a file from Firebase Storage given its full storage path.
  Future<void> deleteFile({required String fullPath}) async {
    try {
      final ref = _storage.ref().child(fullPath);
      await ref.delete();
    } catch (e) {
      throw AppException.fromFirebase(e);
    }
  }
}
