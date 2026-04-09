import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/conversation_entity.dart';

abstract class ConversationsRepository {
  /// قراءة أولى عند فتح الصفحة
  Future<Either<Failure, List<ConversationEntity>>> getConversations();

  /// stream يُصدر القائمة كاملة محدّثة عند أي تغيير
  /// PowerSync يتولى المزامنة — لا نحتاج ConversationChange
  Stream<Either<Failure, List<ConversationEntity>>> watchConversations();

  /// كتابة محلية فورية — PowerSync يرفعها للسيرفر تلقائياً
  Future<Either<Failure, void>> sendMessage({
    required String conversationId,
    required String content,
    String messageType,
    String? replyToId,
  });

  Future<Either<Failure, void>> markAsRead(String conversationId);
  Future<Either<Failure, void>> saveDraft(String conversationId, String text);
  Future<Either<Failure, void>> toggleMute(
    String conversationId, {
    required bool muted,
  });
}
