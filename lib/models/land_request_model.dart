import '../core/utils/timestamp_helper.dart';

/// Represents a farmer's lease request for a land parcel.
class LandRequestModel {
  final String requestId;
  final String landId;
  final String farmerId;
  final String ownerId;
  final String message;
  final String status; // 'pending', 'approved', 'rejected', 'cancelled'
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const LandRequestModel({
    required this.requestId,
    required this.landId,
    required this.farmerId,
    required this.ownerId,
    required this.message,
    this.status = 'pending',
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'requestId': requestId,
      'landId': landId,
      'farmerId': farmerId,
      'ownerId': ownerId,
      'message': message,
      'status': status,
      'createdAt': TimestampHelper.toTimestamp(createdAt),
      'updatedAt': TimestampHelper.toTimestamp(updatedAt),
    };
  }

  factory LandRequestModel.fromMap(Map<String, dynamic> map, [String? docId]) {
    return LandRequestModel(
      requestId: docId ?? map['requestId'] as String? ?? '',
      landId: map['landId'] as String? ?? '',
      farmerId: map['farmerId'] as String? ?? '',
      ownerId: map['ownerId'] as String? ?? '',
      message: map['message'] as String? ?? '',
      status: map['status'] as String? ?? 'pending',
      createdAt: TimestampHelper.parseDateTime(map['createdAt']),
      updatedAt: TimestampHelper.parseDateTime(map['updatedAt']),
    );
  }
}
