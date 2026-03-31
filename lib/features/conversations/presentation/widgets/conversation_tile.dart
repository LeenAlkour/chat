import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../domain/entities/conversation_entity.dart';

class ConversationTile extends StatelessWidget {
  final ConversationEntity conversation;

  const ConversationTile({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // للمحادثات الفردية نأخذ الطرف الآخر
    final otherParticipant = conversation.participants.isNotEmpty
        ? conversation.participants.first
        : null;

    final displayName =
        otherParticipant?.fullName ??
        otherParticipant?.username ??
        'محادثة جماعية';

    final avatarUrl = otherParticipant?.avatarUrl;
    final isOnline = otherParticipant?.isOnline ?? false;
    final hasUnread = conversation.unreadCount > 0;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundImage: avatarUrl != null && avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
            backgroundColor: colorScheme.primaryContainer,
            child: avatarUrl == null || avatarUrl.isEmpty
                ? Text(
                    displayName.isNotEmpty ? displayName[0].toUpperCase() : '?',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                    ),
                  )
                : null,
          ),
          if (isOnline)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.scaffoldBackgroundColor,
                    width: 2,
                  ),
                ),
              ),
            ),
        ],
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              displayName,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: hasUnread ? FontWeight.w700 : FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            timeago.format(conversation.lastMessageAt, locale: 'ar'),
            style: theme.textTheme.bodySmall?.copyWith(
              color: hasUnread
                  ? colorScheme.primary
                  : colorScheme.onSurfaceVariant,
              fontWeight: hasUnread ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              _buildLastMessagePreview(),
              style: theme.textTheme.bodySmall?.copyWith(
                color: hasUnread
                    ? colorScheme.onSurface
                    : colorScheme.onSurfaceVariant,
                fontWeight: hasUnread ? FontWeight.w500 : FontWeight.normal,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (hasUnread) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                conversation.unreadCount > 99
                    ? '99+'
                    : '${conversation.unreadCount}',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _buildLastMessagePreview() {
    if (conversation.lastMessageContent == null) return 'لا توجد رسائل';
    return switch (conversation.lastMessageType) {
      'image' => '📷 صورة',
      'audio' => '🎵 رسالة صوتية',
      'video' => '🎬 مقطع فيديو',
      'file' => '📎 ملف',
      'call' => '📞 مكالمة',
      _ => conversation.lastMessageContent!,
    };
  }
}
