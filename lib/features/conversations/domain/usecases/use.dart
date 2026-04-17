import 'package:chato/features/conversations/domain/repository/conversation_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/conversation_entity.dart';

class GetConversationsUseCase {
  final ConversationsRepository _repository;
  GetConversationsUseCase(this._repository);

  Future<Either<Failure, List<ConversationEntity>>> call() =>
      _repository.getConversations();
}

class WatchConversationsUseCase {
  final ConversationsRepository _repository;
  WatchConversationsUseCase(this._repository);

  Stream<Either<Failure, List<ConversationEntity>>> call() =>
      _repository.watchConversations();
}



class MarkAsReadUseCase {
  final ConversationsRepository _repository;
  MarkAsReadUseCase(this._repository);

  Future<Either<Failure, void>> call(String conversationId) =>
      _repository.markAsRead(conversationId);
}
