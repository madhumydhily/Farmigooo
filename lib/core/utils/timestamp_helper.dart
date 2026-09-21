import 'package:cloud_firestore/cloud_firestore.dart';

/// Utility helpers for Firestore Timestamp conversion to/from DateTime.
abstract class TimestampHelper {
  /// Converts a Firestore Timestamp, ISO string, or int to a null-safe DateTime.
  static DateTime? parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is Timestamp) return value.toDate();
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value);
    if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
    return null;
  }

  /// Converts a DateTime into a Firestore Timestamp for database writes.
  static dynamic toTimestamp(DateTime? dateTime) {
    if (dateTime == null) return FieldValue.serverTimestamp();
    return Timestamp.fromDate(dateTime);
  }
}
