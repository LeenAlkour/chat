import 'package:chato/core/usecases/usecase/usecase.dart';
import 'package:chato/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateProfilePictureUseCase implements UseCase<Either, String> {
  final AuthRepository repository;

  UpdateProfilePictureUseCase(this.repository);

  @override
  Future<Either> call({String? params}) async {
    return await repository.updateProfilePicture(params!);
  }
}
