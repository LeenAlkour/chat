import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'error_messages.dart';
import 'failure.dart';

class ErrorHandler {
  static Failure handle(dynamic error) {
    if (error is SocketException) {
      return const Failure(message: ErrorMessages.noInternet);
    }

    if (error is AuthException) {
      return _handleAuthError(error);
    }

    if (error is PostgrestException) {
      return Failure(
        code: error.code != null ? int.tryParse(error.code!) : null,
        message: error.message,
      );
    }

    if (error is StorageException) {
      return Failure(message: error.message);
    }

    return const Failure(message: ErrorMessages.unknown);
  }

  static Failure _handleAuthError(AuthException error) {
    switch (error.statusCode) {
      case '400':
        return const Failure(code: 400, message: ErrorMessages.badRequest);
      case '401':
        return const Failure(code: 401, message: ErrorMessages.unauthorized);
      case '429':
        return const Failure(code: 429, message: ErrorMessages.tooManyRequests);
      default:
        return Failure(message: error.message);
    }
  }
}
