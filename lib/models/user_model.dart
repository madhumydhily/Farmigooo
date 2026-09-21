import '../core/utils/timestamp_helper.dart';

/// Stakeholder roles supported in the FARMIGO unified platform.
enum UserRole {
  farmer,
  landowner,
  worker,
  machineryProvider,
  consultant,
  marketplaceBuyer,
  marketplaceSeller,
}

extension UserRoleExtension on UserRole {
  String get displayName {
    switch (this) {
      case UserRole.farmer:
        return 'Farmer';
      case UserRole.landowner:
        return 'Landowner';
      case UserRole.worker:
        return 'Farm Worker';
      case UserRole.machineryProvider:
        return 'Machinery Provider';
      case UserRole.consultant:
        return 'Agri Consultant';
      case UserRole.marketplaceBuyer:
        return 'Marketplace Buyer';
      case UserRole.marketplaceSeller:
        return 'Produce Seller';
    }
  }
}

/// Core User entity model for FARMIGO.
class UserModel {
  final String id;
  final String email;
  final String fullName;
  final String? phoneNumber;
  final UserRole role;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    this.phoneNumber,
    required this.role,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'role': role.name,
      'createdAt': TimestampHelper.toTimestamp(createdAt),
      'updatedAt': TimestampHelper.toTimestamp(updatedAt),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map, [String? docId]) {
    return UserModel(
      id: docId ?? map['id'] as String? ?? '',
      email: map['email'] as String? ?? '',
      fullName: map['fullName'] as String? ?? '',
      phoneNumber: map['phoneNumber'] as String?,
      role: UserRole.values.firstWhere(
        (r) => r.name == map['role'],
        orElse: () => UserRole.farmer,
      ),
      createdAt: TimestampHelper.parseDateTime(map['createdAt']),
      updatedAt: TimestampHelper.parseDateTime(map['updatedAt']),
    );
  }
}
