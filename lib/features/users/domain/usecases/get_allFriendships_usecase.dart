import 'package:chato/core/errors/failure.dart';
import 'package:chato/core/usecases/usecase/usecase.dart';
import 'package:chato/features/users/domain/entities/user_friend_entity.dart';
import 'package:chato/features/users/domain/repository/friendships_Repository.dart';
import 'package:dartz/dartz.dart';

class GetAllfriendshipsUsecase implements UseCase<Either, List<UserFriend>> {
  final FriendshipsRepository repository;

  GetAllfriendshipsUsecase(this.repository);

  @override
  Future<Either<Failure,List<UserFriend>>> call({dynamic params}) async {
    return await repository.getAllFriendships();
  }
}
