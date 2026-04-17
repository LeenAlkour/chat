// lib/features/messages/data/datasources/messages_datasource.dart

import 'package:powersync/powersync.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/message_entity.dart';
import '../models/message_model.dart';

class MessagesDataSource {
  final PowerSyncDatabase _db;
  final _uuid = const Uuid();

  MessagesDataSource(this._db);

  // ─── Watch ────────────────────────────────────────────────────
  Stream<List<MessageModel>> watchMessages(String conversationId) {
    return _db
        .watch(
          '''
          SELECT * FROM messages
          WHERE conversation_id = ?
            AND is_deleted = 0
          ORDER BY created_at ASC
          ''',
          parameters: [conversationId],
        )
        .map((rows) => rows.map(MessageModel.fromMap).toList());
  }

  // ─── Get paginated ────────────────────────────────────────────
  Future<List<MessageModel>> getMessages(
    String conversationId, {
    int limit = 50,
    String? beforeId,
  }) async {
    if (beforeId != null) {
      final cursor = await _db.get(
        'SELECT created_at FROM messages WHERE id = ?',
        [beforeId],
      );
      final cursorTime = cursor['created_at'] as String;

      final rows = await _db.getAll(
        '''
        SELECT * FROM messages
        WHERE conversation_id = ?
          AND is_deleted = 0
          AND created_at < ?
        ORDER BY created_at DESC
        LIMIT ?
        ''',
        [conversationId, cursorTime, limit],
      );
      return rows.map(MessageModel.fromMap).toList().reversed.toList();
    }

    final rows = await _db.getAll(
      '''
      SELECT * FROM messages
      WHERE conversation_id = ?
        AND is_deleted = 0
      ORDER BY created_at DESC
      LIMIT ?
      ''',
      [conversationId, limit],
    );
    return rows.map(MessageModel.fromMap).toList().reversed.toList();
  }

  // ─── Send Text ────────────────────────────────────────────────
  Future<MessageModel> sendTextMessage({
    required String conversationId,
    required String senderId,
    required String content,
    String? replyToId,
  }) async {
    return _insertMessage(
      conversationId: conversationId,
      senderId: senderId,
      content: content,
      messageType: MessageType.text,
      replyToId: replyToId,
    );
  }

  // ─── Send Media (image / video / audio / file) ────────────────
  Future<MessageModel> sendMediaMessage({
    required String conversationId,
    required String senderId,
    required MessageType messageType,
    required String fileUrl,
    String? fileName,
    int? fileSize,
    String? thumbnailUrl,
    String? content, // caption اختياري
    String? replyToId,
  }) async {
    return _insertMessage(
      conversationId: conversationId,
      senderId: senderId,
      content: content,
      messageType: messageType,
      fileUrl: fileUrl,
      fileName: fileName,
      fileSize: fileSize,
      thumbnailUrl: thumbnailUrl,
      replyToId: replyToId,
    );
  }

  // ─── Send Call record ─────────────────────────────────────────
  Future<MessageModel> sendCallMessage({
    required String conversationId,
    required String senderId,
    required String callSummary, // مثل "Voice call · 5:23"
  }) async {
    return _insertMessage(
      conversationId: conversationId,
      senderId: senderId,
      content: callSummary,
      messageType: MessageType.call,
    );
  }

  // ─── Core Insert ──────────────────────────────────────────────
  Future<MessageModel> _insertMessage({
    required String conversationId,
    required String senderId,
    required MessageType messageType,
    String? content,
    String? fileUrl,
    String? fileName,
    int? fileSize,
    String? thumbnailUrl,
    String? replyToId,
  }) async {
    final id = _uuid.v4();
    final now = DateTime.now().toUtc().toIso8601String();
final initialStatus = _db.connected ? 'sent' : 'pending';

    await _db.execute(
      '''
      INSERT INTO messages (
        id, conversation_id, sender_id,
        content, message_type,
        file_url, file_name, file_size, thumbnail_url,
        status, reply_to_id, is_deleted,
        created_at, updated_at
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,'$initialStatus', ?, 0, ?, ?)
      ''',
      [
        id,
        conversationId,
        senderId,
        content,
        messageType.name,
        fileUrl,
        fileName,
        fileSize,
        thumbnailUrl,
        replyToId,
        now,
        now,
      ],
    );
    

    // آخر رسالة في المحادثة
    await _db.execute(
      '''
      UPDATE conversations
      SET last_message_id = ?, last_message_at = ?
      WHERE id = ?
      ''',
      [id, now, conversationId],
    );

    return MessageModel(
      id: id,
      conversationId: conversationId,
      senderId: senderId,
      content: content,
      messageType: messageType.name,
      fileUrl: fileUrl,
      fileName: fileName,
      fileSize: fileSize,
      thumbnailUrl: thumbnailUrl,
      status: 'sent',
      replyToId: replyToId,
      isDeleted: false,
      createdAt: now,
      updatedAt: now,
    );
  }

  // ─── Soft Delete ──────────────────────────────────────────────
  Future<void> deleteMessage(String messageId) async {
    final now = DateTime.now().toUtc().toIso8601String();
    await _db.execute(
      'UPDATE messages SET is_deleted = 1, updated_at = ? WHERE id = ?',
      [now, messageId],
    );
  }

  // ─── Edit (text only) ─────────────────────────────────────────
  Future<void> editMessage({
    required String messageId,
    required String newContent,
  }) async {
    final now = DateTime.now().toUtc().toIso8601String();
    await _db.execute(
      'UPDATE messages SET content = ?, updated_at = ? WHERE id = ?',
      [newContent, now, messageId],
    );
  }

  // ─── Mark read ────────────────────────────────────────────────
  Future<void> markConversationAsRead(
    String conversationId,
    String userId,
  ) async {
    final now = DateTime.now().toUtc().toIso8601String();
    await _db.execute(
      '''
      UPDATE conversation_participants
      SET last_read_at = ?, unread_count = 0
      WHERE conversation_id = ? AND user_id = ?
      ''',
      [now, conversationId, userId],
    );
  }
}
