// lib/features/messages/presentation/pages/messages_page.dart
//
// ─── Design: Deep-space dark theme, glassmorphism bubbles, silk typography ────
// ─── SOLID: Each widget has one responsibility, open for extension ────────────

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/messages_bloc.dart';
import '../bloc/messages_event.dart';
import '../bloc/messages_state.dart';
import '../widgets/message_bubble.dart';
import '../widgets/message_input.dart';
import '../../domain/entities/message_entity.dart';

// ════════════════════════════════════════════════════════════════════
//  DESIGN TOKENS
// ════════════════════════════════════════════════════════════════════

abstract class _ChatColors {
  static const background    = Color(0xFF0D0F14);
  static const surface       = Color(0xFF161820);
  static const surfaceHigh   = Color(0xFF1E2028);
  static const outgoingStart = Color(0xFF6C63FF);
  static const outgoingEnd   = Color(0xFF9D4EDD);
  static const incoming      = Color(0xFF1E2028);
  static const accent        = Color(0xFF6C63FF);
  static const accentSoft    = Color(0x336C63FF);
  static const textPrimary   = Color(0xFFF0F0F5);
  static const textSecondary = Color(0xFF8B8FA8);
  static const textMuted     = Color(0xFF4A4E65);
  static const divider       = Color(0xFF232535);
  static const danger        = Color(0xFFFF5C7A);
  static const online        = Color(0xFF4ADE80);
}

abstract class _ChatRadius {
  static const bubbleMe    = BorderRadius.only(
    topLeft:     Radius.circular(20),
    topRight:    Radius.circular(20),
    bottomLeft:  Radius.circular(20),
    bottomRight: Radius.circular(4),
  );
  static const bubbleThem  = BorderRadius.only(
    topLeft:     Radius.circular(4),
    topRight:    Radius.circular(20),
    bottomLeft:  Radius.circular(20),
    bottomRight: Radius.circular(20),
  );
  static const input = BorderRadius.all(Radius.circular(28));
  static const card  = BorderRadius.all(Radius.circular(16));
}

// ════════════════════════════════════════════════════════════════════
//  PAGE — single-responsibility: wires BLoC + layout
// ════════════════════════════════════════════════════════════════════

class MessagesPage extends StatefulWidget {
  final String  conversationId;
  final String  currentUserId;
  final String  participantName;
  final String? participantAvatar;

  const MessagesPage({
    super.key,
    required this.conversationId,
    required this.currentUserId,
    required this.participantName,
    this.participantAvatar,
  });

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final _scrollController = ScrollController();
  int _prevMessageCount = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    // Start watching messages
    context.read<MessagesBloc>().add(
      WatchMessagesStarted(widget.conversationId),
    );

