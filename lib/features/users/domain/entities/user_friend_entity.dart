// lib/features/users/domain/entities/user_friend_entity.dart

import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_friend_entity.freezed.dart';

enum FriendStatus {
  none,             // لا توجد علاقة   → زر Add
  pendingSent,      // أنا أرسلت       → Pending
  pendingReceived,  // هو أرسل لي      → Accept / Reject
  accepted,         // أصدقاء          → Friends
}

@freezed
abstract class UserFriend with _$UserFriend {
  const factory UserFriend({
    required String id,
    required String username,
    String? avatarUrl,
    String? fullName,
    required bool isOnline,
    String? friendshipId,   // null إذا لم توجد علاقة بعد
    required FriendStatus status,
  }) = _UserFriend;
}