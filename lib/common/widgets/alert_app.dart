// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// enum ToastType { success, error, warning, info }

// class AppAlert {
//   AppAlert._();

//   static void show(
//     BuildContext context, {
//     required String title,
//     String? description,
//     String? action,
//     ToastType? type,
//     IconData icon = Icons.info_outline,
//     Color? iconColor,
//     Color? themeColor,
//     Color backgroundColor = Colors.white,
//     Color shadowColor = const Color(0xFFCCCCCC),
//     double iconSize = 28,
//     Position toastPosition = Position.top,
//     TextDirection textDirection = TextDirection.rtl,
//     AnimationType animationType = AnimationType.fromTop,
//     double borderRadius = 12,
//     bool autoDismiss = true,
//     Duration toastDuration = const Duration(seconds: 3),
//     bool displayCloseButton = true,
//     bool displayIcon = true,
//     bool enableIconAnimation = true,
//     bool disableToastAnimation = false,
//     bool inheritThemeColors = false,
//     VoidCallback? actionHandler,
//     VoidCallback? onToastClosed,
//   }) {
//     DelightToastBar(
//       title: Text(title),
//       description: description != null ? Text(description) : null,
//       action: action != null ? Text(action) : null,
//       icon: icon,
//       iconColor: iconColor ?? themeColor ?? Colors.purple,
//       themeColor: themeColor ?? Colors.purple,
//       backgroundColor: backgroundColor,
//       shadowColor: shadowColor,
//       iconSize: iconSize,
//       toastPosition: toastPosition,
//       textDirection: textDirection,
//       animationType: animationType,
//       borderRadius: borderRadius,
//       autoDismiss: autoDismiss,
//       toastDuration: toastDuration,
//       displayCloseButton: displayCloseButton,
//       displayIcon: displayIcon,
//       enableIconAnimation: enableIconAnimation,
//       disableToastAnimation: disableToastAnimation,
//       inheritThemeColors: inheritThemeColors,
//       actionHandler: actionHandler,
//       onToastClosed: onToastClosed,
//     ).show(context);
//   }
// }
