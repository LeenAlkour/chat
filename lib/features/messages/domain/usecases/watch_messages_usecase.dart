// lib/features/messages/domain/usecases/watch_messages_usecase.dart

import '../entities/message_entity.dart';
import '../repositories/messages_repository.dart';

class WatchMessagesUseCase {
  final MessagesRepository _repository;
  const WatchMessagesUseCase(this._repository);

  Stream<List<MessageEntity>> call(String conversationId) =>
      _repository.watchMessages(conversationId);
}