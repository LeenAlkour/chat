import 'package:chato/core/usecases/usecase/usecase.dart';
import 'package:chato/features/auth/domain/entities/user_entity.dart';
import 'package:chato/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase implements UseCase<Either, UserEntity> {
 
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either> call({UserEntity? params}) async {
    return await repository.register(params!);
  }
}
