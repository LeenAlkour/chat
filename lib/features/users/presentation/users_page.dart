import 'package:chato/features/users/domain/entities/user_friend_entity.dart';
import 'package:chato/features/users/presentation/logic/bloc/friendships_bloc.dart';
import 'package:chato/features/users/presentation/logic/bloc/friendships_event.dart';
import 'package:chato/features/users/presentation/logic/bloc/friendships_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users'), centerTitle: true),
      body: BlocBuilder<FriendshipsBloc, FriendshipsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),

            loading: () => const Center(child: CircularProgressIndicator()),

            error: (msg) => Center(child: Text(msg)),

            loaded: (users) {
              if (users.isEmpty) {
                return const Center(child: Text('No users'));
              }

              return ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: users.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final user = users[index];
                  return _UserTile(user: user);
                },
              );
            },
          );
        },
      ),
    );
  }
}
class _UserTile extends StatelessWidget {
  final UserFriend user;

  const _UserTile({required this.user});

  @override
  Widget build(BuildContext context) {

    final state = context.watch<FriendshipsBloc>().state;

   bool isLoading = false;

    state.maybeWhen(
      loaded: (users, {bool isActionLoading = false, String? actionUserId}) {
        isLoading = isActionLoading && actionUserId == user.id;
      },
      orElse: () {
        isLoading = false;
      },
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // 🔥 Avatar
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.blue.shade200,
            // child: user.avatarUrl != null
            //     ? ClipOval(
            //         child: Image.network(
            //           user.avatarUrl!,
            //           width: 44,
            //           height: 44,
            //           fit: BoxFit.cover,
            //         ),
            //       )
            //     : Text(user.username[0].toUpperCase()),
          ),

          const SizedBox(width: 12),

          // 🔥 Username
          Expanded(
            child: Text(
              user.username,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),

          // 🔥 Action Button
          _buildActionButton(context, user, isLoading),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    UserFriend user,
    bool isLoading,
  ) {
    final bloc = context.read<FriendshipsBloc>();

    switch (user.status) {
      case FriendStatus.none:
        return ElevatedButton(
          onPressed: isLoading
              ? null
              : () => bloc.add(FriendshipsEvent.sendRequest(user.id)),
          child: isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Add'),
        );

      case FriendStatus.pendingSent:
        return const Text('Pending', style: TextStyle(color: Colors.orange));

      case FriendStatus.pendingReceived:
        return Row(
          children: [
            ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () => bloc.add(FriendshipsEvent.acceptRequest(user.id)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: isLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Accept'),
            ),
            const SizedBox(width: 6),
            ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () => bloc.add(FriendshipsEvent.rejectRequest(user.id)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Reject'),
            ),
          ],
        );

      case FriendStatus.accepted:
        return const Text('Friends', style: TextStyle(color: Colors.green));
    }
  }
}
