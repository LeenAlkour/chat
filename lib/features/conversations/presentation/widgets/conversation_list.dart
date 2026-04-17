import 'package:chato/core/router/routes.dart';
import 'package:chato/features/conversations/presentation/logic/bloc/conversations_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/conversation_entity.dart';
import 'conversation_tile.dart';

class ConversationList extends StatelessWidget {
  final List<ConversationEntity> conversations;
  final bool isRefreshing;

  const ConversationList({
    super.key,
    required this.conversations,
    required this.isRefreshing,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ConversationsBloc>().add(
          const ConversationsEvent.refresh(),
        );
        // ننتظر انتهاء الريفريش
        await context.read<ConversationsBloc>().stream.firstWhere(
          (s) => s is Loaded || s is Failure,
        );
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          if (isRefreshing)
            const SliverToBoxAdapter(child: LinearProgressIndicator()),
          SliverList.separated(
            itemCount: conversations.length,
            separatorBuilder: (_, __) => Divider(
              height: 1,
              indent: 72,
              color: Theme.of(context).dividerColor.withOpacity(0.5),
            ),
            itemBuilder: (context, index) {
              final conversation = conversations[index];
              return ConversationTile(
                conversation: conversation,
                onTap: () {
                  context.pushNamed(Routes.messagesPage, extra: conversation);
                },
                onLongPress: () => _showOptions(context, conversation),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showOptions(BuildContext context, ConversationEntity conversation) {
    final bloc = context.read<ConversationsBloc>();

    showModalBottomSheet(
      context: context,
      builder: (_) => _ConversationOptions(
        conversation: conversation,
        onMarkAsRead: () {
          bloc.add(ConversationsEvent.markAsRead(conversation.id));
          Navigator.pop(context);
        },
        onMute: () {
          bloc.add(ConversationsEvent.markAsRead(conversation.id));
          Navigator.pop(context);
        },
      ),
    );
  }
}

class _ConversationOptions extends StatelessWidget {
  final ConversationEntity conversation;
  final VoidCallback onMarkAsRead;
  final VoidCallback onMute;

  const _ConversationOptions({
    required this.conversation,
    required this.onMarkAsRead,
    required this.onMute,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.done_all_rounded),
            title: const Text('Mark as read'),
            onTap: onMarkAsRead,
          ),
          ListTile(
            leading: Icon(
              conversation.isMuted
                  ? Icons.notifications_rounded
                  : Icons.notifications_off_rounded,
            ),
            title: Text(conversation.isMuted ? 'Unmute' : 'Mute'),
            onTap: onMute,
          ),
        ],
      ),
    );
  }
}
