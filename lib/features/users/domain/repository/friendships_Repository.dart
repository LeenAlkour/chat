import 'package:chato/core/errors/failure.dart';
import 'package:chato/features/users/domain/entities/user_friend_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FriendshipsRepository {
  Future<Either<Failure, List<UserFriend>>> getAllFriendships();
  void subscribeToFriendshipsUpdates(void Function(UserFriend) onUpdate);
  Future<Either<Failure, Unit>> sendRequest(String userId);
  Future<Either<Failure, Unit>> acceptRequest(String userId);
  Future<Either<Failure, Unit>> rejectRequest(String userId);
}