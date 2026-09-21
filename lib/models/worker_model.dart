import '../core/utils/timestamp_helper.dart';

/// Represents a farm worker profile available for hire.
class WorkerModel {
  final String workerId;
  final String userId;
  final String name;
  final String phone;
  final List<String> skills;
  final String location;
  final double dailyWage;
  final bool availability;
  final double rating;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const WorkerModel({
    required this.workerId,
    required this.userId,
    required this.name,
    required this.phone,
    this.skills = const [],
    required this.location,
    required this.dailyWage,
    this.availability = true,
    this.rating = 0.0,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'workerId': workerId,
      'userId': userId,
      'name': name,
      'phone': phone,
      'skills': skills,
      'location': location,
      'dailyWage': dailyWage,
      'availability': availability,
      'rating': rating,
      'createdAt': TimestampHelper.toTimestamp(createdAt),
      'updatedAt': TimestampHelper.toTimestamp(updatedAt),
    };
  }

  factory WorkerModel.fromMap(Map<String, dynamic> map, [String? docId]) {
    return WorkerModel(
      workerId: docId ?? map['workerId'] as String? ?? '',
      userId: map['userId'] as String? ?? '',
      name: map['name'] as String? ?? '',
      phone: map['phone'] as String? ?? '',
      skills: (map['skills'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      location: map['location'] as String? ?? '',
      dailyWage: (map['dailyWage'] as num?)?.toDouble() ?? 0.0,
      availability: map['availability'] as bool? ?? true,
      rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
      createdAt: TimestampHelper.parseDateTime(map['createdAt']),
      updatedAt: TimestampHelper.parseDateTime(map['updatedAt']),
    );
  }
}
