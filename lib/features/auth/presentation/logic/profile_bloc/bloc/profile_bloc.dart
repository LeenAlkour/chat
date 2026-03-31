import 'package:chato/features/auth/domain/usecase/get_current_user.dart';
import 'package:chato/features/auth/domain/usecase/update_profile_picture.dart';
import 'package:chato/features/auth/presentation/logic/profile_bloc/bloc/profile_event.dart';
import 'package:chato/features/auth/presentation/logic/profile_bloc/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetCurrentUserUseCase getCurrentUser;
  final UpdateProfilePictureUseCase updateProfilePicture;

  ProfileBloc({
    required this.getCurrentUser,
    required this.updateProfilePicture,
  }) : super(const ProfileState()) {
    on<LoadUser>(_onLoadUser);
    on<UpdateProfilePictureEvent>(_onUpdateProfilePicture);
  }

  Future<void> _onLoadUser(LoadUser event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await getCurrentUser();
    print(result);
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.toString())),
      (user) => emit(state.copyWith(isLoading: false, user: user)),
    );
  }

  Future<void> _onUpdateProfilePicture(
    UpdateProfilePictureEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isUploading: true, error: null));

    final result = await updateProfilePicture.call(
      params: event.filePath,
    ); // استدعاء UseCase
    result.fold(
      (failure) =>
          emit(state.copyWith(isUploading: false, error: failure.toString())),
      (imageUrl) {
        final updatedUser = state.user?.copyWith(avatarUrl: imageUrl);
        emit(state.copyWith(isUploading: false, user: updatedUser));
      },
    );
  }
}
