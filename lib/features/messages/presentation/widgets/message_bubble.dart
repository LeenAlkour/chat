// lib/features/messages/presentation/widgets/message_bubble.dart

import 'package:flutter/material.dart';
import '../../domain/entities/message_entity.dart';

class MessageBubble extends StatelessWidget {
  final MessageEntity message;
  final bool isMe;
  final MessageEntity? replyTo;
  final VoidCallback? onLongPress;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isMe,
    this.replyTo,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    if (message.isDeleted) return _DeletedBubble(isMe: isMe);
    if (message.messageType == MessageType.call)
      return _CallBubble(message: message);

    final theme = Theme.of(context);

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onLongPress: onLongPress,
        child: Container(
          margin: EdgeInsets.only(
            top: 2,
            bottom: 2,
            left: isMe ? 60 : 12,
            right: isMe ? 12 : 60,
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.78,
          ),
          decoration: BoxDecoration(
            color: isMe
                ? theme.colorScheme.primary
                : theme.colorScheme.surfaceVariant,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(18),
              topRight: const Radius.circular(18),
              bottomLeft: Radius.circular(isMe ? 18 : 4),
              bottomRight: Radius.circular(isMe ? 4 : 18),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(18),
              topRight: const Radius.circular(18),
              bottomLeft: Radius.circular(isMe ? 18 : 4),
              bottomRight: Radius.circular(isMe ? 4 : 18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Reply preview
                if (replyTo != null)
                  _ReplyPreview(replyTo: replyTo!, isMe: isMe),

                // Content by type
                _buildContent(context),

                // Footer (time + status)
                _BubbleFooter(message: message, isMe: isMe),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return switch (message.messageType) {
      MessageType.text => _TextContent(message: message, isMe: isMe),
      MessageType.image => _ImageContent(message: message, isMe: isMe),
      MessageType.audio => _AudioContent(message: message, isMe: isMe),
      MessageType.file => _FileContent(message: message, isMe: isMe),
      MessageType.call => const SizedBox.shrink(),
    };
  }
}

// ─── Text ─────────────────────────────────────────────────────────
class _TextContent extends StatelessWidget {
  final MessageEntity message;
  final bool isMe;
  const _TextContent({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 2),
      child: Text(
        message.content ?? '',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: isMe
              ? theme.colorScheme.onPrimary
              : theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

// ─── Image ────────────────────────────────────────────────────────
class _ImageContent extends StatelessWidget {
  final MessageEntity message;
  final bool isMe;
  const _ImageContent({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // الصورة
        AspectRatio(
          aspectRatio: 4 / 3,
          child: Image.network(
            message.fileUrl!,
            fit: BoxFit.cover,
            loadingBuilder: (_, child, progress) => progress == null
                ? child
                : Container(
                    color: Colors.black12,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
            errorBuilder: (_, __, ___) => Container(
              color: Colors.black12,
              child: const Icon(Icons.broken_image, size: 40),
            ),
          ),
        ),
        // Caption اختياري
        if (message.content?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 6, 10, 2),
            child: Text(
              message.content!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: isMe
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
      ],
    );
  }
}

// ─── Video ────────────────────────────────────────────────────────
class _VideoContent extends StatelessWidget {
  final MessageEntity message;
  final bool isMe;
  const _VideoContent({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Thumbnail أو placeholder
        AspectRatio(
          aspectRatio: 4 / 3,
          child: message.thumbnailUrl != null
              ? Image.network(message.thumbnailUrl!, fit: BoxFit.cover)
              : Container(color: Colors.black54),
        ),
        // زر play
        Container(
          decoration: BoxDecoration(
            color: Colors.black45,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(12),
          child: const Icon(
            Icons.play_arrow_rounded,
            color: Colors.white,
            size: 36,
          ),
        ),
        // المدة
        if (message.fileName != null)
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                message.fileName!,
                style: const TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
          ),
      ],
    );
  }
}

// ─── Audio ────────────────────────────────────────────────────────
class _AudioContent extends StatelessWidget {
  final MessageEntity message;
  final bool isMe;
  const _AudioContent({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fg = isMe
        ? theme.colorScheme.onPrimary
        : theme.colorScheme.onSurfaceVariant;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Play button
          Icon(Icons.play_circle_fill_rounded, size: 40, color: fg),
          const SizedBox(width: 8),

          // Waveform placeholder + duration
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Waveform bars placeholder
                Row(
                  children: List.generate(
                    20,
                    (i) => Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        height: (4 + (i % 5) * 4).toDouble(),
                        decoration: BoxDecoration(
                          color: fg.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message.fileName ?? '0:00',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: fg.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── File ─────────────────────────────────────────────────────────
class _FileContent extends StatelessWidget {
  final MessageEntity message;
  final bool isMe;
  const _FileContent({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fg = isMe
        ? theme.colorScheme.onPrimary
        : theme.colorScheme.onSurfaceVariant;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // File icon
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: fg.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(_fileIcon(message.fileName), color: fg, size: 26),
          ),
          const SizedBox(width: 10),

          // Name + size
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.fileName ?? 'File',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: fg,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (message.fileSizeFormatted != null)
                  Text(
                    message.fileSizeFormatted!,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: fg.withOpacity(0.7),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Download
          Icon(Icons.download_rounded, color: fg),
        ],
      ),
    );
  }

  IconData _fileIcon(String? name) {
    final ext = name?.split('.').last.toLowerCase() ?? '';
    return switch (ext) {
      'pdf' => Icons.picture_as_pdf_rounded,
      'doc' || 'docx' => Icons.description_rounded,
      'xls' || 'xlsx' => Icons.table_chart_rounded,
      'zip' || 'rar' => Icons.folder_zip_rounded,
      _ => Icons.insert_drive_file_rounded,
    };
  }
}

// ─── Call ─────────────────────────────────────────────────────────
class _CallBubble extends StatelessWidget {
  final MessageEntity message;
  const _CallBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.call_rounded,
              size: 16,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 6),
            Text(message.content ?? 'Call', style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

// ─── Deleted ──────────────────────────────────────────────────────
class _DeletedBubble extends StatelessWidget {
  final bool isMe;
  const _DeletedBubble({required this.isMe});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          top: 2,
          bottom: 2,
          left: isMe ? 60 : 12,
          right: isMe ? 12 : 60,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.outline.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          '🚫 This message was deleted',
          style: theme.textTheme.bodySmall?.copyWith(
            fontStyle: FontStyle.italic,
            color: theme.colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}

// ─── Reply Preview ────────────────────────────────────────────────
class _ReplyPreview extends StatelessWidget {
  final MessageEntity replyTo;
  final bool isMe;
  const _ReplyPreview({required this.replyTo, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fg = isMe
        ? theme.colorScheme.onPrimary
        : theme.colorScheme.onSurfaceVariant;

    String preview = switch (replyTo.messageType) {
      MessageType.text => replyTo.content ?? '',
      MessageType.image => '📷 Photo',
      // MessageType.video => '🎥 Video',
      MessageType.audio => '🎤 Voice message',
      MessageType.file => '📎 ${replyTo.fileName ?? 'File'}',
      MessageType.call => '📞 Call',
    };

    return Container(
      margin: const EdgeInsets.only(top: 6, left: 6, right: 6),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
        border: Border(left: BorderSide(color: fg, width: 3)),
      ),
      child: Text(
        preview,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.bodySmall?.copyWith(color: fg.withOpacity(0.8)),
      ),
    );
  }
}

// ─── Footer (time + status) ───────────────────────────────────────
class _BubbleFooter extends StatelessWidget {
  final MessageEntity message;
  final bool isMe;
  const _BubbleFooter({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fg = isMe
        ? theme.colorScheme.onPrimary
        : theme.colorScheme.onSurfaceVariant;

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (message.isEdited)
            Text(
              'edited · ',
              style: theme.textTheme.labelSmall?.copyWith(
                color: fg.withOpacity(0.55),
              ),
            ),
          Text(
            _time(message.createdAt),
            style: theme.textTheme.labelSmall?.copyWith(
              color: fg.withOpacity(0.65),
            ),
          ),
          if (isMe) ...[
            const SizedBox(width: 3),
            _StatusIcon(status: message.status, color: fg),
          ],
        ],
      ),
    );
  }

  String _time(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}

class _StatusIcon extends StatelessWidget {
  final MessageStatus status;
  final Color color;
  const _StatusIcon({required this.status, required this.color});

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      MessageStatus.sent => Icon(
        Icons.check,
        size: 14,
        color: color.withOpacity(0.7),
      ),MessageStatus.pending => Icon(
        Icons.access_alarm,
        size: 14,
        color: color.withOpacity(0.7),
      ),
      MessageStatus.delivered => Icon(
        Icons.done_all,
        size: 14,
        color: color.withOpacity(0.7),
      ),
      MessageStatus.read => Icon(
        Icons.done_all,
        size: 14,
        color: Colors.lightBlue[200],
      ),
    };
  }
}
