// lib/features/messages/domain/usecases/send_message_usecase.dart

import 'package:chato/core/errors/failure.dart';
import 'package:chato/features/messages/domain/repositories/messages_repository.dart';
import 'package:dartz/dartz.dart';
import '../entities/message_entity.dart';

// ─── params ───────────────────────────────────────────────────────

class SendTextParams {
  final String conversationId;
  final String senderId;
  final String content;
  final String? replyToId;

  const SendTextParams({
    required this.conversationId,
    required this.senderId,
    required this.content,
    this.replyToId,
  });
}

class SendMediaParams {
  final String conversationId;
  final String senderId;
  final MessageType messageType; // image|video|audio|file
  final String fileUrl;
  final String? fileName;
  final int? fileSize;
  final String? thumbnailUrl;
  final String? caption;
  final String? replyToId;

  const SendMediaParams({
    required this.conversationId,
    required this.senderId,
    required this.messageType,
    required this.fileUrl,
    this.fileName,
    this.fileSize,
    this.thumbnailUrl,
    this.caption,
    this.replyToId,
  });
}

// ─── use cases ────────────────────────────────────────────────────

class SendTextMessageUseCase {
  final MessagesRepository _repo;
  const SendTextMessageUseCase(this._repo);

  Future<Either<Failure, MessageEntity>> call(SendTextParams p) =>
      _repo.sendTextMessage(
        conversationId: p.conversationId,
        senderId: p.senderId,
        content: p.content,
        replyToId: p.replyToId,
      );
}

class SendMediaMessageUseCase {
  final MessagesRepository _repo;
  const SendMediaMessageUseCase(this._repo);

  Future<Either<Failure, MessageEntity>> call(SendMediaParams p) =>
      _repo.sendMediaMessage(
        conversationId: p.conversationId,
        senderId: p.senderId,
        messageType: p.messageType,
        fileUrl: p.fileUrl,
        fileName: p.fileName,
        fileSize: p.fileSize,
        thumbnailUrl: p.thumbnailUrl,
        caption: p.caption,
        replyToId: p.replyToId,
      );
}
