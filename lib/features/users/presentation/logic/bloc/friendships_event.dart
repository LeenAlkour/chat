// lib/features/users/presentation/logic/bloc/friendships_event.dart

import 'package:chato/core/errors/failure.dart';
import 'package:chato/features/users/domain/entities/user_friend_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'friendships_event.freezed.dart';

@freezed
class FriendshipsEvent with _$FriendshipsEvent {
  const factory FriendshipsEvent.watchAllUsers() = WatchAllUsers;

  // داخلي — يُطلق من الـ Stream
  const factory FriendshipsEvent.usersUpdated(
    Either<Failure, List<UserFriend>> result,
  ) = UsersUpdated;

  const factory FriendshipsEvent.sendRequest(String userId) = SendRequest;
  const factory FriendshipsEvent.acceptRequest(String userId) = AcceptRequest;
  const factory FriendshipsEvent.rejectRequest(String userId) = RejectRequest;
}