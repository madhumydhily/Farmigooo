import '../core/utils/timestamp_helper.dart';

/// Represents agricultural machinery/equipment available for rental.
class MachineryModel {
  final String machineryId;
  final String ownerId;
  final String name;
  final String description;
  final String category;
  final String location;
  final double rentalPrice;
  final bool availability;
  final List<String> images;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const MachineryModel({
    required this.machineryId,
    required this.ownerId,
    required this.name,
    required this.description,
    required this.category,
    required this.location,
    required this.rentalPrice,
    this.availability = true,
    this.images = const [],
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'machineryId': machineryId,
      'ownerId': ownerId,
      'name': name,
      'description': description,
      'category': category,
      'location': location,
      'rentalPrice': rentalPrice,
      'availability': availability,
      'images': images,
      'createdAt': TimestampHelper.toTimestamp(createdAt),
      'updatedAt': TimestampHelper.toTimestamp(updatedAt),
    };
  }

  factory MachineryModel.fromMap(Map<String, dynamic> map, [String? docId]) {
    return MachineryModel(
      machineryId: docId ?? map['machineryId'] as String? ?? '',
      ownerId: map['ownerId'] as String? ?? '',
      name: map['name'] as String? ?? '',
      description: map['description'] as String? ?? '',
      category: map['category'] as String? ?? '',
      location: map['location'] as String? ?? '',
      rentalPrice: (map['rentalPrice'] as num?)?.toDouble() ?? 0.0,
      availability: map['availability'] as bool? ?? true,
      images: (map['images'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      createdAt: TimestampHelper.parseDateTime(map['createdAt']),
      updatedAt: TimestampHelper.parseDateTime(map['updatedAt']),
    );
  }
}
