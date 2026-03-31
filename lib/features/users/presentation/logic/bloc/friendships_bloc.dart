import 'package:chato/features/users/domain/entities/user_friend_entity.dart';
import 'package:chato/features/users/domain/usecases/accept_request_usecase.dart';
import 'package:chato/features/users/domain/usecases/get_allFriendships_usecase.dart';
import 'package:chato/features/users/domain/usecases/reject_request_usecase.dart';
import 'package:chato/features/users/domain/usecases/send_request_usecase.dart';
import 'package:chato/features/users/domain/usecases/subscribe_to_friendships_updates_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'friendships_event.dart';
import 'friendships_state.dart';

class FriendshipsBloc extends Bloc<FriendshipsEvent, FriendshipsState> {
  SubscribeToFriendshipsUpdatesUsecase subscribeToFriendshipsUpdatesUsecase;
  RejectRequestUsecase rejectRequestUsecase;
  GetAllfriendshipsUsecase getAllfriendshipsUsecase;
  AcceptRequestUsecase acceptRequestUsecase;
  SendRequestUsecase sendRequestUsecase;
  // final FriendshipsRepository repository;

  List<UserFriend> users = [];

  FriendshipsBloc({
    required this.acceptRequestUsecase,
    required this.getAllfriendshipsUsecase,
    required this.rejectRequestUsecase,
    required this.sendRequestUsecase,
    required this.subscribeToFriendshipsUpdatesUsecase,
  }) : super(const FriendshipsState.initial()) {
    // Fetch all
    on<SendRequest>((event, emit) async {
      final res = await sendRequestUsecase.call(params:  event.userId);
      res.fold((l) => print(l), (_) {});
    });

    on<AcceptRequest>((event, emit) async {
      final res = await acceptRequestUsecase.call(params:  event.userId);
      res.fold((l) => print(l), (_) {});
    });

    on<RejectRequest>((event, emit) async {
      final res = await rejectRequestUsecase.call(params:  event.userId);

      res.fold((l) => print(l), (_) {
        final index = users.indexWhere((u) => u.id == event.userId);
        if (index != -1) {
          users.removeAt(index);
          emit(FriendshipsState.loaded(users: List.from(users)));
        }
      });
    });
    on<FetchAll>((event, emit) async {
      emit(const FriendshipsState.loading());
      final result = await getAllfriendshipsUsecase.call();
      result.fold((l) => emit(FriendshipsState.error(message: l.message)), (r) {
        users = r;
        emit(FriendshipsState.loaded(users: List.from(users)));
        // Start listening to realtime updates
        subscribeToFriendshipsUpdatesUsecase.call(params:  (updatedUser) {
          add(FriendshipsEvent.friendUpdated(updatedUser));
        });
      });
    });

    // Update single user
    on<FriendUpdated>((event, emit) {
      final index = users.indexWhere((u) => u.id == event.user.id);
      if (index != -1)
        users[index] = event.user;
      else
        users.add(event.user);
      emit(FriendshipsState.loaded(users: List.from(users)));
    });
  }
}
