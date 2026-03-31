import 'package:chato/features/users/domain/entities/user_friend_entity.dart';

class UserFriendModel extends UserFriend {
  const UserFriendModel({
    required super.id,
    required super.username,
    super.avatarUrl,
    required super.status,
  });

  factory UserFriendModel.fromJson(
    Map<String, dynamic> json,
    String currentUserId,
  ) {
    FriendStatus status = FriendStatus.none;
    final fStatus = json['status'] as String?;
    final requesterId = json['requester_id'] as String?;

    if (fStatus == 'accepted') {
      status = FriendStatus.accepted;
    } else if (fStatus == 'pending') {
      status = requesterId == currentUserId
          ? FriendStatus.pendingSent
          : FriendStatus.pendingReceived;
    }

    return UserFriendModel(
      id: json['id'],
      username: json['username'],
      avatarUrl: json['avatar_url'],
      status: status,
    );
  }
}
