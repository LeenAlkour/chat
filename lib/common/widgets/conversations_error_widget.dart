import 'package:flutter/material.dart';

import '../../../../core/errors/failure.dart';

class ConversationsErrorWidget extends StatelessWidget {
  final Failure failure;
  final VoidCallback onRetry;

  const ConversationsErrorWidget({
    super.key,
    required this.failure,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(_iconForCode(failure.code), size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              failure.message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      ),
    );
  }

  IconData _iconForCode(int? code) {
    return switch (code) {
      401 => Icons.lock_outline,
      429 => Icons.timer_off_outlined,
      _ => Icons.cloud_off_rounded,
    };
  }
}
