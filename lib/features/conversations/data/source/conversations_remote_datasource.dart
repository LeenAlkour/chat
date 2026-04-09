import 'package:chato/features/conversations/data/model/conversation_model.dart';
import 'package:powersync/powersync.dart';


class ConversationsDataSource {
  final PowerSyncDatabase _db;
  final String _userId;

  ConversationsDataSource(this._db, this._userId);

  static const _q = '''
    SELECT
      c.id,
      c.type,
      c.last_message_at,
      c.created_at,
      m.content             AS last_message_content,
      m.message_type        AS last_message_type,
      m.sender_id           AS last_message_sender_id,
      cp_me.unread_count,
      u.id                  AS other_user_id,
      u.username,
      u.avatar_url,
      u.full_name,
      u.is_online,
      u.last_seen,
      COALESCE(lo.draft, '')        AS draft,
      COALESCE(lo.is_muted, 0)      AS is_muted,
      COALESCE(lo.scroll_offset, 0) AS scroll_offset
    FROM conversations c
    JOIN conversation_participants cp_me
      ON cp_me.conversation_id = c.id
     AND cp_me.user_id = ?
    LEFT JOIN messages m
      ON m.id = c.last_message_id
    LEFT JOIN users u
      ON u.id = (
        SELECT user_id
        FROM conversation_participants
        WHERE conversation_id = c.id
          AND user_id != ?
        LIMIT 1
      )
    LEFT JOIN local_conversation_state lo
      ON lo.conversation_id = c.id
    ORDER BY c.last_message_at DESC
  ''';

  Future<List<ConversationModel>> getConversations() async {
    final result = await _db.execute(_q, [_userId, _userId]);
    return result
        .map((row) => ConversationModel.fromMap(row))
        .toList();
  }

  Stream<List<ConversationModel>> watchConversations() {
    return _db
        .watch(_q, parameters: [_userId, _userId])
        .map((result) => result
            .map((row) => ConversationModel.fromMap(row))
            .toList());
  }

  Future<void> sendMessage({
    required String conversationId,
    required String content,
    String messageType = 'text',
    String? replyToId,
  }) async {
    await _db.execute(
      '''INSERT INTO messages
           (id, conversation_id, sender_id, content, message_type, reply_to_id, status, created_at)
         VALUES
           (uuid(), ?, ?, ?, ?, ?, 'sent', datetime('now'))''',
      [conversationId, _userId, content, messageType, replyToId],
    );
  }

  Future<void> markAsRead(String conversationId) async {
    await _db.execute(
      '''UPDATE conversation_participants
         SET unread_count = 0, last_read_at = datetime('now')
         WHERE conversation_id = ? AND user_id = ?''',
      [conversationId, _userId],
    );
  }

  Future<void> saveDraft(String conversationId, String text) async {
    await _db.execute(
      '''INSERT INTO local_conversation_state (id, conversation_id, draft)
         VALUES (uuid(), ?, ?)
         ON CONFLICT (conversation_id) DO UPDATE SET draft = excluded.draft''',
      [conversationId, text],
    );
  }

  Future<void> toggleMute(String conversationId, {required bool muted}) async {
    await _db.execute(
      '''INSERT INTO local_conversation_state (id, conversation_id, is_muted)
         VALUES (uuid(), ?, ?)
         ON CONFLICT (conversation_id) DO UPDATE SET is_muted = excluded.is_muted''',
      [conversationId, muted ? 1 : 0],
    );
  }
}