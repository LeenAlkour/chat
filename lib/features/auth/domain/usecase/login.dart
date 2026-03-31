import 'package:chato/core/usecases/usecase/usecase.dart';
import 'package:chato/features/auth/domain/entities/user_entity.dart';
import 'package:chato/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
  

class LoginUseCase implements UseCase<Either, UserEntity> {
final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
Future<Either> call({UserEntity? params}) async {
  
    return await repository.login(params!);
  }
}
