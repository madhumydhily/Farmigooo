import '../core/utils/timestamp_helper.dart';

/// Represents an agricultural consultant profile in FARMIGO.
class ConsultantModel {
  final String consultantId;
  final String userId;
  final String name;
  final String specialization;
  final int experience;
  final String location;
  final String phone;
  final bool availability;
  final bool verified;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ConsultantModel({
    required this.consultantId,
    required this.userId,
    required this.name,
    required this.specialization,
    required this.experience,
    required this.location,
    required this.phone,
    this.availability = true,
    this.verified = false,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'consultantId': consultantId,
      'userId': userId,
      'name': name,
      'specialization': specialization,
      'experience': experience,
      'location': location,
      'phone': phone,
      'availability': availability,
      'verified': verified,
      'createdAt': TimestampHelper.toTimestamp(createdAt),
      'updatedAt': TimestampHelper.toTimestamp(updatedAt),
    };
  }

  factory ConsultantModel.fromMap(Map<String, dynamic> map, [String? docId]) {
    return ConsultantModel(
      consultantId: docId ?? map['consultantId'] as String? ?? '',
      userId: map['userId'] as String? ?? '',
      name: map['name'] as String? ?? '',
      specialization: map['specialization'] as String? ?? '',
      experience: (map['experience'] as num?)?.toInt() ?? 0,
      location: map['location'] as String? ?? '',
      phone: map['phone'] as String? ?? '',
      availability: map['availability'] as bool? ?? true,
      verified: map['verified'] as bool? ?? false,
      createdAt: TimestampHelper.parseDateTime(map['createdAt']),
      updatedAt: TimestampHelper.parseDateTime(map['updatedAt']),
    );
  }
}
