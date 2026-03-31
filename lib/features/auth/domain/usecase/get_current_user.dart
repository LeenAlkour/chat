import 'package:chato/core/usecases/usecase/usecase.dart';
import 'package:chato/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class GetCurrentUserUseCase implements UseCase<Either, dynamic> {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  @override
  Future<Either> call({dynamic params}) async {
    return await repository.getCurrentUser();
  }
}
