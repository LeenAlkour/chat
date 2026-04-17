// lib/features/users/data/models/user_friend_model.dart

import '../../domain/entities/user_friend_entity.dart';

class UserFriendModel {
  final String id;
  final String username;
  final String? avatarUrl;
  final String? fullName;
  final bool isOnline;
  // بيانات الصداقة — تأتي من PowerSync، قد تكون null
  final String? friendshipId;
  final String? friendshipStatus;
  final bool isSentByMe;

  const UserFriendModel({
    required this.id,
    required this.username,
    this.avatarUrl,
    this.fullName,
    required this.isOnline,
    this.friendshipId,
    this.friendshipStatus,
    required this.isSentByMe,
  });

  // ── من Supabase (قائمة كل المستخدمين) ───────────────────────────────────
  // بدون بيانات صداقة — سيتم دمجها لاحقاً في الـ repository
  factory UserFriendModel.fromSupabase(Map<String, dynamic> row) {
    final isOnlineRaw = row['is_online'];
    return UserFriendModel(
      id: row['id'] as String,
      username: row['username'] as String? ?? '',
      avatarUrl: row['avatar_url'] as String?,
      fullName: row['full_name'] as String?,
      isOnline: isOnlineRaw == true || isOnlineRaw == 1,
      friendshipId: null,
      friendshipStatus: null,
      isSentByMe: false,
    );
  }

  // ── من PowerSync (بيانات الصداقة فقط) ───────────────────────────────────
  factory UserFriendModel.fromPowerSync(
    Map<String, dynamic> row,
    String currentUserId,
  ) {
    return UserFriendModel(
      id: row['other_user_id'] as String,
      username: '',         // لا نجلب بيانات المستخدم من PowerSync هنا
      isOnline: false,
      friendshipId: row['id'] as String,
      friendshipStatus: row['status'] as String?,
      isSentByMe: (row['requester_id'] as String) == currentUserId,
    );
  }

  // ── نسخة مع بيانات الصداقة مدمجة ───────────────────────────────────────
  UserFriendModel withFriendship({
    required String friendshipId,
    required String status,
    required bool isSentByMe,
  }) {
    return UserFriendModel(
      id: id,
      username: username,
      avatarUrl: avatarUrl,
      fullName: fullName,
      isOnline: isOnline,
      friendshipId: friendshipId,
      friendshipStatus: status,
      isSentByMe: isSentByMe,
    );
  }

  UserFriend toEntity() {
    return UserFriend(
      id: id,
      username: username,
      avatarUrl: avatarUrl,
      fullName: fullName,
      isOnline: isOnline,
      friendshipId: friendshipId,
      status: _mapStatus(),
    );
  }

  FriendStatus _mapStatus() {
    switch (friendshipStatus) {
      case 'accepted':
        return FriendStatus.accepted;
      case 'pending':
        return isSentByMe
            ? FriendStatus.pendingSent
            : FriendStatus.pendingReceived;
      default:
        return FriendStatus.none;
    }
  }
}