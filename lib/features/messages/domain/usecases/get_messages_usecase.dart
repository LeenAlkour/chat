// lib/features/messages/domain/usecases/get_messages_usecase.dart

import 'package:chato/core/errors/failure.dart';
import 'package:chato/features/messages/domain/entities/message_entity.dart';
import 'package:chato/features/messages/domain/repositories/messages_repository.dart';
import 'package:dartz/dartz.dart';

class GetMessagesUseCase {
  final MessagesRepository _repository;
  const GetMessagesUseCase(this._repository);

  Future<Either<Failure, List<MessageEntity>>> call(
    String conversationId, {
    int limit = 50,
    String? beforeId,
  }) =>
      _repository.getMessages(conversationId, limit: limit, beforeId: beforeId);
}
