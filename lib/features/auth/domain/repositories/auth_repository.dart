import 'package:chato/core/errors/failure.dart';
import 'package:chato/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';


abstract class AuthRepository {
  Future<Either> login(UserEntity user);
  Future<Either> register(UserEntity user);
  Future<Either> logout();
  Future<Either> getCurrentUser();
  Future<Either<Failure, String>> updateProfilePicture(String filePath);

 
}
  