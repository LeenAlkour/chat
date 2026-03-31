
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_friend_entity.freezed.dart';

enum FriendStatus { none, pendingSent, pendingReceived, accepted }


@freezed
class UserFriend with _$UserFriend{
  final String id;
  final String username;
  final String? avatarUrl;
  final FriendStatus status;

  const UserFriend({
    required this.id,
    required this.username,
    this.avatarUrl,
    required this.status,
  });

}
