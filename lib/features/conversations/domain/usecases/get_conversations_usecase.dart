import 'package:chato/features/conversations/domain/repository/conversation_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/conversation_change.dart';
import '../entities/conversation_entity.dart';

class GetConversationsUseCase {
  final ConversationsRepository _repository;
  GetConversationsUseCase(this._repository);

  Future<Either<Failure, List<ConversationEntity>>> call() =>
      _repository.getConversations();
}

class WatchConversationChangesUseCase {
  final ConversationsRepository _repository;
  WatchConversationChangesUseCase(this._repository);

  Stream<Either<Failure, ConversationChange>> call() =>
      _repository.watchChanges();
}
