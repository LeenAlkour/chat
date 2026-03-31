import 'package:chato/features/users/domain/entities/user_friend_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friendships_state.freezed.dart';

@freezed
class FriendshipsState with _$FriendshipsState {
  const factory FriendshipsState.initial() = _Initial;
  const factory FriendshipsState.loading() = _Loading;
  const factory FriendshipsState.loaded({required List<UserFriend> users}) =
      _Loaded;
  const factory FriendshipsState.error({required String message}) = _Error;
}
