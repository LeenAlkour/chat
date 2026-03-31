import 'package:chato/features/conversations/data/source/conversations_remote_datasource.dart';
import 'package:chato/features/conversations/domain/repository/conversation_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/conversation_change.dart';
import '../../domain/entities/conversation_entity.dart';

class ConversationsRepositoryImpl implements ConversationsRepository {
  final ConversationsRemoteDataSource _remoteDataSource;
  final String _currentUserId;

  ConversationsRepositoryImpl({
    required ConversationsRemoteDataSource remoteDataSource,
    required String currentUserId,
  }) : _remoteDataSource = remoteDataSource,
       _currentUserId = currentUserId;

  // ─────────────────────────────
  // Fetch
  // ─────────────────────────────

  @override
  Future<Either<Failure, List<ConversationEntity>>> getConversations() async {
    try {
      final models = await _remoteDataSource.getConversations();

      final entities = models.map((m) => m.toEntity(_currentUserId)).toList();

      return Right(entities);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  // ─────────────────────────────
  // Realtime (🔥 FIX)
  // ─────────────────────────────

  @override
  Stream<Either<Failure, ConversationChange>> watchChanges() {
    return _remoteDataSource.watchChanges().asyncMap((event) async {
      try {
        return Right<Failure, ConversationChange>(event);
      } catch (e) {
        return Left<Failure, ConversationChange>(ErrorHandler.handle(e));
      }
    });
  }

  // ─────────────────────────────

  @override
  Future<void> dispose() => _remoteDataSource.dispose();
}
