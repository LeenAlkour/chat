import 'package:chato/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/conversation_change.dart';
import '../entities/conversation_entity.dart';

abstract class ConversationsRepository {
  /// جلب جميع المحادثات للمستخدم الحالي — يُستدعى مرة واحدة عند الفتح
  Future<Either<Failure, List<ConversationEntity>>> getConversations();

  /// stream يُصدر فقط التغييرات الجزئية — لا يُعيد جلب القائمة
  /// كل حدث يصف ما تغيّر بالضبط (رسالة جديدة، unread، presence)
  Stream<Either<Failure, ConversationChange>> watchChanges();

  /// إلغاء جميع قنوات Realtime
  Future<void> dispose();
}
