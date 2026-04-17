// lib/features/messages/domain/usecases/delete_message_usecase.dart

import 'package:chato/core/errors/failure.dart';
import 'package:chato/features/messages/domain/repositories/messages_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteMessageUseCase {
  final MessagesRepository _repository;
  const DeleteMessageUseCase(this._repository);

  Future<Either<Failure, void>> call(String messageId) =>
      _repository.deleteMessage(messageId);
}
