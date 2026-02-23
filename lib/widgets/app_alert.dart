import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Figma Alert 스타일 (로그인/가입/마이페이지 Alert).
Future<T?> showAppAlert<T>({
  required BuildContext context,
  String? title,
  String? message,
  List<Widget>? actions,
}) {
  return showDialog<T>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: AppColors.surface,
      title: title != null ? Text(title) : null,
      content: message != null ? Text(message) : null,
      actions: actions ??
          [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('확인'),
            ),
          ],
    ),
  );
}
