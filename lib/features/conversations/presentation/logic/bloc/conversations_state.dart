part of 'conversations_bloc.dart';

@freezed
class ConversationsState with _$ConversationsState {
  const factory ConversationsState.initial() = Initial;
  const factory ConversationsState.loading() = Loading;

  const factory ConversationsState.loaded({
    required List<ConversationEntity> conversations,
    @Default(false) bool isRefreshing,
  }) = Loaded;

  const factory ConversationsState.empty() = Empty;

  // خطأ كامل — لا بيانات
  const factory ConversationsState.failure({required String failure}) =
      Failure;

  // خطأ في الـ stream — نُبقي القائمة الحالية ونُطلق snackbar
  const factory ConversationsState.watchFailure({
    required List<ConversationEntity> conversations,
    required String failure,
  }) = WatchFailure;
}
