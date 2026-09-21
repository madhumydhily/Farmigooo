import '../constants/firestore_collections.dart';
import '../errors/app_exception.dart';
import '../../models/notification_model.dart';
import 'firestore_service.dart';

/// Reusable Notification service for FARMIGO platform events.
class NotificationService {
  final FirestoreService _firestoreService;

  NotificationService({FirestoreService? firestoreService})
      : _firestoreService = firestoreService ?? FirestoreService();

  /// Persists a new notification to Firestore.
  Future<String> createNotification(NotificationModel notification) async {
    try {
      final docId = notification.notificationId.isEmpty
          ? DateTime.now().millisecondsSinceEpoch.toString()
          : notification.notificationId;

      final data = notification.toMap();
      data['notificationId'] = docId;

      await _firestoreService.createDocument(
        collectionPath: FirestoreCollections.notifications,
        docId: docId,
        data: data,
      );
      return docId;
    } catch (e) {
      throw AppException.fromFirebase(e);
    }
  }

  /// Fetches all notifications for a specific user.
  Future<List<NotificationModel>> getUserNotifications(String userId) async {
    try {
      final docs = await _firestoreService.queryCollection(
        collectionPath: FirestoreCollections.notifications,
        queryBuilder: (q) => q.where('userId', isEqualTo: userId).orderBy('createdAt', descending: true),
      );
      return docs.map((doc) => NotificationModel.fromMap(doc.data(), doc.id)).toList();
    } catch (e) {
      throw AppException.fromFirebase(e);
    }
  }

  /// Real-time stream of notifications for a specific user.
  Stream<List<NotificationModel>> streamUserNotifications(String userId) {
    try {
      return _firestoreService.streamCollection(
        collectionPath: FirestoreCollections.notifications,
        queryBuilder: (q) => q.where('userId', isEqualTo: userId).orderBy('createdAt', descending: true),
      ).map((docs) => docs.map((doc) => NotificationModel.fromMap(doc.data(), doc.id)).toList());
    } catch (e) {
      throw AppException.fromFirebase(e);
    }
  }

  /// Marks a specific notification as read.
  Future<void> markAsRead(String notificationId) async {
    try {
      await _firestoreService.updateDocument(
        collectionPath: FirestoreCollections.notifications,
        docId: notificationId,
        data: {'read': true},
      );
    } catch (e) {
      throw AppException.fromFirebase(e);
    }
  }

  /// Marks all notifications for a user as read.
  Future<void> markAllAsRead(String userId) async {
    try {
      final docs = await getUserNotifications(userId);
      for (final doc in docs) {
        if (!doc.read) {
          await markAsRead(doc.notificationId);
        }
      }
    } catch (e) {
      throw AppException.fromFirebase(e);
    }
  }

  // --------------------------------------------------------------------------
  // Reusable Event Notification Triggers
  // --------------------------------------------------------------------------

  /// Triggers a notification when a landowner receives a new land lease request.
  Future<void> notifyLandRequestReceived({
    required String ownerId,
    required String farmerId,
    required String landId,
    required String requestId,
  }) async {
    final notif = NotificationModel(
      notificationId: '',
      userId: ownerId,
      title: 'New Land Lease Request',
      message: 'A farmer submitted a lease request for your land parcel.',
      type: 'land_request',
      relatedId: requestId,
      createdAt: DateTime.now(),
    );
    await createNotification(notif);
  }

  /// Triggers a notification when a land request status is updated (approved/rejected).
  Future<void> notifyLandRequestStatusChanged({
    required String farmerId,
    required String landId,
    required String status,
  }) async {
    final notif = NotificationModel(
      notificationId: '',
      userId: farmerId,
      title: 'Land Request Update',
      message: 'Your land lease request status has been updated to "$status".',
      type: 'land_request_status',
      relatedId: landId,
      createdAt: DateTime.now(),
    );
    await createNotification(notif);
  }

  /// Triggers a notification when machinery owner receives a rental request.
  Future<void> notifyMachineryRequestReceived({
    required String ownerId,
    required String requesterId,
    required String machineryId,
    required String requestId,
  }) async {
    final notif = NotificationModel(
      notificationId: '',
      userId: ownerId,
      title: 'New Equipment Booking',
      message: 'You received a new rental request for your machinery.',
      type: 'machinery_request',
      relatedId: requestId,
      createdAt: DateTime.now(),
    );
    await createNotification(notif);
  }

  /// Triggers a notification when a machinery request status changes.
  Future<void> notifyMachineryRequestStatusChanged({
    required String requesterId,
    required String machineryId,
    required String status,
  }) async {
    final notif = NotificationModel(
      notificationId: '',
      userId: requesterId,
      title: 'Equipment Booking Update',
      message: 'Your machinery rental booking status is now "$status".',
      type: 'machinery_request_status',
      relatedId: machineryId,
      createdAt: DateTime.now(),
    );
    await createNotification(notif);
  }

  /// Triggers a notification when a vendor receives a new produce order.
  Future<void> notifyOrderPlaced({
    required String vendorId,
    required String buyerId,
    required String orderId,
  }) async {
    final notif = NotificationModel(
      notificationId: '',
      userId: vendorId,
      title: 'New Produce Order',
      message: 'An order has been placed for your marketplace listing.',
      type: 'order_placed',
      relatedId: orderId,
      createdAt: DateTime.now(),
    );
    await createNotification(notif);
  }

  /// Triggers a notification when an order status changes.
  Future<void> notifyOrderStatusChanged({
    required String buyerId,
    required String orderId,
    required String status,
  }) async {
    final notif = NotificationModel(
      notificationId: '',
      userId: buyerId,
      title: 'Order Status Update',
      message: 'Your produce order status has been updated to "$status".',
      type: 'order_status',
      relatedId: orderId,
      createdAt: DateTime.now(),
    );
    await createNotification(notif);
  }

  /// Triggers a notification when a consultant receives an advisory request.
  Future<void> notifyConsultationRequested({
    required String consultantId,
    required String farmerId,
    required String consultationId,
  }) async {
    final notif = NotificationModel(
      notificationId: '',
      userId: consultantId,
      title: 'New Advisory Request',
      message: 'A farmer has requested an expert advisory session with you.',
      type: 'consultation_request',
      relatedId: consultationId,
      createdAt: DateTime.now(),
    );
    await createNotification(notif);
  }

  /// Triggers a notification when a consultation status changes.
  Future<void> notifyConsultationStatusChanged({
    required String farmerId,
    required String consultationId,
    required String status,
  }) async {
    final notif = NotificationModel(
      notificationId: '',
      userId: farmerId,
      title: 'Advisory Consultation Update',
      message: 'Your consultation session status is now "$status".',
      type: 'consultation_status',
      relatedId: consultationId,
      createdAt: DateTime.now(),
    );
    await createNotification(notif);
  }
}
