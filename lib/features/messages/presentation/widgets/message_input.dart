// lib/features/messages/presentation/widgets/message_input.dart

import 'package:chato/features/messages/domain/entities/message_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/messages_bloc.dart';
import '../bloc/messages_event.dart';
import '../bloc/messages_state.dart';

class MessageInput extends StatefulWidget {
  final String conversationId;
  final String currentUserId;

  const MessageInput({
    super.key,
    required this.conversationId,
    required this.currentUserId,
  });

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() => _hasText = _controller.text.trim().isNotEmpty);
    });
  }

  void _showAttachmentPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const CircleAvatar(child: Icon(Icons.image)),
                title: const Text('Photo'),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: image picker → upload → sendMedia
                  context.read<MessagesBloc>().add(
                    SendMediaRequested(
                      conversationId: widget.conversationId,
                      senderId: widget.currentUserId,
                      messageType: MessageType.image,
                      fileUrl: 'https://placeholder.com/img.jpg',
                    ),
                  );
                },
              ),
              ListTile(
                leading: const CircleAvatar(child: Icon(Icons.videocam)),
                title: const Text('Video'),
                onTap: () {
                  Navigator.pop(context); /* TODO */
                },
              ),
              ListTile(
                leading: const CircleAvatar(child: Icon(Icons.mic)),
                title: const Text('Audio'),
                onTap: () {
                  Navigator.pop(context); /* TODO */
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.insert_drive_file),
                ),
                title: const Text('File'),
                onTap: () {
                  Navigator.pop(context); /* TODO */
                },
              ),
            ],
          ),
        ),
      ),
    );
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

    final replyToId = context.read<MessagesBloc>().state.replyToId;

    context.read<MessagesBloc>().add(
      SendTextRequested(
        conversationId: widget.conversationId,
        senderId: widget.currentUserId,
        content: text,
        replyToId: replyToId,
      ),
    );

    _controller.clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<MessagesBloc, MessagesState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Reply banner
            if (state.replyToId != null)
              _ReplyBanner(
                message: state.messages.firstWhere(
                  (m) => m.id == state.replyToId,
                  orElse: () => state.messages.first,
                ),
                onCancel: () => context.read<MessagesBloc>().add(
                  const ReplyToMessageSelected(null),
                ),
              ),

            // Input row
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Row(
                  children: [
                    // Attachment
                    IconButton(
                      icon: const Icon(Icons.attach_file),
                      onPressed: () => _showAttachmentPicker(context),
                    ),

                    // Text field
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        maxLines: 5,
                        minLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          hintText: 'Message...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: theme.colorScheme.surfaceVariant,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 6),

                    // Send / Mic
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: _hasText
                          ? IconButton.filled(
                              key: const ValueKey('send'),
                              icon: const Icon(Icons.send_rounded),
                              onPressed: state.isSending ? null : _send,
                            )
                          : IconButton(
                              key: const ValueKey('mic'),
                              icon: const Icon(Icons.mic_none_rounded),
                              onPressed: () {}, // TODO: voice
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ─── Reply Banner ─────────────────────────────────────────────────
class _ReplyBanner extends StatelessWidget {
  final dynamic message;
  final VoidCallback onCancel;

  const _ReplyBanner({required this.message, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: theme.colorScheme.surfaceVariant,
      child: Row(
        children: [
          Icon(Icons.reply, size: 18, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message.content ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 18),
            onPressed: onCancel,
          ),
        ],
      ),
    );
  }
}
