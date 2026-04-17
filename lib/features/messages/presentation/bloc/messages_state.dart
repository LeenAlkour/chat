// lib/features/messages/presentation/bloc/messages_state.dart

import 'package:equatable/equatable.dart';
import '../../domain/entities/message_entity.dart';

enum MessagesStatus { initial, loading, loaded, sending, error }

class MessagesState extends Equatable {
  final MessagesStatus status;
  final List<MessageEntity> messages;
  final String? errorMessage;
  final bool hasMore; // للـ pagination
  final bool isSending;
  final String? replyToId; // الرسالة المختارة للرد

  const MessagesState({
    this.status = MessagesStatus.initial,
    this.messages = const [],
    this.errorMessage,
    this.hasMore = true,
    this.isSending = false,
    this.replyToId,
  });

  MessagesState copyWith({
    MessagesStatus? status,
    List<MessageEntity>? messages,
    String? errorMessage,
    bool? hasMore,
    bool? isSending,
    String? replyToId,
    bool clearReply = false,
  }) {
    return MessagesState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      errorMessage: errorMessage ?? this.errorMessage,
      hasMore: hasMore ?? this.hasMore,
      isSending: isSending ?? this.isSending,
      replyToId: clearReply ? null : (replyToId ?? this.replyToId),
    );
  }

  @override
  List<Object?> get props => [
    status,
    messages,
    errorMessage,
    hasMore,
    isSending,
    replyToId,
  ];
}
