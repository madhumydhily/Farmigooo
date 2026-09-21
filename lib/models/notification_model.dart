import '../core/utils/timestamp_helper.dart';

/// Represents a system or user notification in FARMIGO.
class NotificationModel {
  final String notificationId;
  final String userId;
  final String title;
  final String message;
  final String type;
  final bool read;
  final String? relatedId;
  final DateTime? createdAt;

  const NotificationModel({
    required this.notificationId,
    required this.userId,
    required this.title,
    required this.message,
    required this.type,
    this.read = false,
    this.relatedId,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'notificationId': notificationId,
      'userId': userId,
      'title': title,
      'message': message,
      'type': type,
      'read': read,
      'relatedId': relatedId,
      'createdAt': TimestampHelper.toTimestamp(createdAt),
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map, [String? docId]) {
    return NotificationModel(
      notificationId: docId ?? map['notificationId'] as String? ?? '',
      userId: map['userId'] as String? ?? '',
      title: map['title'] as String? ?? '',
      message: map['message'] as String? ?? '',
      type: map['type'] as String? ?? 'general',
      read: map['read'] as bool? ?? false,
      relatedId: map['relatedId'] as String?,
      createdAt: TimestampHelper.parseDateTime(map['createdAt']),
    );
  }
}
