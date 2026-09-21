import 'package:cloud_firestore/cloud_firestore.dart';

/// Reusable, generic Firestore database service for FARMIGO modules.
class FirestoreService {
  final FirebaseFirestore _firestore;

  FirestoreService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  /// Creates or replaces a document with a specific [docId].
  Future<void> createDocument({
    required String collectionPath,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    final payload = Map<String, dynamic>.from(data);
    payload['updatedAt'] = FieldValue.serverTimestamp();
    payload['createdAt'] ??= FieldValue.serverTimestamp();

    await _firestore.collection(collectionPath).doc(docId).set(
          payload,
          SetOptions(merge: true),
        );
  }

  /// Adds a new document with an auto-generated Firestore ID.
  Future<String> addDocument({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    final payload = Map<String, dynamic>.from(data);
    payload['createdAt'] = FieldValue.serverTimestamp();
    payload['updatedAt'] = FieldValue.serverTimestamp();

    final docRef = await _firestore.collection(collectionPath).add(payload);
    return docRef.id;
  }

  /// Fetches a single document by [docId]. Returns null if document does not exist.
  Future<DocumentSnapshot<Map<String, dynamic>>?> getDocument({
    required String collectionPath,
    required String docId,
  }) async {
    final docSnap = await _firestore.collection(collectionPath).doc(docId).get();
    if (!docSnap.exists) return null;
    return docSnap;
  }

  /// Updates fields of an existing document.
  Future<void> updateDocument({
    required String collectionPath,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    final payload = Map<String, dynamic>.from(data);
    payload['updatedAt'] = FieldValue.serverTimestamp();

    await _firestore.collection(collectionPath).doc(docId).update(payload);
  }

  /// Deletes a document by [docId].
  Future<void> deleteDocument({
    required String collectionPath,
    required String docId,
  }) async {
    await _firestore.collection(collectionPath).doc(docId).delete();
  }

  /// Fetches all documents in a collection as a list of Snapshots.
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getCollection({
    required String collectionPath,
  }) async {
    final querySnap = await _firestore.collection(collectionPath).get();
    return querySnap.docs;
  }

  /// Queries documents in a collection using a flexible [queryBuilder].
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> queryCollection({
    required String collectionPath,
    Query<Map<String, dynamic>> Function(Query<Map<String, dynamic>> query)? queryBuilder,
  }) async {
    Query<Map<String, dynamic>> query = _firestore.collection(collectionPath);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final querySnap = await query.get();
    return querySnap.docs;
  }

  /// Streams real-time updates for a single document.
  Stream<DocumentSnapshot<Map<String, dynamic>>> streamDocument({
    required String collectionPath,
    required String docId,
  }) {
    return _firestore.collection(collectionPath).doc(docId).snapshots();
  }

  /// Streams real-time updates for a collection query.
  Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>> streamCollection({
    required String collectionPath,
    Query<Map<String, dynamic>> Function(Query<Map<String, dynamic>> query)? queryBuilder,
  }) {
    Query<Map<String, dynamic>> query = _firestore.collection(collectionPath);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    return query.snapshots().map((snap) => snap.docs);
  }
}
