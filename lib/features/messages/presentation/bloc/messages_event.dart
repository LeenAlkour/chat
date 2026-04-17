// lib/features/messages/presentation/bloc/messages_event.dart

import 'package:equatable/equatable.dart';
import '../../domain/entities/message_entity.dart';

abstract class MessagesEvent extends Equatable {
  const MessagesEvent();
  @override
  List<Object?> get props => [];
}

class WatchMessagesStarted extends MessagesEvent {
  final String conversationId;
  const WatchMessagesStarted(this.conversationId);
  @override
  List<Object?> get props => [conversationId];
}

class MessagesUpdated extends MessagesEvent {
  final List<MessageEntity> messages;
  const MessagesUpdated(this.messages);
  @override
  List<Object?> get props => [messages];
}

class LoadMoreMessages extends MessagesEvent {
  final String conversationId;
  const LoadMoreMessages(this.conversationId);
  @override
  List<Object?> get props => [conversationId];
}

class SendTextRequested extends MessagesEvent {
  final String conversationId;
  final String senderId;
  final String content;
  final String? replyToId;

  const SendTextRequested({
    required this.conversationId,
    required this.senderId,
    required this.content,
    this.replyToId,
  });
}

class SendMediaRequested extends MessagesEvent {
  final String conversationId;
  final String senderId;
  final MessageType messageType;
  final String fileUrl;
  final String? fileName;
  final int? fileSize;
  final String? thumbnailUrl;
  final String? caption;
  final String? replyToId;

  const SendMediaRequested({
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

class DeleteMessageRequested extends MessagesEvent {
  final String messageId;
  const DeleteMessageRequested(this.messageId);
  @override
  List<Object?> get props => [messageId];
}

class ReplyToMessageSelected extends MessagesEvent {
  final String? messageId;
  const ReplyToMessageSelected(this.messageId);
  @override
  List<Object?> get props => [messageId];
}

class MarkAsReadRequested extends MessagesEvent {
  final String conversationId;
  final String userId;
  const MarkAsReadRequested(this.conversationId, this.userId);
  @override
  List<Object?> get props => [conversationId, userId];
}
