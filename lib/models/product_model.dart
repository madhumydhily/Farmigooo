import '../core/utils/timestamp_helper.dart';

/// Represents produce or agricultural supplies in the FARMIGO Marketplace.
class ProductModel {
  final String productId;
  final String vendorId;
  final String name;
  final String description;
  final String category;
  final double price;
  final double quantity;
  final String unit;
  final List<String> images;
  final bool available;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ProductModel({
    required this.productId,
    required this.vendorId,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.quantity,
    required this.unit,
    this.images = const [],
    this.available = true,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'vendorId': vendorId,
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'quantity': quantity,
      'unit': unit,
      'images': images,
      'available': available,
      'createdAt': TimestampHelper.toTimestamp(createdAt),
      'updatedAt': TimestampHelper.toTimestamp(updatedAt),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map, [String? docId]) {
    return ProductModel(
      productId: docId ?? map['productId'] as String? ?? '',
      vendorId: map['vendorId'] as String? ?? '',
      name: map['name'] as String? ?? '',
      description: map['description'] as String? ?? '',
      category: map['category'] as String? ?? '',
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      quantity: (map['quantity'] as num?)?.toDouble() ?? 0.0,
      unit: map['unit'] as String? ?? 'kg',
      images: (map['images'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      available: map['available'] as bool? ?? true,
      createdAt: TimestampHelper.parseDateTime(map['createdAt']),
      updatedAt: TimestampHelper.parseDateTime(map['updatedAt']),
    );
  }
}
