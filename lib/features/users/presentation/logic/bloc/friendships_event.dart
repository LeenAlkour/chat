import 'package:chato/features/users/domain/entities/user_friend_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friendships_event.freezed.dart';

@freezed
class FriendshipsEvent with _$FriendshipsEvent {
  const factory FriendshipsEvent.fetchAll() = FetchAll;
  const factory FriendshipsEvent.friendUpdated(UserFriend user) =
      FriendUpdated;
      const factory FriendshipsEvent.sendRequest(String userId) = SendRequest;
  const factory FriendshipsEvent.acceptRequest(String userId) = AcceptRequest;
  const factory FriendshipsEvent.rejectRequest(String userId) = RejectRequest;
  
}
