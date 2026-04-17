
import 'package:powersync/powersync.dart';

const schema = Schema([
  // ── جداول مزامَنة مع Supabase ───────────────────────────────────────────
  Table('users', [
    Column.text('email'),
    Column.text('username'),
    Column.text('avatar_url'),
    Column.text('full_name'),
    Column.text('fcm_token'),
    Column.integer('is_online'),
    Column.text('last_seen'),
    Column.text('role'),
    Column.text('created_at'),
    Column.text('updated_at'),
  ]),

  Table('conversations', [
    Column.text('type'),
    Column.text('last_message_id'),
    Column.text('last_message_at'),
    Column.text('created_at'),
  ]),

  Table('conversation_participants', [
    Column.text('conversation_id'),
    Column.text('user_id'),
    Column.integer('unread_count'),
    Column.text('last_read_at'),
    Column.text('joined_at'),
  ]),

  Table('messages', [
    Column.text('conversation_id'),
    Column.text('sender_id'),
    Column.text('content'),
    Column.text('message_type'),
    Column.text('file_url'),
    Column.text('file_name'),
    Column.integer('file_size'),
    Column.text('thumbnail_url'),
    Column.text('status'),
    Column.text('reply_to_id'),
    Column.integer('is_deleted'),
    Column.text('created_at'),
    Column.text('updated_at'),
  ]),

  // ✅ جديد: جدول الصداقات — يُزامَن تلقائياً مع Supabase عبر PowerSync
  Table('friendships', [
    Column.text('requester_id'),
    Column.text('addressee_id'),
    Column.text('status'), // pending | accepted | rejected | blocked
    Column.text('created_at'),
    Column.text('updated_at'),
  ]),

  Table('calls', [
    Column.text('conversation_id'),
    Column.text('caller_id'),
    Column.text('callee_id'),
    Column.text('call_type'),
    Column.text('status'),
    Column.text('zego_room_id'),
    Column.text('started_at'),
    Column.text('ended_at'),
    Column.integer('duration'),
    Column.text('created_at'),
  ]),

  Table('typing_indicators', [
    Column.text('conversation_id'),
    Column.text('user_id'),
    Column.integer('is_typing'),
    Column.text('updated_at'),
  ]),

  // ── جداول محلية فقط ──────────────────────────────────────────────────────
  Table.localOnly('local_conversation_state', [
    Column.text('conversation_id'),
    Column.text('draft'),
    Column.integer('is_muted'),
    Column.real('scroll_offset'),
  ]),
]);
