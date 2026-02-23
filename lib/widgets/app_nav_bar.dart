import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Figma Title / Bars / Nav Bars: Standard (기본 #001BB7, 로그인/모달은 #0046FF).
class AppNavBar extends StatelessWidget implements PreferredSizeWidget {
  const AppNavBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.backgroundColor,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.primaryDark,
      foregroundColor: Colors.white,
      title: Text(title),
      leading: leading,
      actions: actions,
      elevation: 0,
    );
  }
}
