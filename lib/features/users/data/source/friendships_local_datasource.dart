// lib/features/users/data/source/friendships_local_datasource.dart
//
// مسؤول فقط عن:
//   • قراءة الصداقات من PowerSync (reactive Stream)
//   • الكتابة عبر db.execute() → PowerSync يرفعها لـ Supabase

import 'package:powersync/powersync.dart';
import 'package:uuid/uuid.dart';

abstract class FriendshipsLocalDataSource {
  /// Stream يُطلق عند أي تغيير في جدول friendships المحلي
  Stream<List<Map<String, dynamic>>> watchFriendships(String currentUserId);

  Future<void> sendRequest(String currentUserId, String otherUserId);
  Future<void> acceptRequest(String currentUserId, String otherUserId);
  Future<void> rejectRequest(String currentUserId, String otherUserId);
}

class FriendshipsLocalDataSourceImpl implements FriendshipsLocalDataSource {
  final PowerSyncDatabase _db;
  final _uuid = const Uuid();

  FriendshipsLocalDataSourceImpl(this._db);

  // يُرجع كل صفوف friendships المرتبطة بالمستخدم الحالي
  static const _sql = '''
    SELECT
      id,
      requester_id,
      addressee_id,
      status,
      CASE
        WHEN requester_id = ?1 THEN addressee_id
        ELSE requester_id
      END AS other_user_id
    FROM friendships
    WHERE requester_id = ?1
       OR addressee_id = ?1
  ''';

  @override
  Stream<List<Map<String, dynamic>>> watchFriendships(String currentUserId) {
    return _db
        .watch(_sql, parameters: [currentUserId])
        .map((rows) => rows.toList());
  }

  @override
  Future<void> sendRequest(String currentUserId, String otherUserId) async {
    // تحقق من عدم وجود علاقة مسبقة
    final existing = await _db.getOptional(
      '''
      SELECT id FROM friendships
      WHERE (requester_id = ? AND addressee_id = ?)
         OR (requester_id = ? AND addressee_id = ?)
      ''',
      [currentUserId, otherUserId, otherUserId, currentUserId],
    );
    if (existing != null) return;

    final id = _uuid.v4();
    final now = DateTime.now().toUtc().toIso8601String();
    await _db.execute(
      '''
      INSERT INTO friendships
        (id, requester_id, addressee_id, created_at, updated_at)
      VALUES (?, ?, ?, ?, ?)
      ''',
      [id, currentUserId, otherUserId, now, now],
    );
  }

  @override
  Future<void> acceptRequest(String currentUserId, String otherUserId) async {
    final now = DateTime.now().toUtc().toIso8601String();
    await _db.execute(
      '''
      UPDATE friendships
      SET status = 'accepted', updated_at = ?
      WHERE requester_id = ? AND addressee_id = ?
      ''',
      [now, otherUserId, currentUserId],
    );
  }

  @override
  Future<void> rejectRequest(String currentUserId, String otherUserId) async {
    await _db.execute(
      '''
      DELETE FROM friendships
      WHERE requester_id = ? AND addressee_id = ?
      ''',
      [otherUserId, currentUserId],
    );
  }
}
