import 'package:chato/features/conversations/presentation/logic/bloc/conversations_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ConversationsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ConversationsAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      backgroundColor: colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      title: Text(
        'Chato',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
      ),
      actions: [
        // مؤشر حالة المزامنة
        const _SyncStatusIndicator(),
        IconButton(
          icon: const Icon(Icons.search_rounded),
          onPressed: () {
            // TODO: search
          },
        ),
        IconButton(
          icon: const Icon(Icons.more_vert_rounded),
          onPressed: () {
            // TODO: menu
          },
        ),
      ],
    );
  }
}

class _SyncStatusIndicator extends StatelessWidget {
  const _SyncStatusIndicator();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationsBloc, ConversationsState>(
      buildWhen: (prev, curr) =>
          curr is Loaded || curr is Loading || curr is WatchFailure,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
          loaded: (_, isRefreshing) => isRefreshing
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : const SizedBox.shrink(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
