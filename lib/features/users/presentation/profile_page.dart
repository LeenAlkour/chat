import 'package:chato/features/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:chato/features/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'package:chato/features/auth/presentation/logic/profile_bloc/bloc/profile_bloc.dart';
import 'package:chato/features/auth/presentation/logic/profile_bloc/bloc/profile_event.dart';
import 'package:chato/features/auth/presentation/logic/profile_bloc/bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          final user = state.user;
          final isLoading = state.isLoading || state.isUploading;
          final error = state.error;

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // صورة الملف الشخصي مع دائرة وظل
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: user?.avatarUrl != null
                              ? NetworkImage(user!.avatarUrl!)
                              : const NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkNQw7GCBBS1Jht_56B9wAPlMwTZi4i4Bkgg&s',
                                ) as ImageProvider,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () async {
                            final picker = ImagePicker();
                            final pickedFile = await picker.pickImage(
                              source: ImageSource.gallery,
                            );

                            if (pickedFile != null) {
                              context.read<ProfileBloc>().add(
                                    ProfileEvent.updateProfilePicture(
                                      pickedFile.path,
                                    ),
                                  );
                            }
                          },
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.deepPurple,
                            child: const Icon(Icons.edit, color: Colors.white, size: 22),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // البريد الإلكتروني
                  Text(
                    user?.email ?? "غير معروف",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 16),

                  // رسالة خطأ
                  if (error != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.error_outline, color: Colors.red, size: 20),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              error,
                              style: const TextStyle(color: Colors.red, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 16),

                  // زر تسجيل الخروج
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                         context.read<AuthBloc>().add(AuthEvent.logoutRequested());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      icon: const Icon(Icons.logout, size: 22),
                      label: const Text(
                        "تسجيل الخروج",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  // مؤشر تحميل
                  if (isLoading) ...[
                    const SizedBox(height: 24),
                    const CircularProgressIndicator(
                      color: Colors.deepPurple,
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}