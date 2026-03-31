import 'package:chato/core/usecases/usecase/usecase.dart';
import 'package:chato/features/users/domain/entities/user_friend_entity.dart';
import 'package:chato/features/users/domain/repository/friendships_Repository.dart';
import 'package:dartz/dartz.dart';

class SubscribeToFriendshipsUpdatesUsecase implements UseCase<Either,void Function(UserFriend)> {
  final FriendshipsRepository repository;

  SubscribeToFriendshipsUpdatesUsecase(this.repository);

  @override
 void call({void Function(UserFriend)? params})  {
    return repository.subscribeToFriendshipsUpdates(params!);
  }
}