    // Mark as read on open
    context.read<MessagesBloc>().add(
      MarkAsReadRequested(widget.conversationId, widget.currentUserId),
    );
  }

  /// Paginate — load older messages when user scrolls to top
  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 120) {
      context.read<MessagesBloc>().add(
        LoadMoreMessages(widget.conversationId),
      );
    }
  }

  /// Auto-scroll to bottom only when a NEW message arrives
  /// (not when loading older history at the top)
  void _scrollToBottomIfNeeded(int newCount) {
    if (newCount > _prevMessageCount) {
      _prevMessageCount = newCount;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 320),
            curve: Curves.easeOutCubic,
          );
        }
      });
    } else {
      _prevMessageCount = newCount;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: _ChatColors.background,
        appBar: _ChatAppBar(
          name:   widget.participantName,
          avatar: widget.participantAvatar,
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocConsumer<MessagesBloc, MessagesState>(
                listenWhen: (p, c) =>
                    c.errorMessage != null ||
                    c.messages.length != p.messages.length,
                listener: (ctx, state) {
                  if (state.errorMessage != null) {
                    _ChatSnackbar.show(ctx, state.errorMessage!);
                  }
                  _scrollToBottomIfNeeded(state.messages.length);
                },
                builder: (ctx, state) => _buildBody(state),
              ),
            ),
            _ChatInputBar(
              conversationId: widget.conversationId,
              currentUserId:  widget.currentUserId,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(MessagesState state) {
    if (state.status == MessagesStatus.initial ||
        state.status == MessagesStatus.loading) {
      return const _LoadingIndicator();
    }
    if (state.messages.isEmpty) {
      return const _EmptyChat();
    }
    return _MessagesList(
      state:            state,
      scrollController: _scrollController,
      currentUserId:    widget.currentUserId,
      conversationId:   widget.conversationId,
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  APP BAR
// ════════════════════════════════════════════════════════════════════

class _ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String  name;
  final String? avatar;

  const _ChatAppBar({required this.name, this.avatar});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height + MediaQuery.of(context).padding.top,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        color: _ChatColors.surface,
        border: const Border(
          bottom: BorderSide(color: _ChatColors.divider, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          // Back button
          _AppBarIconButton(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () => Navigator.of(context).maybePop(),
          ),

          // Avatar
          _OnlineAvatar(name: name, avatar: avatar, size: 38),

          const SizedBox(width: 12),

          // Name + status
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: _ChatColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        color: _ChatColors.online,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Online',
                      style: TextStyle(
                        color: _ChatColors.online,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Action buttons
          _AppBarIconButton(
            icon: Icons.videocam_outlined,
            onTap: () {},
          ),
          _AppBarIconButton(
            icon: Icons.call_outlined,
            onTap: () {},
          ),
          _AppBarIconButton(
            icon: Icons.more_vert_rounded,
            onTap: () {},
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  MESSAGES LIST — reverse scroll (newest at bottom)
// ════════════════════════════════════════════════════════════════════

class _MessagesList extends StatelessWidget {
  final MessagesState    state;
  final ScrollController scrollController;
  final String           currentUserId;
  final String           conversationId;

  const _MessagesList({
    required this.state,
    required this.scrollController,
    required this.currentUserId,
    required this.conversationId,
  });

  @override
  Widget build(BuildContext context) {
    // Reversed list so index 0 = newest; scroll position 0 = bottom
    final msgs = state.messages.reversed.toList();

    return ListView.builder(
      controller:      scrollController,
      reverse:         true,          // ← key: newest message at bottom
      padding:         const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      itemCount:       msgs.length + (state.hasMore ? 1 : 0),
      itemBuilder:     (ctx, i) {
        // Load-more spinner at the top (end of reversed list)
        if (i == msgs.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: _LoadingIndicator(),
          );
        }

        final msg     = msgs[i];
        final isMe    = msg.senderId == currentUserId;
        final replyTo = msg.replyToId != null
            ? state.messages.firstWhere(
                (m) => m.id == msg.replyToId,
                orElse: () => msg,
              )
            : null;

        // Date separator: compare with message below (older)
        final showDate = i == msgs.length - 1 ||
            !_isSameDay(msgs[i].createdAt, msgs[i + 1].createdAt);

        return Column(
          children: [
            _ChatMessageTile(
              message:   msg,
              isMe:      isMe,
              replyTo:   replyTo != msg ? replyTo : null,
              onLongPress: () => _showOptions(ctx, msg.id, isMe),
            ),
            if (showDate) _DateChip(date: msg.createdAt),
          ],
        );
      },
    );
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  void _showOptions(BuildContext ctx, String id, bool isMe) {
    showModalBottomSheet(
      context:           ctx,
      backgroundColor:   Colors.transparent,
      isScrollControlled: true,
      builder:           (_) => _MessageOptionsSheet(
        messageId: id,
        isMe:      isMe,
        bloc:      ctx.read<MessagesBloc>(),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  SINGLE MESSAGE TILE
// ════════════════════════════════════════════════════════════════════

class _ChatMessageTile extends StatelessWidget {
  final bool      isMe;
  final MessageEntity message;
final MessageEntity? replyTo;
  final VoidCallback onLongPress;

  const _ChatMessageTile({
    required this.message,
    required this.isMe,
    required this.onLongPress,
    this.replyTo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe) ...[
            _SmallAvatar(senderId: message.senderId!),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: GestureDetector(
              onLongPress: onLongPress,
              child: _BubbleContent(
                message: message,
                isMe:    isMe,
                replyTo: replyTo,
              ),
            ),
          ),
          if (isMe) ...[
            const SizedBox(width: 4),
            _MessageStatus(status: message.status.name),
          ],
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  BUBBLE CONTENT
// ════════════════════════════════════════════════════════════════════

class _BubbleContent extends StatelessWidget {
  final bool    isMe;final MessageEntity message;
final MessageEntity? replyTo;

  const _BubbleContent({
    required this.message,
    required this.isMe,
    this.replyTo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.72,
      ),
      decoration: BoxDecoration(
        gradient: isMe
            ? const LinearGradient(
                colors: [_ChatColors.outgoingStart, _ChatColors.outgoingEnd],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: isMe ? null : _ChatColors.incoming,
        borderRadius: isMe ? _ChatRadius.bubbleMe : _ChatRadius.bubbleThem,
        boxShadow: [
          BoxShadow(
            color: isMe
                ? _ChatColors.outgoingStart.withOpacity(0.25)
                : Colors.black.withOpacity(0.2),
            blurRadius:   12,
            offset:       const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (replyTo != null) _ReplyPreview(replyTo: replyTo, isMe: isMe),
            _MessageBody(message: message, isMe: isMe),
            const SizedBox(height: 4),
            _TimeStamp(createdAt: message.createdAt, isMe: isMe),
          ],
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  MESSAGE BODY (text / image / audio / file / call)
// ════════════════════════════════════════════════════════════════════
class _MessageBody extends StatelessWidget {
  final MessageEntity message;
  final bool isMe;

  const _MessageBody({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {final type = message.messageType;
return switch (type) {
  MessageType.image => _ImageBody(url: message.fileUrl),
  MessageType.audio => _AudioBody(fileName: message.fileName, isMe: isMe),
  MessageType.file  => _FileBody(
      fileName: message.fileName,
      fileSize: message.fileSize,
      isMe: isMe,
    ),
  MessageType.call  => _CallBody(content: message.content, isMe: isMe),
  MessageType.text  => _TextBody(content: message.content ?? '', isMe: isMe),
};  
  }
}

class _TextBody extends StatelessWidget {
  final String content;
  final bool   isMe;
  const _TextBody({required this.content, required this.isMe});

  @override
  Widget build(BuildContext context) => Text(
        content,
        style: TextStyle(
          color:      isMe ? Colors.white : _ChatColors.textPrimary,
          fontSize:   15,
          height:     1.45,
          fontWeight: FontWeight.w400,
        ),
      );
}

class _ImageBody extends StatelessWidget {
  final String? url;
  const _ImageBody({this.url});

  @override
  Widget build(BuildContext context) {
    if (url == null) return const SizedBox.shrink();
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        url!,
        width:  240,
        fit:    BoxFit.cover,
        errorBuilder: (_, __, ___) => const _MediaError(),
      ),
    );
  }
}

class _AudioBody extends StatelessWidget {
  final String? fileName;
  final bool    isMe;
  const _AudioBody({this.fileName, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final fg = isMe ? Colors.white : _ChatColors.textPrimary;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.mic_rounded, color: fg, size: 20),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            fileName ?? 'Voice message',
            style: TextStyle(color: fg, fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _FileBody extends StatelessWidget {
  final String? fileName;
  final int?    fileSize;
  final bool    isMe;
  const _FileBody({this.fileName, this.fileSize, required this.isMe});

  String _formatSize(int? bytes) {
    if (bytes == null) return '';
    if (bytes < 1024) return '${bytes}B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)}KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)}MB';
  }

  @override
  Widget build(BuildContext context) {
    final fg = isMe ? Colors.white : _ChatColors.textPrimary;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.insert_drive_file_rounded, color: fg, size: 22),
        const SizedBox(width: 10),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fileName ?? 'File',
                style: TextStyle(
                  color:      fg,
                  fontSize:   14,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              if (fileSize != null)
                Text(
                  _formatSize(fileSize),
                  style: TextStyle(
                    color:    fg.withOpacity(0.65),
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CallBody extends StatelessWidget {
  final String? content;
  final bool    isMe;
  const _CallBody({this.content, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final fg = isMe ? Colors.white : _ChatColors.textPrimary;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.call_rounded, color: fg, size: 18),
        const SizedBox(width: 8),
        Text(
          content ?? 'Call',
          style: TextStyle(color: fg, fontSize: 14),
        ),
      ],
    );
  }
}

class _MediaError extends StatelessWidget {
  const _MediaError();

  @override
  Widget build(BuildContext context) => Container(
        width:  240,
        height: 120,
        color:  _ChatColors.surfaceHigh,
        child:  const Center(
          child: Icon(Icons.broken_image_rounded,
              color: _ChatColors.textMuted, size: 32),
        ),
      );
}

// ════════════════════════════════════════════════════════════════════
//  REPLY PREVIEW
// ════════════════════════════════════════════════════════════════════

class _ReplyPreview extends StatelessWidget {
  final dynamic replyTo;
  final bool    isMe;
  const _ReplyPreview({required this.replyTo, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final fg = isMe ? Colors.white70 : _ChatColors.textSecondary;
    return Container(
      margin:       const EdgeInsets.only(bottom: 8),
      padding:      const EdgeInsets.all(10),
      decoration:   BoxDecoration(
        color:        (isMe ? Colors.white : _ChatColors.accent)
            .withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
        border:       Border(
          left: BorderSide(
            color: isMe ? Colors.white54 : _ChatColors.accent,
            width: 3,
          ),
        ),
      ),
      child: Text(
        replyTo.content ?? '📎 Attachment',
        style:     TextStyle(color: fg, fontSize: 13),
        maxLines:  2,
        overflow:  TextOverflow.ellipsis,
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  TIMESTAMP & STATUS
// ════════════════════════════════════════════════════════════════════

class _TimeStamp extends StatelessWidget {
  final DateTime createdAt;
  final bool     isMe;
  const _TimeStamp({required this.createdAt, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final h = createdAt.hour.toString().padLeft(2, '0');
    final m = createdAt.minute.toString().padLeft(2, '0');
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        '$h:$m',
        style: TextStyle(
          color:    (isMe ? Colors.white : _ChatColors.textMuted)
              .withOpacity(0.6),
          fontSize: 11,
        ),
      ),
    );
  }
}

class _MessageStatus extends StatelessWidget {
  final String? status;
  const _MessageStatus({this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Icon(
        _icon(),
        size:  14,
        color: status == 'read' ? _ChatColors.accent : _ChatColors.textMuted,
      ),
    );
  }

  IconData _icon() => switch (status) {
        'read'      => Icons.done_all_rounded,
        'delivered' => Icons.done_all_rounded,
        'sent'      => Icons.check_rounded,
        'pending'   => Icons.access_alarm,
        _           => Icons.add,
      };
}

// ════════════════════════════════════════════════════════════════════
//  DATE CHIP
// ════════════════════════════════════════════════════════════════════

class _DateChip extends StatelessWidget {
  final DateTime date;
  const _DateChip({required this.date});

  String _label() {
    final now = DateTime.now();
    if (date.year == now.year && date.month == now.month &&
        date.day == now.day) {
      return 'Today';
    }
    if (date.year == now.year && date.month == now.month &&
        date.day == now.day - 1) {
      return 'Yesterday';
    }
    return '${date.day} / ${date.month} / ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Container(
          padding:    const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          decoration: BoxDecoration(
            color:        _ChatColors.surfaceHigh,
            borderRadius: BorderRadius.circular(20),
            border:       Border.all(color: _ChatColors.divider, width: 0.5),
          ),
          child: Text(
            _label(),
            style: const TextStyle(
              color:      _ChatColors.textMuted,
              fontSize:   12,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  CHAT INPUT BAR  (Single Responsibility: compose & send)
// ════════════════════════════════════════════════════════════════════

class _ChatInputBar extends StatefulWidget {
  final String conversationId;
  final String currentUserId;

  const _ChatInputBar({
    required this.conversationId,
    required this.currentUserId,
  });

  @override
  State<_ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<_ChatInputBar> {
  final _controller  = TextEditingController();
  final _focusNode   = FocusNode();
  bool  _hasText     = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final has = _controller.text.trim().isNotEmpty;
      if (has != _hasText) setState(() => _hasText = has);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final bloc  = context.read<MessagesBloc>();
    final reply = bloc.state.replyToId;

    bloc.add(SendTextRequested(
      conversationId: widget.conversationId,
      senderId:       widget.currentUserId,
      content:        text,
      replyToId:      reply,
    ));

    _controller.clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesBloc, MessagesState>(
      buildWhen: (p, c) => p.replyToId != c.replyToId,
      builder: (ctx, state) {
        return Container(
          decoration: const BoxDecoration(
            color: _ChatColors.surface,
            border: Border(
              top: BorderSide(color: _ChatColors.divider, width: 0.5),
            ),
          ),
          padding: EdgeInsets.only(
            left:   12,
            right:  12,
            top:    8,
            bottom: MediaQuery.of(context).viewInsets.bottom > 0
                ? 8
                : MediaQuery.of(context).padding.bottom + 8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state.replyToId != null) _ReplyBar(
                replyId: state.replyToId!,
                messages: state.messages,
                onCancel: () => ctx.read<MessagesBloc>().add(
                  const ReplyToMessageSelected(null),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Attachment
                  _InputIconButton(
                    icon:  Icons.add_circle_outline_rounded,
                    onTap: () {},
                  ),

                  const SizedBox(width: 8),

                  // Text field
                  Expanded(
                    child: Container(
                      constraints: const BoxConstraints(maxHeight: 120),
                      decoration: BoxDecoration(
                        color:        _ChatColors.surfaceHigh,
                        borderRadius: _ChatRadius.input,
                        border:       Border.all(
                          color: _ChatColors.divider,
                          width: 0.5,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextField(
                              controller:    _controller,
                              focusNode:     _focusNode,
                              maxLines:      null,
                              textInputAction: TextInputAction.newline,
                              style: const TextStyle(
                                color:    _ChatColors.textPrimary,
                                fontSize: 15,
                                height:   1.4,
                              ),
                              decoration: const InputDecoration(
                                hintText:       'Message…',
                                hintStyle:      TextStyle(
                                  color:    _ChatColors.textMuted,
                                  fontSize: 15,
                                ),
                                border:         InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical:   10,
                                ),
                              ),
                            ),
                          ),
                          // Emoji
                          Padding(
                            padding: const EdgeInsets.only(right: 6, bottom: 6),
                            child: _InputIconButton(
                              icon:  Icons.emoji_emotions_outlined,
                              onTap: () {},
                              size:  20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Send / mic
                  _SendButton(hasText: _hasText, onSend: _send),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  REPLY BAR (shown above input when replying)
// ════════════════════════════════════════════════════════════════════

class _ReplyBar extends StatelessWidget {
  final String   replyId;
  final List<dynamic> messages;
  final VoidCallback  onCancel;

  const _ReplyBar({
    required this.replyId,
    required this.messages,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final msg = messages.cast<dynamic>().firstWhere(
          (m) => m.id == replyId,
          orElse: () => null,
        );

    return Container(
      margin:     const EdgeInsets.only(bottom: 8),
      padding:    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color:        _ChatColors.accentSoft,
        borderRadius: BorderRadius.circular(12),
        border:       const Border(
          left: BorderSide(color: _ChatColors.accent, width: 3),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Replying to',
                  style: TextStyle(
                    color:      _ChatColors.accent,
                    fontSize:   12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  msg?.content ?? '📎 Attachment',
                  style: const TextStyle(
                    color:    _ChatColors.textSecondary,
                    fontSize: 13,
                  ),
                  maxLines:  1,
                  overflow:  TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onCancel,
            child: const Icon(
              Icons.close_rounded,
              color: _ChatColors.textSecondary,
              size:  20,
            ),
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  SEND BUTTON
// ════════════════════════════════════════════════════════════════════

class _SendButton extends StatelessWidget {
  final bool       hasText;
  final VoidCallback onSend;
  const _SendButton({required this.hasText, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hasText ? onSend : () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width:  46,
        height: 46,
        decoration: BoxDecoration(
          gradient: hasText
              ? const LinearGradient(
                  colors: [_ChatColors.outgoingStart, _ChatColors.outgoingEnd],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color:        hasText ? null : _ChatColors.surfaceHigh,
          shape:        BoxShape.circle,
          boxShadow: hasText
              ? [
                  BoxShadow(
                    color:      _ChatColors.outgoingStart.withOpacity(0.4),
                    blurRadius: 12,
                    offset:     const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Icon(
          hasText ? Icons.send_rounded : Icons.mic_rounded,
          color: hasText ? Colors.white : _ChatColors.textMuted,
          size:  20,
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  BOTTOM SHEET — message options
// ════════════════════════════════════════════════════════════════════

class _MessageOptionsSheet extends StatelessWidget {
  final String        messageId;
  final bool          isMe;
  final MessagesBloc  bloc;

  const _MessageOptionsSheet({
    required this.messageId,
    required this.isMe,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: _ChatColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              width:  40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color:        _ChatColors.divider,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            _OptionTile(
              icon:  Icons.reply_rounded,
              label: 'Reply',
              onTap: () {
                bloc.add(ReplyToMessageSelected(messageId));
                Navigator.pop(context);
              },
            ),

            _OptionTile(
              icon:  Icons.copy_rounded,
              label: 'Copy',
              onTap: () => Navigator.pop(context),
            ),

            if (isMe) _OptionTile(
              icon:  Icons.delete_outline_rounded,
              label: 'Delete',
              color: _ChatColors.danger,
              onTap: () {
                bloc.add(DeleteMessageRequested(messageId));
                Navigator.pop(context);
              },
            ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final IconData    icon;
  final String      label;
  final VoidCallback onTap;
  final Color?      color;

  const _OptionTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final fg = color ?? _ChatColors.textPrimary;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      leading: Icon(icon, color: fg, size: 22),
      title: Text(
        label,
        style: TextStyle(color: fg, fontSize: 15, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  SMALL AVATAR (for incoming messages)
// ════════════════════════════════════════════════════════════════════

class _SmallAvatar extends StatelessWidget {
  final String senderId;
  const _SmallAvatar({required this.senderId});

  @override
  Widget build(BuildContext context) => CircleAvatar(
        radius: 14,
        backgroundColor: _ChatColors.surfaceHigh,
        child: Text(
          senderId.isNotEmpty ? senderId[0].toUpperCase() : '?',
          style: const TextStyle(
            color:    _ChatColors.textSecondary,
            fontSize: 11,
          ),
        ),
      );
}

// ════════════════════════════════════════════════════════════════════
//  ONLINE AVATAR
// ════════════════════════════════════════════════════════════════════

class _OnlineAvatar extends StatelessWidget {
  final String  name;
  final String? avatar;
  final double  size;
  const _OnlineAvatar({required this.name, this.avatar, required this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: size / 2,
          backgroundImage: avatar != null ? NetworkImage(avatar!) : null,
          backgroundColor: _ChatColors.surfaceHigh,
          child: avatar == null
              ? Text(
                  name.isNotEmpty ? name[0].toUpperCase() : '?',
                  style: const TextStyle(
                    color:      _ChatColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : null,
        ),
        Positioned(
          right:  0,
          bottom: 0,
          child: Container(
            width:      10,
            height:     10,
            decoration: BoxDecoration(
              color:  _ChatColors.online,
              shape:  BoxShape.circle,
              border: Border.all(color: _ChatColors.surface, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}

// ════════════════════════════════════════════════════════════════════
//  SMALL ATOMS
// ════════════════════════════════════════════════════════════════════

class _AppBarIconButton extends StatelessWidget {
  final IconData     icon;
  final VoidCallback onTap;
  final double       size;
  const _AppBarIconButton({
    required this.icon,
    required this.onTap,
    this.size = 22,
  });

  @override
  Widget build(BuildContext context) => IconButton(
        icon:  Icon(icon, color: _ChatColors.textSecondary, size: size),
    
        splashRadius: 20, onPressed: onTap,
      );
}

class _InputIconButton extends StatelessWidget {
  final IconData     icon;
  final VoidCallback onTap;
  final double       size;
  const _InputIconButton({
    required this.icon,
    required this.onTap,
    this.size = 22,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Icon(icon, color: _ChatColors.textMuted, size: size),
      );
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) => const Center(
        child: SizedBox(
          width:  24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color:       _ChatColors.accent,
          ),
        ),
      );
}

class _EmptyChat extends StatelessWidget {
  const _EmptyChat();

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding:    const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color:        _ChatColors.surfaceHigh,
                shape:        BoxShape.circle,
              ),
              child: const Icon(
                Icons.chat_bubble_outline_rounded,
                color: _ChatColors.textMuted,
                size:  36,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'No messages yet',
              style: TextStyle(
                color:      _ChatColors.textSecondary,
                fontSize:   16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Say hello! 👋',
              style: TextStyle(color: _ChatColors.textMuted, fontSize: 14),
            ),
          ],
        ),
      );
}

// ════════════════════════════════════════════════════════════════════
//  SNACK BAR HELPER
// ════════════════════════════════════════════════════════════════════

abstract class _ChatSnackbar {
  static void show(BuildContext ctx, String msg) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content:          Text(msg),
        backgroundColor:  _ChatColors.danger,
        behavior:         SnackBarBehavior.floating,
        shape:            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(12),
      ),
    );
  }
}