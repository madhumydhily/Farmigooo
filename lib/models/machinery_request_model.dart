import '../core/utils/timestamp_helper.dart';

/// Represents a rental request for machinery/equipment.
class MachineryRequestModel {
  final String requestId;
  final String machineryId;
  final String requesterId;
  final String ownerId;
  final DateTime? startDate;
  final DateTime? endDate;
  final String status; // 'pending', 'approved', 'rejected', 'cancelled'
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const MachineryRequestModel({
    required this.requestId,
    required this.machineryId,
    required this.requesterId,
    required this.ownerId,
    this.startDate,
    this.endDate,
    this.status = 'pending',
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'requestId': requestId,
      'machineryId': machineryId,
      'requesterId': requesterId,
      'ownerId': ownerId,
      'startDate': TimestampHelper.toTimestamp(startDate),
      'endDate': TimestampHelper.toTimestamp(endDate),
      'status': status,
      'createdAt': TimestampHelper.toTimestamp(createdAt),
      'updatedAt': TimestampHelper.toTimestamp(updatedAt),
    };
  }

  factory MachineryRequestModel.fromMap(Map<String, dynamic> map, [String? docId]) {
    return MachineryRequestModel(
      requestId: docId ?? map['requestId'] as String? ?? '',
      machineryId: map['machineryId'] as String? ?? '',
      requesterId: map['requesterId'] as String? ?? '',
      ownerId: map['ownerId'] as String? ?? '',
      startDate: TimestampHelper.parseDateTime(map['startDate']),
      endDate: TimestampHelper.parseDateTime(map['endDate']),
      status: map['status'] as String? ?? 'pending',
      createdAt: TimestampHelper.parseDateTime(map['createdAt']),
      updatedAt: TimestampHelper.parseDateTime(map['updatedAt']),
    );
  }
}
