import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/app_alert.dart';
import '../../../widgets/app_nav_bar.dart';

/// 마이페이지/고객지원/회원탈퇴.
class MypageWithdrawScreen extends StatelessWidget {
  const MypageWithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavBar(
        title: '회원탈퇴',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('탈퇴 시 데이터가 삭제됩니다. 진행하시겠습니까?'),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => _showConfirmDialog(context),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.noteWarning,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('탈퇴하기'),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmDialog(BuildContext context) {
    showAppAlert(
      context: context,
      title: '진행 여부',
      message: '정말 탈퇴하시겠습니까?',
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('취소'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            context.go('/login');
          },
          child: const Text('확인'),
        ),
      ],
    );
  }
}
