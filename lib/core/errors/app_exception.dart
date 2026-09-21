import 'package:firebase_core/firebase_core.dart';

/// Clean application-level exception for user-friendly error handling.
class AppException implements Exception {
  final String message;
  final String? code;

  const AppException(this.message, {this.code});

  factory AppException.fromFirebase(dynamic error) {
    if (error is FirebaseException) {
      switch (error.code) {
        case 'user-not-found':
          return const AppException('No account found with this email address.', code: 'user-not-found');
        case 'wrong-password':
          return const AppException('Incorrect password. Please try again.', code: 'wrong-password');
        case 'email-already-in-use':
          return const AppException('An account already exists with this email address.', code: 'email-already-in-use');
        case 'invalid-email':
          return const AppException('Invalid email format.', code: 'invalid-email');
        case 'weak-password':
          return const AppException('Password should be at least 6 characters long.', code: 'weak-password');
        case 'permission-denied':
          return const AppException('You do not have permission to perform this action.', code: 'permission-denied');
        case 'object-not-found':
          return const AppException('Requested file or document was not found.', code: 'object-not-found');
        case 'unauthorized':
          return const AppException('Unauthorized operation.', code: 'unauthorized');
        default:
          return AppException(error.message ?? 'An unexpected Firebase error occurred.', code: error.code);
      }
    }
    return AppException(error.toString());
  }

  @override
  String toString() => message;
}
