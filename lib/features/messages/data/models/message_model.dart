// lib/features/messages/data/models/message_model.dart

import '../../domain/entities/message_entity.dart';

class MessageModel {
  final String id;
  final String conversationId;
  final String? senderId;
  final String? content;
  final String messageType;
  final String? fileUrl;
  final String? fileName;
  final int? fileSize;
  final String? thumbnailUrl;
  final String status;
  final String? replyToId;
  final bool isDeleted;
  final String createdAt; // ISO 8601 — PowerSync يحفظها كـ text
  final String updatedAt;

  const MessageModel({
    required this.id,
    required this.conversationId,
    this.senderId,
    this.content,
    required this.messageType,
    this.fileUrl,
    this.fileName,
    this.fileSize,
    this.thumbnailUrl,
    required this.status,
    this.replyToId,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as String,
      conversationId: map['conversation_id'] as String,
      senderId: map['sender_id'] as String?,
      content: map['content'] as String?,
      messageType: map['message_type'] as String? ?? 'text',
      fileUrl: map['file_url'] as String?,
      fileName: map['file_name'] as String?,
      fileSize: map['file_size'] as int?,
      thumbnailUrl: map['thumbnail_url'] as String?,
      status: map['status'] as String? ?? 'sent',
      replyToId: map['reply_to_id'] as String?,
      isDeleted:
          (map['is_deleted'] == true ||
          map['is_deleted'] == 1 ||
          map['is_deleted'] == 'true'),
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
    );
  }

  MessageEntity toEntity() {
    return MessageEntity(
      id: id,
      conversationId: conversationId,
      senderId: senderId,
      content: content,
      messageType: _typeFrom(messageType),
      fileUrl: fileUrl,
      fileName: fileName,
      fileSize: fileSize,
      thumbnailUrl: thumbnailUrl,
      status: _statusFrom(status),
      replyToId: replyToId,
      isDeleted: isDeleted,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
    );
  }

  static MessageModel fromEntity(MessageEntity e) => MessageModel(
    id: e.id,
    conversationId: e.conversationId,
    senderId: e.senderId,
    content: e.content,
    messageType: e.messageType.name,
    fileUrl: e.fileUrl,
    fileName: e.fileName,
    fileSize: e.fileSize,
    thumbnailUrl: e.thumbnailUrl,
    status: e.status.name,
    replyToId: e.replyToId,
    isDeleted: e.isDeleted,
    createdAt: e.createdAt.toIso8601String(),
    updatedAt: e.updatedAt.toIso8601String(),
  );

  static MessageType _typeFrom(String v) => MessageType.values.firstWhere(
    (e) => e.name == v,
    orElse: () => MessageType.text,
  );

  static MessageStatus _statusFrom(String v) => MessageStatus.values.firstWhere(
    (e) => e.name == v,
    orElse: () => MessageStatus.sent,
  );
}
