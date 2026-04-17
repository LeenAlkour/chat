// lib/features/messages/data/repositories/messages_repository_impl.dart

import 'package:chato/core/errors/error_handler.dart';
import 'package:chato/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/repositories/messages_repository.dart';
import '../datasources/messages_datasource.dart';

class MessagesRepositoryImpl implements MessagesRepository {
  final MessagesDataSource _dataSource;

  const MessagesRepositoryImpl(this._dataSource);

  @override
  Stream<List<MessageEntity>> watchMessages(String conversationId) =>
      _dataSource
          .watchMessages(conversationId)
          .map((models) => models.map((m) => m.toEntity()).toList());

  @override
  Future<Either<Failure, List<MessageEntity>>> getMessages(
    String conversationId, {
    int limit = 50,
    String? beforeId,
  }) async {
    try {
      final models = await _dataSource.getMessages(
        conversationId,
        limit: limit,
        beforeId: beforeId,
      );
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteMessage(String messageId) async {
    try {
      await _dataSource.deleteMessage(messageId);
      return Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> editMessage({
    required String messageId,
    required String newContent,
  }) async {
    try {
      await _dataSource.editMessage(
        messageId: messageId,
        newContent: newContent,
      );
      return Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> markConversationAsRead(
    String conversationId,
    String userId,
  ) async {
    try {
      await _dataSource.markConversationAsRead(conversationId, userId);
      return Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
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
  }) async {
    try {
      final model = await _dataSource.sendMediaMessage(
        fileUrl: fileUrl,
        conversationId: conversationId,
        senderId: senderId,
        content: fileUrl,
        messageType: messageType,
        replyToId: replyToId,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> sendTextMessage({
    required String conversationId,
    required String senderId,
    required String content,
    String? replyToId,
  }) async {
    try {
      final model = await _dataSource.sendTextMessage(
        conversationId: conversationId,
        senderId: senderId,
        content: content,
        replyToId: replyToId,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
