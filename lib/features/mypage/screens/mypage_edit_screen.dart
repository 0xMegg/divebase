import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/app_nav_bar.dart';

/// 마이페이지/기본정보 수정.
class MypageEditScreen extends StatelessWidget {
  const MypageEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavBar(
        title: '기본정보 수정',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Text('닉네임, 성별, 생년월일 등 (profiles 연동)'),
      ),
    );
  }
}
