import 'package:chato/features/conversations/data/source/conversations_remote_datasource.dart';
import 'package:chato/features/conversations/domain/repository/conversation_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/conversation_entity.dart';

class ConversationsRepositoryImpl implements ConversationsRepository {
  final ConversationsDataSource _dataSource;

  ConversationsRepositoryImpl({required ConversationsDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Either<Failure, List<ConversationEntity>>> getConversations() async {
    try {
      final models = await _dataSource.getConversations();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Stream<Either<Failure, List<ConversationEntity>>> watchConversations() {
    return _dataSource
        .watchConversations()
        .map<Either<Failure, List<ConversationEntity>>>(
          (models) => Right(models.map((m) => m.toEntity()).toList()),
        )
        .handleError(
          (e) => Left<Failure, List<ConversationEntity>>(
            ErrorHandler.handle(e),
          ),
        );
  }

  @override
  Future<Either<Failure, void>> sendMessage({
    required String conversationId,
    required String content,
    String messageType = 'text',
    String? replyToId,
  }) async {
    try {
      await _dataSource.sendMessage(
        conversationId: conversationId,
        content: content,
        messageType: messageType,
        replyToId: replyToId,
      );
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> markAsRead(String conversationId) async {
    try {
      await _dataSource.markAsRead(conversationId);
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> saveDraft(
    String conversationId,
    String text,
  ) async {
    try {
      await _dataSource.saveDraft(conversationId, text);
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> toggleMute(
    String conversationId, {
    required bool muted,
  }) async {
    try {
      await _dataSource.toggleMute(conversationId, muted: muted);
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}