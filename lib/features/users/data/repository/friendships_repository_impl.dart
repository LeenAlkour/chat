import 'package:chato/core/errors/error_handler.dart';
import 'package:chato/core/errors/failure.dart';
import 'package:chato/features/users/data/source/friendships_remote_data_source.dart';
import 'package:chato/features/users/domain/entities/user_friend_entity.dart';
import 'package:chato/features/users/domain/repository/friendships_Repository.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FriendshipsRepositoryImpl implements FriendshipsRepository {
  final FriendshipsRemoteDataSource remote;

  FriendshipsRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, List<UserFriend>>> getAllFriendships() async {
    try {
      final currentUserId = Supabase.instance.client.auth.currentUser!.id;
      final users = await remote.getFriendships(currentUserId);
      return Right(users);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  void subscribeToFriendshipsUpdates(void Function(UserFriend) onUpdate) {
    final currentUserId = Supabase.instance.client.auth.currentUser!.id;
    remote.subscribeToUpdates(currentUserId, onUpdate);
  }
   @override
  Future<Either<Failure, Unit>> sendRequest(String userId) async {
    try {
      final currentUserId = Supabase.instance.client.auth.currentUser!.id;
      await remote.sendRequest(currentUserId, userId);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorHandler.handle(e));

    }
  }

  @override
  Future<Either<Failure, Unit>> acceptRequest(String userId) async {
    try {
      final currentUserId = Supabase.instance.client.auth.currentUser!.id;
      await remote.acceptRequest(currentUserId, userId);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorHandler.handle(e));

    }
  }

  @override
  Future<Either<Failure, Unit>> rejectRequest(String userId) async {
    try {
      final currentUserId = Supabase.instance.client.auth.currentUser!.id;
      await remote.rejectRequest(currentUserId, userId);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorHandler.handle(e));

    }
  }
}
