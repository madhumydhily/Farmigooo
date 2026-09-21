import 'package:flutter_test/flutter_test.dart';
import 'package:farmigo/models/user_model.dart';
import 'package:farmigo/models/land_model.dart';
import 'package:farmigo/models/land_request_model.dart';
import 'package:farmigo/models/worker_model.dart';
import 'package:farmigo/models/machinery_model.dart';
import 'package:farmigo/models/machinery_request_model.dart';
import 'package:farmigo/models/product_model.dart';
import 'package:farmigo/models/order_model.dart';
import 'package:farmigo/models/consultant_model.dart';
import 'package:farmigo/models/consultation_model.dart';
import 'package:farmigo/models/agriculture_update_model.dart';
import 'package:farmigo/models/notification_model.dart';

void main() {
  group('FARMIGO Data Models Tests', () {
    test('UserModel serialization', () {
      final now = DateTime.now();
      final user = UserModel(
        id: 'u123',
        email: 'test@farmigo.org',
        fullName: 'Jane Farmer',
        role: UserRole.farmer,
        createdAt: now,
      );
      final map = user.toMap();
      expect(map['id'], 'u123');
      expect(map['role'], 'farmer');

      final deserialized = UserModel.fromMap(map, 'u123');
      expect(deserialized.id, 'u123');
      expect(deserialized.email, 'test@farmigo.org');
      expect(deserialized.role, UserRole.farmer);
    });

    test('LandModel serialization', () {
      final land = LandModel(
        landId: 'l1',
        ownerId: 'u123',
        title: 'Green Valley Plot',
        description: 'Fertile land for organic crops',
        location: 'District 4',
        area: 12.5,
        areaUnit: 'Acres',
        soilType: 'Loam',
        waterAvailability: 'Borewell',
        rentAmount: 15000.0,
      );
      final map = land.toMap();
      final restored = LandModel.fromMap(map, 'l1');
      expect(restored.landId, 'l1');
      expect(restored.ownerId, 'u123');
      expect(restored.rentAmount, 15000.0);
    });

    test('LandRequestModel serialization', () {
      final req = LandRequestModel(
        requestId: 'lr1',
        landId: 'l1',
        farmerId: 'f1',
        ownerId: 'o1',
        message: 'Interested in 2-year lease',
      );
      final map = req.toMap();
      final restored = LandRequestModel.fromMap(map, 'lr1');
      expect(restored.requestId, 'lr1');
      expect(restored.status, 'pending');
    });

    test('WorkerModel serialization', () {
      final worker = WorkerModel(
        workerId: 'w1',
        userId: 'u456',
        name: 'John Labour',
        phone: '+1234567890',
        skills: ['Harvester', 'Tractor Driver'],
        location: 'Sector 2',
        dailyWage: 800.0,
      );
      final map = worker.toMap();
      final restored = WorkerModel.fromMap(map, 'w1');
      expect(restored.skills.length, 2);
      expect(restored.dailyWage, 800.0);
    });

    test('MachineryModel serialization', () {
      final machine = MachineryModel(
        machineryId: 'm1',
        ownerId: 'o1',
        name: 'John Deere Tractor 5050D',
        description: '50 HP Heavy Duty Tractor',
        category: 'Tractors',
        location: 'North Zone',
        rentalPrice: 2500.0,
      );
      final map = machine.toMap();
      final restored = MachineryModel.fromMap(map, 'm1');
      expect(restored.category, 'Tractors');
      expect(restored.rentalPrice, 2500.0);
    });

    test('MachineryRequestModel serialization', () {
      final mReq = MachineryRequestModel(
        requestId: 'mr1',
        machineryId: 'm1',
        requesterId: 'f1',
        ownerId: 'o1',
      );
      final map = mReq.toMap();
      final restored = MachineryRequestModel.fromMap(map, 'mr1');
      expect(restored.requestId, 'mr1');
      expect(restored.status, 'pending');
    });

    test('ProductModel serialization', () {
      final prod = ProductModel(
        productId: 'p1',
        vendorId: 'v1',
        name: 'Organic Wheat Seed',
        description: 'High yield resistant seed',
        category: 'Seeds',
        price: 450.0,
        quantity: 100.0,
        unit: 'kg',
      );
      final map = prod.toMap();
      final restored = ProductModel.fromMap(map, 'p1');
      expect(restored.price, 450.0);
      expect(restored.unit, 'kg');
    });

    test('OrderModel serialization', () {
      final order = OrderModel(
        orderId: 'ord1',
        buyerId: 'b1',
        vendorId: 'v1',
        items: [
          {'productId': 'p1', 'quantity': 2, 'price': 450.0}
        ],
        totalAmount: 900.0,
        deliveryAddress: 'Farm Gate #3',
      );
      final map = order.toMap();
      final restored = OrderModel.fromMap(map, 'ord1');
      expect(restored.totalAmount, 900.0);
      expect(restored.items.length, 1);
    });

    test('ConsultantModel serialization', () {
      final consultant = ConsultantModel(
        consultantId: 'c1',
        userId: 'u789',
        name: 'Dr. Agronomy',
        specialization: 'Crop Pathology',
        experience: 15,
        location: 'Agri University',
        phone: '+9876543210',
      );
      final map = consultant.toMap();
      final restored = ConsultantModel.fromMap(map, 'c1');
      expect(restored.experience, 15);
      expect(restored.specialization, 'Crop Pathology');
    });

    test('ConsultationModel serialization', () {
      final consultation = ConsultationModel(
        consultationId: 'cs1',
        consultantId: 'c1',
        farmerId: 'f1',
        message: 'Pest attack on rice crop',
      );
      final map = consultation.toMap();
      final restored = ConsultationModel.fromMap(map, 'cs1');
      expect(restored.consultationId, 'cs1');
      expect(restored.status, 'pending');
    });

    test('AgricultureUpdateModel serialization', () {
      final update = AgricultureUpdateModel(
        updateId: 'au1',
        title: 'PM-KISAN Scheme Update',
        description: 'New installment release details',
        category: 'Government Schemes',
        content: 'Full details of subsidy scheme...',
        authorId: 'admin1',
      );
      final map = update.toMap();
      final restored = AgricultureUpdateModel.fromMap(map, 'au1');
      expect(restored.category, 'Government Schemes');
    });

    test('NotificationModel serialization', () {
      final notif = NotificationModel(
        notificationId: 'n1',
        userId: 'u123',
        title: 'Lease Approved',
        message: 'Your request for Green Valley Plot was approved.',
        type: 'land_request',
      );
      final map = notif.toMap();
      final restored = NotificationModel.fromMap(map, 'n1');
      expect(restored.read, false);
      expect(restored.type, 'land_request');
    });
  });
}
