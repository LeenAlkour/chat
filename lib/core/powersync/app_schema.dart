import 'package:powersync/powersync.dart';

/// Schema يطابق جداول Supabase بالضبط
/// كل عمود هنا = عمود في Supabase (عدا id — PowerSync يتولاه تلقائياً)
const schema = Schema([
  // ── جداول مزامَنة مع Supabase ───────────────────────────────────────────

  Table('users', [
    Column.text('email'),
    Column.text('username'),
    Column.text('avatar_url'),
    Column.text('full_name'),
    Column.text('fcm_token'),
    Column.integer('is_online'),   // bool → integer في SQLite
    Column.text('last_seen'),
    Column.text('role'),
    Column.text('created_at'),
    Column.text('updated_at'),
  ]),

  Table('conversations', [
    Column.text('type'),           // 'direct' | 'group'
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
    Column.text('message_type'),   // 'text'|'image'|'file'|'audio'|'video'|'call'
    Column.text('file_url'),
    Column.text('file_name'),
    Column.integer('file_size'),
    Column.text('thumbnail_url'),
    Column.text('status'),         // 'sent'|'delivered'|'read'
    Column.text('reply_to_id'),
    Column.integer('is_deleted'),  // bool → integer
    Column.text('created_at'),
    Column.text('updated_at'),
  ]),

  Table('calls', [
    Column.text('conversation_id'),
    Column.text('caller_id'),
    Column.text('callee_id'),
    Column.text('call_type'),      // 'audio' | 'video'
    Column.text('status'),         // 'ringing'|'accepted'|'rejected'|'missed'|'ended'
    Column.text('zego_room_id'),
    Column.text('started_at'),
    Column.text('ended_at'),
    Column.integer('duration'),
    Column.text('created_at'),
  ]),

  Table('typing_indicators', [
    Column.text('conversation_id'),
    Column.text('user_id'),
    Column.integer('is_typing'),   // bool → integer
    Column.text('updated_at'),
  ]),

  // ── جداول محلية فقط — لا تُزامَن مع Supabase ────────────────────────────

  Table.localOnly('local_conversation_state', [
    Column.text('conversation_id'), // unique per conversation
    Column.text('draft'),
    Column.integer('is_muted'),
    Column.real('scroll_offset'),
  ]),
]);