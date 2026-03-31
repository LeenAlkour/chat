import 'package:chato/common/widgets/spacing/spacing.dart';
import 'package:chato/core/router/routes.dart';
import 'package:chato/core/theme/app_colors.dart';
import 'package:chato/features/auth/domain/entities/user_entity.dart';
import 'package:chato/features/auth/presentation/logic/auth_bloc/auth_bloc.dart';
import 'package:chato/features/auth/presentation/logic/auth_bloc/auth_event.dart';
import 'package:chato/features/auth/presentation/logic/auth_bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextInput("Username", Icons.person, _userNameController),

              verticalSpace(20),
              _buildTextInput("Email", Icons.person, _emailController),

              verticalSpace(20),
              _buildTextInput("Password", Icons.person, _passwordController),
              verticalSpace(20),
              _buildRegisterButton(),
              _buildLoginPrompt(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextInput(
    String hint,
    IconData icon,
    TextEditingController controller, {
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.sentMassageInput,
        borderRadius: BorderRadius.circular(25.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          horizontalSpace(10),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterButton() {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          authenticated: () {},
          failure: (message) {
            print(message);

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          },
        );
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state is AuthLoading
              ? null
              : () {
                  context.read<AuthBloc>().add(
                    AuthEvent.registerRequested(
                      user: UserEntity(
                        userName: _userNameController.text.trim(),
                        id: '',
                        password: _passwordController.text.trim(),
                        email: _emailController.text.trim(),
                      ),
                    ),
                  );
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 15.h),
          ),
          child: state is AuthLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text("Register", style: TextStyle(color: Colors.grey)),
        );
      },
    );
  }

  Widget _buildLoginPrompt() {
    return Center(
      child: GestureDetector(
        onTap: () {
          context.goNamed(Routes.loginPage);
        },
        child: RichText(
          text: TextSpan(
            text: 'Already have an account? ',
            style: TextStyle(color: Colors.grey),
            children: [
              TextSpan(
                text: 'Login',
                style: TextStyle(color: AppColors.buttonColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
