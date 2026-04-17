import 'package:chato/core/errors/failure.dart';
import 'package:chato/core/usecases/usecase/usecase.dart';
import 'package:chato/features/users/domain/repository/friendships_repository.dart';
import 'package:dartz/dartz.dart';

class RejectRequestUsecase implements UseCase<Either, String> {
  final FriendshipsRepository repository;

  RejectRequestUsecase(this.repository);

  @override
  Future<Either<Failure, Unit>> call({String? params}) async {
    return await repository.rejectRequest(params!);
  }
}
