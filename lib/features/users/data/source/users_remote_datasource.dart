// lib/features/users/data/source/users_remote_datasource.dart
//
// مسؤول فقط عن جلب كل المستخدمين من Supabase
// (لا يمكن استخدام PowerSync هنا لأنه لا يزامن كل المستخدمين)

import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_friend_model.dart';

abstract class UsersRemoteDataSource {
  Future<List<UserFriendModel>> getAllUsers(String currentUserId);
}

class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  final SupabaseClient _supabase;

  UsersRemoteDataSourceImpl(this._supabase);

  @override
  Future<List<UserFriendModel>> getAllUsers(String currentUserId) async {
    final data = await _supabase
        .from('users')
        .select('id, username, avatar_url, full_name, is_online')
        .neq('id', currentUserId)  // استثني نفسك
        .order('username');

    return (data as List)
        .map((row) => UserFriendModel.fromSupabase(row as Map<String, dynamic>))
        .toList();
  }
}
