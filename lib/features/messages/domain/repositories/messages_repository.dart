// lib/features/messages/domain/repositories/messages_repository.dart

import 'package:chato/core/errors/failure.dart';
import 'package:chato/features/messages/domain/entities/message_entity.dart';
import 'package:dartz/dartz.dart';
// lib/features/messages/domain/repositories/messages_repository.dart

abstract class MessagesRepository {
  Stream<List<MessageEntity>> watchMessages(String conversationId);

  Future<Either<Failure, List<MessageEntity>>> getMessages(
    String conversationId, {
    int limit,
    String? beforeId,
  });

  Future<Either<Failure, MessageEntity>> sendTextMessage({
    required String conversationId,
    required String senderId,
    required String content,
    String? replyToId,
  });

  Future<Either<Failure, MessageEntity>> sendMediaMessage({
    required String conversationId,
    required String senderId,
    required MessageType messageType,
    required String fileUrl,
    String? fileName,
    int? fileSize,
    String? thumbnailUrl,
    String? caption,
    String? replyToId,
  });

  Future<Either<Failure, void>> deleteMessage(String messageId);
  Future<Either<Failure, void>> editMessage({
    required String messageId,
    required String newContent,
  });
  Future<Either<Failure, void>> markConversationAsRead(
    String conversationId,
    String userId,
  );
}
