import 'package:firebase_auth/firebase_auth.dart';
import '../constants/firestore_collections.dart';
import '../errors/app_exception.dart';
import '../../models/user_model.dart';
import 'firestore_service.dart';

/// Reusable Firebase Authentication service for FARMIGO platform.
class AuthService {
  final FirebaseAuth _firebaseAuth;
  final FirestoreService _firestoreService;

  AuthService({
    FirebaseAuth? firebaseAuth,
    FirestoreService? firestoreService,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestoreService = firestoreService ?? FirestoreService();

  /// Stream of Firebase auth state changes.
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  /// Gets the currently authenticated Firebase User.
  User? get currentUser => _firebaseAuth.currentUser;

  /// Registers a new user with email/password and stores their profile in Firestore.
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    String? phoneNumber,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = credential.user!.uid;

      final userModel = UserModel(
        id: uid,
        email: email,
        fullName: fullName,
        phoneNumber: phoneNumber,
        role: role,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _firestoreService.createDocument(
        collectionPath: FirestoreCollections.users,
        docId: uid,
        data: userModel.toMap(),
      );

      return userModel;
    } catch (e) {
      throw AppException.fromFirebase(e);
    }
  }

  /// Signs in an existing user with email and password.
  Future<UserModel?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = credential.user?.uid;
      if (uid == null) return null;

      return await getCurrentUserModel();
    } catch (e) {
      throw AppException.fromFirebase(e);
    }
  }

  /// Fetches the current user's profile document from Firestore.
  Future<UserModel?> getCurrentUserModel() async {
    try {
      final uid = currentUser?.uid;
      if (uid == null) return null;

      final snap = await _firestoreService.getDocument(
        collectionPath: FirestoreCollections.users,
        docId: uid,
      );

      if (snap == null || !snap.exists || snap.data() == null) {
        return null;
      }

      return UserModel.fromMap(snap.data()!, snap.id);
    } catch (e) {
      throw AppException.fromFirebase(e);
    }
  }

  /// Signs out the currently authenticated user.
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw AppException.fromFirebase(e);
    }
  }
}
