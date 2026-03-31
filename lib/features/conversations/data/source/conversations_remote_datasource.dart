import 'dart:async';

import 'package:chato/features/conversations/data/model/conversation_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/conversation_change.dart';

abstract class ConversationsRemoteDataSource {
  Future<List<ConversationModel>> getConversations();
  Stream<ConversationChange> watchChanges();
  Future<void> dispose();
}

class SupabaseConversationsDataSource implements ConversationsRemoteDataSource {
  final SupabaseClient _supabase;

  RealtimeChannel? _channel;

  final Set<String> _myConversationIds = {};

  SupabaseConversationsDataSource(this._supabase);

  String get _currentUserId {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) {
      throw const AuthException('User not authenticated');
    }
    return userId;
  }

  static const _conversationsQuery = '''
    id,
    type,
    last_message_id,
    last_message_at,
    created_at,
    conversation_participants(
      id,
      conversation_id,
      user_id,
      unread_count,
      last_read_at,
      joined_at,
      user:users(
        id,
        username,
        avatar_url,
        full_name,
        is_online,
        last_seen
      )
    ),
    last_message:messages!fk_last_message(
      id,
      content,
      message_type
    )
  ''';

  // ─────────────────────────────────────────────

  @override
  Future<List<ConversationModel>> getConversations() async {
    final userId = _currentUserId;

    final participations = await _supabase
        .from('conversation_participants')
        .select('conversation_id')
        .eq('user_id', userId);

    final ids = (participations as List)
        .map((row) => row['conversation_id'] as String)
        .toList();

    if (ids.isEmpty) return [];

    _myConversationIds
      ..clear()
      ..addAll(ids);

    final response = await _supabase
        .from('conversations')
        .select(_conversationsQuery)
        .inFilter('id', ids)
        .order('last_message_at', ascending: false);

    return (response as List)
        .map((json) => _mapToModel(json as Map<String, dynamic>))
        .toList();
  }

  // ─────────────────────────────────────────────

  @override
  Stream<ConversationChange> watchChanges() {
    final userId = _currentUserId;
    final controller = StreamController<ConversationChange>.broadcast();

    _channel?.unsubscribe();

    _channel = _supabase
        .channel('conversations_realtime_$userId')
        // ✅ رسالة جديدة
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'messages',
          callback: (payload) => _onNewMessage(payload, userId, controller),
        )
        // ✅ unread_count
        .onPostgresChanges(
          event: PostgresChangeEvent.update,
          schema: 'public',
          table: 'conversation_participants',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'user_id',
            value: userId,
          ),
          callback: (payload) => _onParticipantUpdated(payload, controller),
        )
        // ✅ 🟢 محادثة جديدة (الحل)
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'conversation_participants',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'user_id',
            value: userId,
          ),
          callback: (payload) => _onNewConversation(payload, controller),
        )
        // ✅ حالة المستخدم
        .onPostgresChanges(
          event: PostgresChangeEvent.update,
          schema: 'public',
          table: 'users',
          callback: (payload) => _onUserPresenceChanged(payload, controller),
        )
        .subscribe();

    controller.onCancel = () {
      _channel?.unsubscribe();
      _channel = null;
    };

    return controller.stream;
  }

  // ─────────────────────────────────────────────
  // Handlers
  // ─────────────────────────────────────────────

  Future<void> _onNewMessage(
    PostgresChangePayload payload,
    String currentUserId,
    StreamController<ConversationChange> controller,
  ) async {
    try {
      final row = payload.newRecord;
      final senderId = row['sender_id'] as String?;
      final conversationId = row['conversation_id'] as String?;

      if (conversationId == null) return;

      if (_myConversationIds.isEmpty) {
        final isMember = await _isParticipant(conversationId, currentUserId);
        if (!isMember) return;
        _myConversationIds.add(conversationId);
      } else {
        if (!_myConversationIds.contains(conversationId)) return;
      }

      controller.add(
        ConversationChange.newMessage(
          conversationId: conversationId,
          content: row['content'] as String? ?? '',
          messageType: row['message_type'] as String? ?? 'text',
          sentAt: DateTime.parse(row['created_at'] as String),
          senderId: senderId ?? '',
        ),
      );
    } catch (_) {}
  }

  void _onParticipantUpdated(
    PostgresChangePayload payload,
    StreamController<ConversationChange> controller,
  ) {
    final row = payload.newRecord;
    final conversationId = row['conversation_id'] as String?;
    final unreadCount = row['unread_count'] as int?;

    if (conversationId == null || unreadCount == null) return;

    controller.add(
      ConversationChange.unreadCountChanged(
        conversationId: conversationId,
        unreadCount: unreadCount,
      ),
    );
  }

  // 🟢 الحل الحقيقي هنا
  Future<void> _onNewConversation(
    PostgresChangePayload payload,
    StreamController<ConversationChange> controller,
  ) async {
    try {
      final row = payload.newRecord;
      final conversationId = row['conversation_id'] as String?;

      if (conversationId == null) return;

      _myConversationIds.add(conversationId);

      final response = await _supabase
          .from('conversations')
          .select(_conversationsQuery)
          .eq('id', conversationId)
          .maybeSingle();

      if (response == null) return;

      final conversation = _mapToModel(response);

      controller.add(ConversationChange.conversationAdded(conversation));
    } catch (_) {}
  }

  void _onUserPresenceChanged(
    PostgresChangePayload payload,
    StreamController<ConversationChange> controller,
  ) {
    final row = payload.newRecord;
    final userId = row['id'] as String?;
    final isOnline = row['is_online'] as bool?;
    final lastSeenRaw = row['last_seen'] as String?;

    if (userId == null || isOnline == null || lastSeenRaw == null) {
      return;
    }

    controller.add(
      ConversationChange.userPresenceChanged(
        userId: userId,
        isOnline: isOnline,
        lastSeen: DateTime.parse(lastSeenRaw),
      ),
    );
  }

  // ─────────────────────────────────────────────

  Future<bool> _isParticipant(String conversationId, String userId) async {
    try {
      final result = await _supabase
          .from('conversation_participants')
          .select('id')
          .eq('conversation_id', conversationId)
          .eq('user_id', userId)
          .maybeSingle();
      return result != null;
    } catch (_) {
      return false;
    }
  }

  ConversationModel _mapToModel(Map<String, dynamic> json) {
    final raw = json['last_message'];

    Map<String, dynamic>? lastMsg;
    if (raw is List && raw.isNotEmpty) {
      lastMsg = raw[0] as Map<String, dynamic>?;
    } else if (raw is Map<String, dynamic>) {
      lastMsg = raw;
    }

    if (lastMsg != null) {
      json['last_message_content'] = lastMsg['content'];
      json['last_message_type'] = lastMsg['message_type'];
    }

    json.remove('last_message');

    return ConversationModel.fromJson(json);
  }

  // ─────────────────────────────────────────────

  @override
  Future<void> dispose() async {
    await _channel?.unsubscribe();
    _channel = null;
    _myConversationIds.clear();
  }
}
