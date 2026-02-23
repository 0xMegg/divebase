import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/app_nav_bar.dart';

/// 로그인&가입/인증팝업.
class LoginVerifyScreen extends StatelessWidget {
  const LoginVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavBar(
        title: '인증',
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text('이메일/문자 인증 화면'),
        ),
      ),
    );
  }
}
