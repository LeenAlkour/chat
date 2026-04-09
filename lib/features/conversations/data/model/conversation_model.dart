import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/conversation_entity.dart';

part 'conversation_model.freezed.dart';

@freezed
abstract class ConversationModel with _$ConversationModel {
  const ConversationModel._();

  const factory ConversationModel({
    required String id,
    required String type,
    required String lastMessageAt,
    required String createdAt,
    String? lastMessageContent,
    String? lastMessageType,
    String? lastMessageSenderId,
    required int unreadCount,
    String? otherUserId,
    String? otherUsername,
    String? otherAvatarUrl,
    String? otherFullName,
    required int otherIsOnline,
    String? otherLastSeen,
    required String draft,
    required int isMuted,
    required double scrollOffset,
  }) = _ConversationModel;

  // ── من SQLite row مباشرة ──────────────────────────
  factory ConversationModel.fromMap(Map<String, dynamic> map) {
    return ConversationModel(
      id: map['id'] as String,
      type: map['type'] as String? ?? 'direct',
      lastMessageAt:
          map['last_message_at'] as String? ?? DateTime.now().toIso8601String(),
      createdAt:
          map['created_at'] as String? ?? DateTime.now().toIso8601String(),
      lastMessageContent: map['last_message_content'] as String?,
      lastMessageType: map['last_message_type'] as String?,
      lastMessageSenderId: map['last_message_sender_id'] as String?,
      unreadCount: (map['unread_count'] as num?)?.toInt() ?? 0,
      otherUserId: map['other_user_id'] as String?,
      otherUsername: map['username'] as String?,
      otherAvatarUrl: map['avatar_url'] as String?,
      otherFullName: map['full_name'] as String?,
      otherIsOnline: (map['is_online'] as num?)?.toInt() ?? 0,
      otherLastSeen: map['last_seen'] as String?,
      draft: map['draft'] as String? ?? '',
      isMuted: (map['is_muted'] as num?)?.toInt() ?? 0,
      scrollOffset: (map['scroll_offset'] as num?)?.toDouble() ?? 0.0,
    );
  }

  // ── toEntity ──────────────────────────────────────
  ConversationEntity toEntity() {
    return ConversationEntity(
      id: id,
      type: type,
      lastMessageAt: DateTime.parse(lastMessageAt),
      createdAt: DateTime.parse(createdAt),
      lastMessageContent: lastMessageContent,
      lastMessageType: lastMessageType,
      lastMessageSenderId: lastMessageSenderId,
      unreadCount: unreadCount,
      otherUserId: otherUserId,
      otherUsername: otherUsername,
      otherAvatarUrl: otherAvatarUrl,
      otherFullName: otherFullName,
      otherIsOnline: otherIsOnline == 1,
      otherLastSeen: otherLastSeen != null
          ? DateTime.tryParse(otherLastSeen!)
          : null,
      draft: draft,
      isMuted: isMuted == 1,
      scrollOffset: scrollOffset,
    );
  }

  // ── fromEntity (لو احتجت تحويل عكسي مثلاً للـ cache) ──
  factory ConversationModel.fromEntity(ConversationEntity entity) {
    return ConversationModel(
      id: entity.id,
      type: entity.type,
      lastMessageAt: entity.lastMessageAt.toIso8601String(),
      createdAt: entity.createdAt.toIso8601String(),
      lastMessageContent: entity.lastMessageContent,
      lastMessageType: entity.lastMessageType,
      lastMessageSenderId: entity.lastMessageSenderId,
      unreadCount: entity.unreadCount,
      otherUserId: entity.otherUserId,
      otherUsername: entity.otherUsername,
      otherAvatarUrl: entity.otherAvatarUrl,
      otherFullName: entity.otherFullName,
      otherIsOnline: entity.otherIsOnline ? 1 : 0,
      otherLastSeen: entity.otherLastSeen?.toIso8601String(),
      draft: entity.draft,
      isMuted: entity.isMuted ? 1 : 0,
      scrollOffset: entity.scrollOffset,
    );
  }
}
