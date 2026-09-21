import 'package:flutter_test/flutter_test.dart';
import 'package:farmigo/core/errors/app_exception.dart';
import 'package:farmigo/models/notification_model.dart';

void main() {
  group('FARMIGO Services Layer Tests', () {
    test('AppException message mapping', () {
      const ex = AppException('Test error message', code: 'test-code');
      expect(ex.message, 'Test error message');
      expect(ex.code, 'test-code');
      expect(ex.toString(), 'Test error message');
    });

    test('NotificationModel instantiation for triggers', () {
      final notif = NotificationModel(
        notificationId: 'n1',
        userId: 'owner123',
        title: 'New Land Lease Request',
        message: 'A farmer submitted a lease request.',
        type: 'land_request',
        relatedId: 'req456',
        createdAt: DateTime.now(),
      );

      expect(notif.userId, 'owner123');
      expect(notif.type, 'land_request');
      expect(notif.read, false);
    });
  });
}
