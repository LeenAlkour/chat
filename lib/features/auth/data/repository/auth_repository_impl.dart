import 'package:chato/core/errors/error_handler.dart';
import 'package:chato/core/errors/failure.dart';
import 'package:chato/features/auth/data/models/user_model.dart';
import 'package:chato/features/auth/data/source/auth_supabase_service.dart';
import 'package:chato/features/auth/domain/entities/user_entity.dart';
import 'package:chato/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthSupabaseService authSupabaseService;

  AuthRepositoryImpl({required this.authSupabaseService});

  @override
  Future<Either> login(UserEntity user) async {
    try {
      final userModel = user.fromEntity();
      await authSupabaseService.signIn(userModel);
      return Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either> register(UserEntity user) async {
    try {
      final userModel = user.fromEntity();
      await authSupabaseService.signUp(userModel);
      return Right(Null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either> getCurrentUser() async {
    try {
      final user = await authSupabaseService.getCurrentUser();
      final re = user?.toEntity();
      return Right(re);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either> logout() async {
    try {
      await authSupabaseService.signOut();
      return Right(Null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, String>> updateProfilePicture(String filePath) async {
    try {
      final url = await authSupabaseService.updateProfilePicture(filePath);
      return Right(url);
    } catch (e) {
      print(e);
      return Left(ErrorHandler.handle(e));
    }
  }
}
