import 'package:chato/common/widgets/conversations_error_widget.dart';
import 'package:chato/core/di/service_locator.dart';
import 'package:chato/features/conversations/presentation/logic/bloc/conversations_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/conversation_tile.dart';

class ConversationsPage extends StatelessWidget {
  const ConversationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ConversationsBloc>()
        ..add(const ConversationsEvent.loadConversations())
        ..add(const ConversationsEvent.startWatching()),
      child: const _ConversationsView(),
    );
  }
}

class _ConversationsView extends StatelessWidget {
  const _ConversationsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المحادثات'), centerTitle: false),
      body: BlocConsumer<ConversationsBloc, ConversationsState>(
        // نعرض snackbar عند خطأ Realtime دون كسر القائمة
        listenWhen: (_, current) => current is WatchFailure,
        listener: (context, state) {
          state.mapOrNull(
            watchFailure: (s) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'انقطع الاتصال الفوري — البيانات قد تكون غير محدّثة',
                ),
                behavior: SnackBarBehavior.floating,
              ),
            ),
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            empty: () => const Center(child: Text('لا توجد محادثات بعد')),
            failure: (failure) {
              print(failure.message);
              return ConversationsErrorWidget(
                failure: failure,
                onRetry: () => context.read<ConversationsBloc>().add(
                  const ConversationsEvent.loadConversations(),
                ),
              );
            },
            // watchFailure: القائمة موجودة لكن Realtime انقطع
            watchFailure: (conversations, _) => _ConversationsList(
              conversations: conversations,
              isRefreshing: false,
            ),
            loaded: (conversations, isRefreshing) => _ConversationsList(
              conversations: conversations,
              isRefreshing: isRefreshing,
            ),
          );
        },
      ),
    );
  }
}

class _ConversationsList extends StatelessWidget {
  final List conversations;
  final bool isRefreshing;

  const _ConversationsList({
    required this.conversations,
    required this.isRefreshing,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ConversationsBloc>().add(
          const ConversationsEvent.refreshConversations(),
        );
      },
      child: Stack(
        children: [
          ListView.separated(
            itemCount: conversations.length,
            separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
            itemBuilder: (context, index) =>
                ConversationTile(conversation: conversations[index]),
          ),
          if (isRefreshing) const LinearProgressIndicator(),
        ],
      ),
    );
  }
}
