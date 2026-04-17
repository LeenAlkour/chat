// lib/features/users/data/repository/friendships_repository_impl.dart
//
// ┌──────────────────────────────────────────────────────────────────┐
// │  Supabase  →  كل المستخدمين (one-shot عند كل تغيير في Stream)   │
// │  PowerSync →  friendships (reactive Stream)                      │
// │  الدمج     →  نضع حالة الصداقة الصحيحة على كل مستخدم            │
// └──────────────────────────────────────────────────────────────────┘

import 'package:chato/core/errors/error_handler.dart';
import 'package:chato/core/errors/failure.dart';
import 'package:chato/features/users/data/source/friendships_local_datasource.dart';
import 'package:chato/features/users/data/source/users_remote_datasource.dart';
import 'package:chato/features/users/domain/entities/user_friend_entity.dart';
import 'package:chato/features/users/domain/repository/friendships_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FriendshipsRepositoryImpl implements FriendshipsRepository {
  final UsersRemoteDataSource remoteDataSource;
  final FriendshipsLocalDataSource localDataSource;

  FriendshipsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  String get _currentUserId =>
      Supabase.instance.client.auth.currentUser!.id;

  @override
  Stream<Either<Failure, List<UserFriend>>> watchAllUsers() {
    final currentUserId = _currentUserId;

    return localDataSource
        .watchFriendships(currentUserId)
        .asyncMap((friendshipRows) async {
          // جلب كل المستخدمين من Supabase
          final allUsers =
              await remoteDataSource.getAllUsers(currentUserId);

          // بناء Map سريع: userId → friendship row
          final friendshipMap = <String, Map<String, dynamic>>{};
          for (final row in friendshipRows) {
            final otherId = row['other_user_id'] as String;
            friendshipMap[otherId] = row;
          }

          // دمج البيانات
          final merged = allUsers.map((user) {
            final friendship = friendshipMap[user.id];
            if (friendship == null) return user; // لا توجد علاقة

            return user.withFriendship(
              friendshipId: friendship['id'] as String,
              status: friendship['status'] as String,
              isSentByMe:
                  (friendship['requester_id'] as String) == currentUserId,
            );
          }).toList();

          return Right<Failure, List<UserFriend>>(
            merged.map((m) => m.toEntity()).toList(),
          );
        })
        .handleError(
          (e) => Left<Failure, List<UserFriend>>(ErrorHandler.handle(e)),
        );
  }

  @override
  Future<Either<Failure, Unit>> sendRequest(String userId) async {
    try {
      await localDataSource.sendRequest(_currentUserId, userId);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> acceptRequest(String userId) async {
    try {
      await localDataSource.acceptRequest(_currentUserId, userId);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> rejectRequest(String userId) async {
    try {
      await localDataSource.rejectRequest(_currentUserId, userId);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}