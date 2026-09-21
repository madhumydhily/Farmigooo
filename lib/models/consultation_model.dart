import '../core/utils/timestamp_helper.dart';

/// Represents an advisory consultation booking between a farmer and consultant.
class ConsultationModel {
  final String consultationId;
  final String consultantId;
  final String farmerId;
  final String message;
  final DateTime? scheduledAt;
  final String status; // 'pending', 'scheduled', 'completed', 'cancelled'
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ConsultationModel({
    required this.consultationId,
    required this.consultantId,
    required this.farmerId,
    required this.message,
    this.scheduledAt,
    this.status = 'pending',
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'consultationId': consultationId,
      'consultantId': consultantId,
      'farmerId': farmerId,
      'message': message,
      'scheduledAt': TimestampHelper.toTimestamp(scheduledAt),
      'status': status,
      'createdAt': TimestampHelper.toTimestamp(createdAt),
      'updatedAt': TimestampHelper.toTimestamp(updatedAt),
    };
  }

  factory ConsultationModel.fromMap(Map<String, dynamic> map, [String? docId]) {
    return ConsultationModel(
      consultationId: docId ?? map['consultationId'] as String? ?? '',
      consultantId: map['consultantId'] as String? ?? '',
      farmerId: map['farmerId'] as String? ?? '',
      message: map['message'] as String? ?? '',
      scheduledAt: TimestampHelper.parseDateTime(map['scheduledAt']),
      status: map['status'] as String? ?? 'pending',
      createdAt: TimestampHelper.parseDateTime(map['createdAt']),
      updatedAt: TimestampHelper.parseDateTime(map['updatedAt']),
    );
  }
}
