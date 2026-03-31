part of 'conversations_bloc.dart';

@freezed
class ConversationsState with _$ConversationsState {
  const factory ConversationsState.initial() = _Initial;
  const factory ConversationsState.loading() = _Loading;

  const factory ConversationsState.loaded({
    required List<ConversationEntity> conversations,
    @Default(false) bool isRefreshing,
  }) = _Loaded;

  /// خطأ كامل — القائمة فارغة
  const factory ConversationsState.failure({required Failure failure}) =
      _Failure;

  /// خطأ من Realtime — نعرض القائمة الحالية + snackbar في الـ UI
  const factory ConversationsState.watchFailure({
    required List<ConversationEntity> conversations,
    required Failure failure,
  }) = WatchFailure;

  const factory ConversationsState.empty() = _Empty;
}
 