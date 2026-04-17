// lib/features/users/presentation/logic/bloc/friendships_bloc.dart

import 'dart:async';
import 'package:chato/features/users/domain/usecases/accept_request_usecase.dart';
import 'package:chato/features/users/domain/usecases/reject_request_usecase.dart';
import 'package:chato/features/users/domain/usecases/send_request_usecase.dart';
import 'package:chato/features/users/domain/usecases/watch_friendships_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'friendships_event.dart';
import 'friendships_state.dart';

class FriendshipsBloc extends Bloc<FriendshipsEvent, FriendshipsState> {
  final WatchAllUsersUsecase watchAllUsersUsecase;
  final AcceptRequestUsecase acceptRequestUsecase;
  final RejectRequestUsecase rejectRequestUsecase;
  final SendRequestUsecase sendRequestUsecase;

  StreamSubscription? _subscription;

  FriendshipsBloc({
    required this.watchAllUsersUsecase,
    required this.acceptRequestUsecase,
    required this.rejectRequestUsecase,
    required this.sendRequestUsecase,
  }) : super(const FriendshipsState.initial()) {
    on<WatchAllUsers>(_onWatchAllUsers);
    on<UsersUpdated>(_onUsersUpdated);
    on<SendRequest>(_onSendRequest);
    on<AcceptRequest>(_onAcceptRequest);
    on<RejectRequest>(_onRejectRequest);
  }

  Future<void> _onWatchAllUsers(
    WatchAllUsers event,
    Emitter<FriendshipsState> emit,
  ) async {
    emit(const FriendshipsState.loading());
    await _subscription?.cancel();
    _subscription = watchAllUsersUsecase.call().listen(
      (result) => add(FriendshipsEvent.usersUpdated(result)),
    );
  }

  void _onUsersUpdated(UsersUpdated event, Emitter<FriendshipsState> emit) {
    event.result.fold(
      (failure) => emit(FriendshipsState.error(message: failure.message)),
      (users) => emit(FriendshipsState.loaded(users: users)),
    );
  }

  Future<void> _onSendRequest(
    SendRequest event,
    Emitter<FriendshipsState> emit,
  ) async {
    final res = await sendRequestUsecase.call(params: event.userId);
    res.fold((f) => emit(FriendshipsState.error(message: f.message)), (_) {});
    // PowerSync stream يُحدَّث تلقائياً → asyncMap يُعيد جلب Supabase
  }

  Future<void> _onAcceptRequest(
    AcceptRequest event,
    Emitter<FriendshipsState> emit,
  ) async {
    final res = await acceptRequestUsecase.call(params: event.userId);
    res.fold((f) => emit(FriendshipsState.error(message: f.message)), (_) {});
  }

  Future<void> _onRejectRequest(
    RejectRequest event,
    Emitter<FriendshipsState> emit,
  ) async {
    final res = await rejectRequestUsecase.call(params: event.userId);
    res.fold((f) => emit(FriendshipsState.error(message: f.message)), (_) {});
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}