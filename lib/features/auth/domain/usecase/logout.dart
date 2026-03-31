  import 'package:chato/core/usecases/usecase/usecase.dart';
  import 'package:chato/features/auth/domain/repositories/auth_repository.dart';
  import 'package:dartz/dartz.dart';

  class LogoutUseCase implements UseCase<Either, dynamic> {
    final AuthRepository repository;

    LogoutUseCase(this.repository);

    @override
      Future<Either> call({dynamic params}) async {
      return await repository.logout();
    }
  }
