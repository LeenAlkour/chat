import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_friend_model.dart';

abstract class FriendshipsRemoteDataSource {
  Future<List<UserFriendModel>> getFriendships(String currentUserId);
  void subscribeToUpdates(
    String currentUserId,
    void Function(UserFriendModel) onUpdate,
  );

  Future<void> sendRequest(String currentUserId, String otherUserId);

  Future<void> acceptRequest(String currentUserId, String otherUserId);

  Future<void> rejectRequest(String currentUserId, String otherUserId);
}

class FriendshipsRemoteDataSourceImpl implements FriendshipsRemoteDataSource {
  FriendshipsRemoteDataSourceImpl();

  // جلب جميع الصداقات
  @override
  Future<List<UserFriendModel>> getFriendships(String currentUserId) async {
    // ✅ تمت إزالة .execute() — الآن يُرجع البيانات مباشرةً
    final List<dynamic> data = await Supabase.instance.client
        .from('user_friendships_view')
        .select();

    final List<UserFriendModel> users = data
        .map(
          (e) => UserFriendModel.fromJson(
            e as Map<String, dynamic>,
            currentUserId,
          ),
        )
        .toList();

    return users;
  }

  @override
  // الاشتراك في التغييرات
  void subscribeToUpdates(
    String currentUserId,
    void Function(UserFriendModel) onUpdate,
  ) {
    final channel = Supabase.instance.client.channel('public:friendships');

    channel.onPostgresChanges(
      event: PostgresChangeEvent.all,
      schema: 'public',
      table: 'friendships',
      callback: (payload) async {
        final record = payload.newRecord;

        if (record.isEmpty) return;

        final requesterId = record['requester_id'];
        final addresseeId = record['addressee_id'];

        if (requesterId == null || addresseeId == null) return;

        // 🔥 تحديد المستخدم الآخر
        final otherUserId = requesterId == currentUserId
            ? addresseeId
            : requesterId;

        // 🔥 جلب البيانات الكاملة من الـ view
        final res = await Supabase.instance.client
            .from('user_friendships_view')
            .select()
            .eq('id', otherUserId)
            .maybeSingle();

        if (res == null) return;

        onUpdate(UserFriendModel.fromJson(res, currentUserId));
      },
    );

    channel.subscribe();
  }

  @override
  Future<void> sendRequest(String currentUserId, String otherUserId) async {
    await Supabase.instance.client.from('friendships').insert({
      'requester_id': currentUserId,
      'addressee_id': otherUserId,
      'status': 'pending',
    });
  }

  @override
  Future<void> acceptRequest(String currentUserId, String otherUserId) async {
    await Supabase.instance.client
        .from('friendships')
        .update({'status': 'accepted'})
        .match({'requester_id': otherUserId, 'addressee_id': currentUserId});
  }

  @override
  Future<void> rejectRequest(String currentUserId, String otherUserId) async {
    await Supabase.instance.client.from('friendships').delete().match({
      'requester_id': otherUserId,
      'addressee_id': currentUserId,
    });
  }
}
