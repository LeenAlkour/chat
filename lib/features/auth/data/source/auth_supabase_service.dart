import 'dart:io';

import 'package:chato/features/auth/data/models/user_model.dart';
import 'package:chato/features/auth/presentation/logic/auth_bloc/auth_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthSupabaseService {
  Future<void> signIn(UserModel user);
  Future<void> signUp(UserModel user);
  Future<void> signOut();
  Future<bool> isLogedIn(UserModel user);
  Future<UserModel?> getCurrentUser();
  Future<String> updateProfilePicture(String filePath);
}

class AuthSupabaseServiceImpl implements AuthSupabaseService {
  @override
  Future<void> signIn(UserModel user) async {
    await Supabase.instance.client.auth.signInWithPassword(
      email: user.email,
      password: user.password!,
    );
  }

  @override
  Future<void> signUp(UserModel user) async {
    print(user);
    await Supabase.instance.client.auth.signUp(
      email: user.email!,
      password: user.password!,
      data: {'username': user.username},
    );
  }

  @override
  Future<bool> isLogedIn(UserModel user) async {
    return Supabase.instance.client.auth.currentUser != null ? true : false;
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final res = await Supabase.instance.client.auth.getUser();
    final user = res.user;
    if (user == null) return null;

    final data = await Supabase.instance.client
        .from('users')
        .select()
        .eq('id', user.id)
        .single();

    if (data == null) return null;

    return UserModel(
      id: user.id,
      email: user.email,
      username: data['username'],
      avatarUrl: data['avatar_url'], 
    );
  }

  Session? getSession() {
    return Supabase.instance.client.auth.currentSession;
  }

  @override
  Future<void> signOut() async {
    await Supabase.instance.client.auth.signOut();
  }

  @override
  Future<String> updateProfilePicture(String filePath) async {
    final user = Supabase.instance.client.auth.currentUser;

    if (user == null) {
      throw AuthFailure('User not found');
    }

    final file = File(filePath);

    final path = "profile_pictures/${user.id}.jpg";

    await Supabase.instance.client.storage
        .from('avatars')
        .upload(path, file, fileOptions: const FileOptions(upsert: true));

    final imageUrl = Supabase.instance.client.storage
        .from('avatars')
        .getPublicUrl(path);

    // تحديث جدول users
    await Supabase.instance.client
        .from('users')
        .update({'avatar_url': imageUrl})
        .eq('id', user.id);

    return imageUrl;
  }
}
