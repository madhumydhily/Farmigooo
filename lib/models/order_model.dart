import '../core/utils/timestamp_helper.dart';

/// Represents a marketplace produce order placed by a buyer.
class OrderModel {
  final String orderId;
  final String buyerId;
  final String vendorId;
  final List<Map<String, dynamic>> items;
  final double totalAmount;
  final String deliveryAddress;
  final String status; // 'pending', 'confirmed', 'shipped', 'delivered', 'cancelled'
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const OrderModel({
    required this.orderId,
    required this.buyerId,
    required this.vendorId,
    required this.items,
    required this.totalAmount,
    required this.deliveryAddress,
    this.status = 'pending',
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'buyerId': buyerId,
      'vendorId': vendorId,
      'items': items,
      'totalAmount': totalAmount,
      'deliveryAddress': deliveryAddress,
      'status': status,
      'createdAt': TimestampHelper.toTimestamp(createdAt),
      'updatedAt': TimestampHelper.toTimestamp(updatedAt),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map, [String? docId]) {
    return OrderModel(
      orderId: docId ?? map['orderId'] as String? ?? '',
      buyerId: map['buyerId'] as String? ?? '',
      vendorId: map['vendorId'] as String? ?? '',
      items: (map['items'] as List<dynamic>?)
              ?.map((e) => Map<String, dynamic>.from(e as Map))
              .toList() ??
          [],
      totalAmount: (map['totalAmount'] as num?)?.toDouble() ?? 0.0,
      deliveryAddress: map['deliveryAddress'] as String? ?? '',
      status: map['status'] as String? ?? 'pending',
      createdAt: TimestampHelper.parseDateTime(map['createdAt']),
      updatedAt: TimestampHelper.parseDateTime(map['updatedAt']),
    );
  }
}
