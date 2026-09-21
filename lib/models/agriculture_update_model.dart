import '../core/utils/timestamp_helper.dart';

/// Represents a news post, advisory update, or scheme alert in FARMIGO.
class AgricultureUpdateModel {
  final String updateId;
  final String title;
  final String description;
  final String category;
  final String content;
  final String? imageUrl;
  final String authorId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const AgricultureUpdateModel({
    required this.updateId,
    required this.title,
    required this.description,
    required this.category,
    required this.content,
    this.imageUrl,
    required this.authorId,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'updateId': updateId,
      'title': title,
      'description': description,
      'category': category,
      'content': content,
      'imageUrl': imageUrl,
      'authorId': authorId,
      'createdAt': TimestampHelper.toTimestamp(createdAt),
      'updatedAt': TimestampHelper.toTimestamp(updatedAt),
    };
  }

  factory AgricultureUpdateModel.fromMap(Map<String, dynamic> map, [String? docId]) {
    return AgricultureUpdateModel(
      updateId: docId ?? map['updateId'] as String? ?? '',
      title: map['title'] as String? ?? '',
      description: map['description'] as String? ?? '',
      category: map['category'] as String? ?? '',
      content: map['content'] as String? ?? '',
      imageUrl: map['imageUrl'] as String?,
      authorId: map['authorId'] as String? ?? '',
      createdAt: TimestampHelper.parseDateTime(map['createdAt']),
      updatedAt: TimestampHelper.parseDateTime(map['updatedAt']),
    );
  }
}
