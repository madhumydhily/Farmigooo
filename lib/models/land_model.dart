import '../core/utils/timestamp_helper.dart';

/// Represents a land parcel available for lease in FARMIGO.
class LandModel {
  final String landId;
  final String ownerId;
  final String title;
  final String description;
  final String location;
  final double area;
  final String areaUnit;
  final String soilType;
  final String waterAvailability;
  final double rentAmount;
  final bool available;
  final List<String> images;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const LandModel({
    required this.landId,
    required this.ownerId,
    required this.title,
    required this.description,
    required this.location,
    required this.area,
    required this.areaUnit,
    required this.soilType,
    required this.waterAvailability,
    required this.rentAmount,
    this.available = true,
    this.images = const [],
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'landId': landId,
      'ownerId': ownerId,
      'title': title,
      'description': description,
      'location': location,
      'area': area,
      'areaUnit': areaUnit,
      'soilType': soilType,
      'waterAvailability': waterAvailability,
      'rentAmount': rentAmount,
      'available': available,
      'images': images,
      'createdAt': TimestampHelper.toTimestamp(createdAt),
      'updatedAt': TimestampHelper.toTimestamp(updatedAt),
    };
  }

  factory LandModel.fromMap(Map<String, dynamic> map, [String? docId]) {
    return LandModel(
      landId: docId ?? map['landId'] as String? ?? '',
      ownerId: map['ownerId'] as String? ?? '',
      title: map['title'] as String? ?? '',
      description: map['description'] as String? ?? '',
      location: map['location'] as String? ?? '',
      area: (map['area'] as num?)?.toDouble() ?? 0.0,
      areaUnit: map['areaUnit'] as String? ?? 'Acres',
      soilType: map['soilType'] as String? ?? '',
      waterAvailability: map['waterAvailability'] as String? ?? '',
      rentAmount: (map['rentAmount'] as num?)?.toDouble() ?? 0.0,
      available: map['available'] as bool? ?? true,
      images: (map['images'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      createdAt: TimestampHelper.parseDateTime(map['createdAt']),
      updatedAt: TimestampHelper.parseDateTime(map['updatedAt']),
    );
  }
}
