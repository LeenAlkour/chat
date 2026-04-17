// lib/features/messages/domain/entities/message_entity.dart

enum MessageStatus { sent, delivered, read,pending }

enum MessageType { text, image, file, audio, call }

class MessageEntity {
  final String id;
  final String conversationId;
  final String? senderId;
  final String? content;
  final MessageType messageType;
  final String? fileUrl;
  final String? fileName;
  final int? fileSize;
  final String? thumbnailUrl;
  final MessageStatus status;
  final String? replyToId;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  const MessageEntity({
    required this.id,
    required this.conversationId,
    this.senderId,
    this.content,
    this.messageType = MessageType.text,
    this.fileUrl,
    this.fileName,
    this.fileSize,
    this.thumbnailUrl,
    this.status = MessageStatus.sent,
    this.replyToId,
    this.isDeleted = false,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isEdited => updatedAt.difference(createdAt).inSeconds > 2;

  bool get hasMedia => fileUrl != null;

  String? get fileSizeFormatted {
    if (fileSize == null) return null;
    if (fileSize! < 1024) return '${fileSize}B';
    if (fileSize! < 1024 * 1024)
      return '${(fileSize! / 1024).toStringAsFixed(1)}KB';
    return '${(fileSize! / (1024 * 1024)).toStringAsFixed(1)}MB';
  }
}
