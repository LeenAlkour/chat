// lib/features/users/domain/usecases/watch_all_users_usecase.dart

import 'package:chato/core/errors/failure.dart';
import 'package:chato/features/users/domain/entities/user_friend_entity.dart';
import 'package:chato/features/users/domain/repository/friendships_repository.dart';
import 'package:dartz/dartz.dart';

class WatchAllUsersUsecase {
  final FriendshipsRepository _repository;
  WatchAllUsersUsecase(this._repository);

  Stream<Either<Failure, List<UserFriend>>> call() =>
      _repository.watchAllUsers();
}