import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../domain/entities/conversation_entity.dart';

class ConversationTile extends StatelessWidget {
  final ConversationEntity conversation;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const ConversationTile({
    super.key,
    required this.conversation,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hasUnread = conversation.unreadCount > 0;
    final isMuted = conversation.isMuted;

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            // ── Avatar ───────────────────────────────────────────
            _Avatar(conversation: conversation),
            const SizedBox(width: 12),

            // ── Content ──────────────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Name
                      Expanded(
                        child: Text(
                          _displayName,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: hasUnread
                                ? FontWeight.w700
                                : FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Time
                      Text(
                        timeago.format(
                          conversation.lastMessageAt,
                          allowFromNow: true,
                        ),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: hasUnread
                              ? colorScheme.primary
                              : colorScheme.onSurfaceVariant,
                          fontWeight: hasUnread
                              ? FontWeight.w600
                              : FontWeight.normal,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      // Last message preview
                      Expanded(
                        child: Text(
                          _lastMessagePreview,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: hasUnread
                                ? colorScheme.onSurface
                                : colorScheme.onSurfaceVariant,
                            fontWeight: hasUnread
                                ? FontWeight.w500
                                : FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Muted icon
                      if (isMuted)
                        Icon(
                          Icons.notifications_off_rounded,
                          size: 14,
                          color: colorScheme.onSurfaceVariant,
                        ),

                      // Unread badge
                      if (hasUnread && !isMuted) ...[
                        const SizedBox(width: 4),
                        _UnreadBadge(count: conversation.unreadCount),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get _displayName =>
      conversation.otherFullName ??
      conversation.otherUsername ??
      'Unknown';

  String get _lastMessagePreview {
    if (conversation.lastMessageContent == null) return 'No messages yet';
    return switch (conversation.lastMessageType) {
      'image' => '📷 Photo',
      'audio' => '🎵 Voice message',
      'video' => '🎬 Video',
      'file'  => '📎 File',
      'call'  => '📞 Call',
      _       => conversation.lastMessageContent!,
    };
  }
}

// ── Avatar ──────────────────────────────────────────────────────────────────

class _Avatar extends StatelessWidget {
  final ConversationEntity conversation;

  const _Avatar({required this.conversation});
  
  bool _isValidUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    final uri = Uri.tryParse(url);
    return uri != null && uri.hasScheme && uri.host.isNotEmpty;
  }
  
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final name = conversation.otherFullName ?? conversation.otherUsername ?? '?';
    final initial = name.isNotEmpty ? name[0].toUpperCase() : '?';
    final isOnline = conversation.otherIsOnline;

    return Stack(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: colorScheme.primaryContainer,
         backgroundImage: _isValidUrl(conversation.otherAvatarUrl)
    ? NetworkImage(conversation.otherAvatarUrl!)
    : null,
          child: conversation.otherAvatarUrl == null
              ? Text(
                  initial,
                  style: TextStyle(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                )
              : null,
        ),
        if (isOnline)
          Positioned(
            right: 1,
            bottom: 1,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.surface,
                  width: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// ── Unread Badge ─────────────────────────────────────────────────────────────

class _UnreadBadge extends StatelessWidget {
  final int count;

  const _UnreadBadge({required this.count});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        count > 99 ? '99+' : '$count',
        style: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
