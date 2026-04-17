// lib/features/users/presentation/pages/users_page.dart

import 'package:chato/features/users/domain/entities/user_friend_entity.dart';
import 'package:chato/features/users/presentation/logic/bloc/friendships_bloc.dart';
import 'package:chato/features/users/presentation/logic/bloc/friendships_event.dart';
import 'package:chato/features/users/presentation/logic/bloc/friendships_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
    context.read<FriendshipsBloc>().add(
          const FriendshipsEvent.watchAllUsers(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('People'), centerTitle: true),
      body: BlocBuilder<FriendshipsBloc, FriendshipsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text(msg)),
            loaded: (users) {
              if (users.isEmpty) {
                return const Center(child: Text('No users found'));
              }
              return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: users.length,
                separatorBuilder: (_, __) =>
                    const Divider(height: 1, indent: 72),
                itemBuilder: (context, i) => _UserTile(user: users[i]),
              );
            },
          );
        },
      ),
    );
  }
}

// ── Tile ──────────────────────────────────────────────────────────────────────

class _UserTile extends StatelessWidget {
  final UserFriend user;
  const _UserTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue.shade300,
        backgroundImage:
            user.avatarUrl != null ? NetworkImage(user.avatarUrl!) : null,
        child: user.avatarUrl == null
            ? Text(
                user.username.isNotEmpty
                    ? user.username[0].toUpperCase()
                    : '?',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )
            : null,
      ),
      title: Text(
        user.username,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: user.isOnline
          ? Row(
              children: const [
                Icon(Icons.circle, size: 8, color: Colors.green),
                SizedBox(width: 4),
                Text('Online', style: TextStyle(color: Colors.green)),
              ],
            )
          : null,
      trailing: _ActionButton(user: user),
    );
  }
}

// ── Action Button ─────────────────────────────────────────────────────────────

class _ActionButton extends StatelessWidget {
  final UserFriend user;
  const _ActionButton({required this.user});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FriendshipsBloc>();

    switch (user.status) {
      case FriendStatus.none:
        return FilledButton.icon(
          onPressed: () => bloc.add(FriendshipsEvent.sendRequest(user.id)),
          icon: const Icon(Icons.person_add, size: 16),
          label: const Text('Add'),
        );

      case FriendStatus.pendingSent:
        return OutlinedButton(
          onPressed: null,
          child: const Text('Pending',
              style: TextStyle(color: Colors.orange)),
        );

      case FriendStatus.pendingReceived:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton(
              onPressed: () =>
                  bloc.add(FriendshipsEvent.acceptRequest(user.id)),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                minimumSize: const Size(0, 36),
              ),
              child: const Text('Accept'),
            ),
            const SizedBox(width: 6),
            OutlinedButton(
              onPressed: () =>
                  bloc.add(FriendshipsEvent.rejectRequest(user.id)),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                minimumSize: const Size(0, 36),
              ),
              child: const Text('Reject'),
            ),
          ],
        );

      case FriendStatus.accepted:
        return const Chip(
          avatar: Icon(Icons.check, size: 14, color: Colors.green),
          label: Text('Friends'),
          backgroundColor: Color(0xFFE8F5E9),
          labelStyle: TextStyle(color: Colors.green),
          padding: EdgeInsets.zero,
        );
    }
  }
}