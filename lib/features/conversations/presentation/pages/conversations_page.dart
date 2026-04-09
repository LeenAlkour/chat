import 'package:chato/core/di/service_locator.dart';
import 'package:chato/features/conversations/presentation/logic/bloc/conversations_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/conversation_list.dart';
import '../widgets/conversations_app_bar.dart';
import '../widgets/conversations_error_widget.dart';
import '../widgets/conversations_empty_widget.dart';
import '../widgets/conversations_shimmer.dart';

class ConversationsPage extends StatelessWidget {
  const ConversationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ConversationsBloc>()
        ..add(const ConversationsEvent.load())
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const ConversationsAppBar(),
      body: BlocConsumer<ConversationsBloc, ConversationsState>(
        listenWhen: (_, current) => current is WatchFailure,
        listener: (context, state) {
          state.mapOrNull(
            watchFailure: (s) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(s.failure.toString()),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            ),
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const ConversationsShimmer(),
            loading: () => const ConversationsShimmer(),
            empty: () => const ConversationsEmptyWidget(),
            failure: (failure) => ConversationsErrorWidget(
              message: failure.toString(),
              onRetry: () => context.read<ConversationsBloc>().add(
                const ConversationsEvent.load(),
              ),
            ),
            watchFailure: (conversations, _) => ConversationList(
              conversations: conversations,
              isRefreshing: false,
            ),
            loaded: (conversations, isRefreshing) => ConversationList(
              conversations: conversations,
              isRefreshing: isRefreshing,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: navigate to new conversation
        },
        child: const Icon(Icons.edit_outlined),
      ),
    );
  }
}
